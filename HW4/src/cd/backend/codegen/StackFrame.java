package cd.backend.codegen;

import cd.backend.codegen.RegisterManager.Register;
import cd.ir.Ast;
import cd.ir.Ast.VarDecl;

import static cd.backend.codegen.RegisterManager.STACK_REG;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import static cd.backend.codegen.RegisterManager.BASE_REG;


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

	private Map<String, Integer> offsetMap = new HashMap<>();
	
	StackFrame(AstCodeGenerator astCodeGenerator, List<Ast> localsList) {
		cg = astCodeGenerator;
		//framePointer = basePtr;
		//stackPointer = basePtr;
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
			offsetMap.put(vd.name, baseOffset);
			cg.emit.emitComment("variable "+vd.name);
			cg.emit.emit("pushl", "$0");
		}
		
	}
	
	public Register getLocalVar(String varName){
		return null;
	}
	
	
	
	
	/**
	 * returns a free Register
	 * if there are no more free Registers it return the address
	 * of a temporary variable on this stack frame 
	 */
	public Register getRegister(){
		Register reg = cg.rm.getRegister();
		if (reg.isMem()){
			// TODO:

			// create temporary variable on stack and set addr
			reg.setMem("todo", "offset");
		}
		return reg;
	}

}
