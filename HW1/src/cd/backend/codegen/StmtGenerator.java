package cd.backend.codegen;

import cd.ToDoException;
import cd.backend.codegen.RegisterManager.Register;
import cd.ir.Ast;
import cd.ir.Ast.Assign;
import cd.ir.Ast.BuiltInWrite;
import cd.ir.Ast.BuiltInWriteln;
import cd.ir.Ast.IfElse;
import cd.ir.Ast.MethodCall;
import cd.ir.Ast.MethodDecl;
import cd.ir.Ast.VarDecl;
import cd.ir.Ast.WhileLoop;
import cd.ir.AstVisitor;
import cd.util.debug.AstOneLine;

/**
 * Generates code to process statements and declarations.
 */
class StmtGenerator extends AstVisitor<Register, Void> {
	protected final AstCodeGenerator cg;

	StmtGenerator(AstCodeGenerator astCodeGenerator) {
		cg = astCodeGenerator;
	}

	public void gen(Ast ast) {
		visit(ast, null);
	}

	@Override
	public Register visit(Ast ast, Void arg) {
		try {
			if (ast instanceof VarDecl){
				cg.emit.increaseIndent("EmittingVardecl " + AstOneLine.toString(ast));
				cg.emit.emitLabel("var_"+((VarDecl)ast).name);
				cg.emit.emitRaw("	.int 0");
			} else
			cg.emit.increaseIndent("Emitting " + AstOneLine.toString(ast));
			return super.visit(ast, arg);
		} finally {
			cg.emit.decreaseIndent();
		}
	}

	@Override
	public Register methodCall(MethodCall ast, Void dummy) {
		{
			throw new RuntimeException("Not required");
		}
	}

	@Override
	public Register methodDecl(MethodDecl ast, Void arg) {
		{
			// Because we only handle very simple programs in HW1,
			// you can just emit the prologue here!			
			
			cg.rm.initRegisters();
			//cg.emit.emitLabel("_"+ast.name);
			cg.emit.emitRaw(".section .data");
			
			cg.emit.emitLabel("STR_D");
			cg.emit.emitRaw(".string \"%d\"");
		
			super.visit(ast.decls(),arg);
			//cg.emit.emitRaw("STR_D:");
			//cg.emit.emitRaw("	.string \"%d\"");
			//cg.emit.emitRaw("	.section .data");
			//cg.emit.emitRaw("var_a:");
			//cg.emit.emitRaw("	.int 0");
			cg.emit.emitRaw("	.section .text");
			cg.emit.emitRaw("	.globl main");
			cg.emit.emitRaw("main:");
			
			return super.visit(ast.body(), arg);
			
			//throw new ToDoException();
		}
	}

	@Override
	public Register ifElse(IfElse ast, Void arg) {
		{
			throw new RuntimeException("Not required");
		}
	}

	@Override
	public Register whileLoop(WhileLoop ast, Void arg) {
		{
			throw new RuntimeException("Not required");
		}
	}

	@Override
	public Register assign(Assign ast, Void arg) {
		{
			// Because we only handle very simple programs in HW1,
			// you can just emit the prologue here!
			
			//cg.emit.emitLabel(ast.name);

			visit(ast.left(), arg);
			return visit(ast.right(), arg);
			//throw new ToDoException();
		}
	}

	@Override
	public Register builtInWrite(BuiltInWrite ast, Void arg) {
		{			
			Register reg = cg.eg.visit(ast.arg(), arg);
			
			cg.emit.emit("sub", "$16", "%esp");
			cg.emit.emit("movl",  reg, "4(%esp)"); 
			cg.emit.emit("movl","$STR_D", "0(%esp)");
			cg.emit.emit("call", "printf");
			cg.emit.emit("add", "$16", "%esp");
			
			
			return reg;
			
			//throw new ToDoException();
		}
	}

	@Override
	public Register builtInWriteln(BuiltInWriteln ast, Void arg) {
		{
			cg.emit.emit("sub", "$12", "%esp");
			cg.emit.emit("pushl", "$10");
			cg.emit.emit("call", "putchar");
			cg.emit.emit("add", "$16", "%esp");

			return cg.rm.getRegister();
						
			//throw new ToDoException();
		}
	}

}