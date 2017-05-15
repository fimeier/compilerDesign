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


public class StackFrame {
	
	protected final AstCodeGenerator cg;
		
	// 
	private int baseOffset; // in Byte relative to %ebp
	private int nLocalVar;

	private Map<String, Integer> localsOffsetMap = new HashMap<String, Integer>();
	private Map<String, Integer> parametersOffsetMap = new HashMap<String, Integer>();

	
	StackFrame(AstCodeGenerator astCodeGenerator, MethodDecl methodDecl) {
		cg = astCodeGenerator;
		List<Ast> localsList = methodDecl.decls().children();
		nLocalVar = localsList.size();
		
		// store old ebp
		cg.emit.emitComment("store old ebp");
		cg.emit.emit("pushl", BASE_REG);
		// set new epb
		cg.emit.emitComment("set new ebp");
		cg.emit.emit("movl", STACK_REG, BASE_REG);
		
		// save callee-saved registers to stack
		cg.emit.emitComment("save callee-saved registers to stack");
		cg.emit.emit("pushl", Register.ESI);
		cg.emit.emit("pushl", Register.EDI);
		cg.emit.emit("pushl", Register.EBX); // -12(ebp) => ebx
		
		// points to the last element 
		baseOffset = -12;
		
		// set local variables 
		cg.emit.emitComment("set local variables:");
		for (Ast l: localsList){
			baseOffset -= 4;
			VarDecl vd = (VarDecl)l;
			localsOffsetMap.put(vd.name, baseOffset);
			cg.emit.emitComment("variable "+vd.name);
			cg.emit.emit("pushl", "$0");
		}
		
		// set parameter 
		cg.emit.emitComment("set local variables:");
		int paramOffset = 0;
		for (String argName: methodDecl.argumentNames){
			paramOffset -= 4;
			parametersOffsetMap.put(argName, paramOffset);
		}
		
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
	
	public String getVariable(Var variable){
		String location = "";
		if (variable.sym.kind.equals(Kind.LOCAL)) {
			Integer offset = localsOffsetMap.get(variable.name);
			if (offset == null){
				return "";
			}
			return getAddr(offset);
		} else if (variable.sym.kind.equals(Kind.PARAM)){
			Integer offset = parametersOffsetMap.get(variable.name);
			if (offset == null){
				return "";
			}
			return getAddr(offset);
		} else if (variable.sym.kind.equals(Kind.FIELD)){
			//TODO:
		}

		
		return location;
		
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
