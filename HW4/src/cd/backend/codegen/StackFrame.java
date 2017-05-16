package cd.backend.codegen;

import cd.backend.codegen.RegisterManager.Register;
import cd.ir.Ast;
import cd.ir.Ast.MethodDecl;
import cd.ir.Ast.Var;
import cd.ir.Ast.VarDecl;
import cd.ir.Symbol.VariableSymbol.Kind;

import static cd.backend.codegen.RegisterManager.STACK_REG;
import static cd.backend.codegen.RegisterManager.BASE_REG;

import java.util.HashMap;
import java.util.List;
import java.util.Map;



// basebpointer address

// stack pointer address

// stack size

// Register / temp address in stack getMemory()

// local variables get and set

// ebp + 4 = return address
// ebp + 8 = target address
// ebp +12 = arg 1
// ebp +16 = arg 2 ...


public class StackFrame {
	
	protected final AstCodeGenerator cg;
		
	// 
	private int baseOffset; // in Byte relative to %ebp
	private int nLocalVar;

	private Map<String, Integer> localsOffsetMap = new HashMap<String, Integer>();
	private Map<String, Integer> parametersOffsetMap = new HashMap<String, Integer>();
	
	private MethodDecl methodDecl;
	private boolean regsSaved[];

	
	StackFrame(AstCodeGenerator astCodeGenerator, MethodDecl md) {
		cg = astCodeGenerator;
		methodDecl = md;
		
		// set parameter location
		int paramOffset = 8;
		for (String argName: methodDecl.argumentNames){
			paramOffset += 4;
			parametersOffsetMap.put(argName, paramOffset);
		}
		
	}
	
	/**
	 * sets up the frame:
	 * 1) Establish new base pointer
	 * 2) save callee saved registers
	 * 3) allocate room for local vars on stack
	 */
	public void setUpFrame(){
		List<Ast> localsList = methodDecl.decls().children();
		nLocalVar = localsList.size();
		
		// store old ebp
		cg.emit.emitComment("store old ebp, set uf new ebp");
		cg.emit.emit("pushl", BASE_REG);
		cg.emit.emit("movl", STACK_REG, BASE_REG);
		
				
		// safe callee-saved Registers to stack
		regsSaved = new boolean[3]; // esi, edi, ebx
		int i = 0;
		for (Register r: RegisterManager.CALLEE_SAVE){
			if (cg.rm.isInUse(r)){
				regsSaved[i] = true;
				cg.emit.emit("pushl", r.getRepr());
				cg.rm.releaseRegister(r);
				baseOffset -= 4;
			}
			i++;
		}
		
		// set local variables 
		cg.emit.emitComment("set local variables:");
		for (Ast l: localsList){
			baseOffset -= 4;
			VarDecl vd = (VarDecl)l;
			localsOffsetMap.put(vd.name, baseOffset);
			cg.emit.emitComment("variable "+vd.name);
			cg.emit.emit("pushl", "$0");
		}
		
	}
	
	/**
	 * tears down the frame
	 * 1) deallocation: free local stace space
	 * 2) restore callee-saved registers
	 * 3) restore old ebp
	 * 4) return
	 */
	public void tearDownFrame() {
		// deallocate local variable space
		cg.emit.emit("addl", "$"+4*nLocalVar, "%esp");
		
		// restore callee saved Registers from stack
		for (int j = 2; j <= 0 ; j--){
			if (regsSaved[j]){
				Register restoreReg = RegisterManager.CALLEE_SAVE[j];
				cg.emit.emit("popl", restoreReg);
				cg.rm.setToUsed(restoreReg);
			}
		}
		
		// restore old ebp
		cg.emit.emitComment("restore old ebp");
		cg.emit.emit("movl", BASE_REG, STACK_REG);
		cg.emit.emit("popl", BASE_REG);
	
		//return
		cg.emit.emitRaw("ret");
	}
	
	public String target(){
		String t = "8(%ebp)";
		return t;
	}
	
	
	
	public Register getLocalVar(String varName){
		Integer offset = localsOffsetMap.get(varName);
		if (offset == null){
			return null;
		}
		Register reg = getRegister();
		cg.emit.emit("movl", getAddr(offset), reg);
		return reg;
	}
	
	public Register getVariable(Var variable){
		Register reg = getRegister();
		if (variable.sym.kind.equals(Kind.LOCAL)) {
			Integer offset = localsOffsetMap.get(variable.name);
			if (offset == null){
				releaseRegister(reg);
				return null;
			}
			cg.emit.emit("movl", getAddr(offset), reg);
			return reg;
		} else if (variable.sym.kind.equals(Kind.PARAM)){
			Integer offset = parametersOffsetMap.get(variable.name);
			if (offset == null){
				releaseRegister(reg);
				return null;
			}
			cg.emit.emit("movl", getAddr(offset), reg);
			return reg;
		} else if (variable.sym.kind.equals(Kind.FIELD)){
			ObjectShape objectShape = cg.objShapeManager.get(cg.sg.currentClass.classDecl.name);
			cg.emit.emit("movl", target(), reg);
			int offset = objectShape.getOffset(variable.name);
			String location = getAddr(reg.getRepr(), offset);
			cg.emit.emit("movl", location, reg.getRepr());
			return reg;
		}
		releaseRegister(reg);
		return null;
	}
	
	public void assignToVar(Var variable, Register rightReg){
		if (variable.sym.kind.equals(Kind.LOCAL)) {
			Integer offset = localsOffsetMap.get(variable.name);
			if (offset == null){
				return;
			}
			cg.emit.emit("movl", rightReg, getAddr(offset));
		} else if (variable.sym.kind.equals(Kind.PARAM)){
			Integer offset = parametersOffsetMap.get(variable.name);
			if (offset == null){
				return;
			}
			cg.emit.emit("movl", rightReg, getAddr(offset));
		} else if (variable.sym.kind.equals(Kind.FIELD)){
			ObjectShape objectShape = cg.objShapeManager.get(cg.sg.currentClass.classDecl.name);
			Register targetReg = getRegister();
			cg.emit.emit("movl", target(), targetReg);
			int offset = objectShape.getOffset(variable.name);
			String location = getAddr(targetReg.getRepr(), offset);
			cg.emit.emit("movl", rightReg, location);
			releaseRegister(targetReg);
		}
		return;
	}
	
	public String getAddr(Integer offset){
		return getAddr(BASE_REG.getRepr(), offset);
	}
	
	public String getAddr(String base, Integer offset){
		return offset.toString()+"("+base+")";
	}
	
	public void callerSaveRegister(){
		// save caller-saved registers to stack
		cg.emit.emitComment("save caller-saved registers to stack");
		cg.emit.emit("pushl", Register.EAX);
		cg.emit.emit("pushl", Register.ECX);
		cg.emit.emit("pushl", Register.EDX); 
		
		// points to the last element 
		baseOffset -= 12;
		
	}
	
	public void callerRestoreRegister(){
		// save caller-saved registers to stack
		cg.emit.emitComment("save caller-saved registers to stack");
		cg.emit.emit("popl", Register.EDX);
		cg.emit.emit("popl", Register.ECX);
		cg.emit.emit("popl", Register.EAX); 
				
		// points to the last element 
		baseOffset += 12;
	}
	
	/**
	 * returns a free Register
	 */
	public Register getRegister(){
		Register reg = cg.rm.getRegister();
		return reg;
	}
	
	public void releaseRegister(Register reg){
		cg.rm.releaseRegister(reg);
	}

}