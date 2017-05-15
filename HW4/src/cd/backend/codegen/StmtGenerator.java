package cd.backend.codegen;

import static cd.backend.codegen.AssemblyEmitter.constant;
import static cd.backend.codegen.RegisterManager.STACK_REG;

import java.util.List;


import cd.Config;
import cd.ToDoException;
import cd.backend.codegen.RegisterManager.Register;
import cd.ir.Ast;
import cd.ir.Ast.Assign;
import cd.ir.Ast.BuiltInWrite;
import cd.ir.Ast.BuiltInWriteln;
import cd.ir.Ast.ClassDecl;
import cd.ir.Ast.Expr;
import cd.ir.Ast.IfElse;
import cd.ir.Ast.Index;
import cd.ir.Ast.MethodCall;
import cd.ir.Ast.MethodDecl;
import cd.ir.Ast.ReturnStmt;
import cd.ir.Ast.Var;
import cd.ir.Ast.WhileLoop;
import cd.ir.AstVisitor;
import cd.ir.Symbol.MethodSymbol;
import cd.ir.Symbol.VariableSymbol;
import cd.util.debug.AstOneLine;

/**
 * Generates code to process statements and declarations.
 */
class StmtGenerator extends AstVisitor<Register, StackFrame> {
	protected final AstCodeGenerator cg;
	private VTable currentClass;

	StmtGenerator(AstCodeGenerator astCodeGenerator) {
		cg = astCodeGenerator;
	}
	public void gen(Ast ast) {
		visit(ast, null);
	}
	@Override
	public Register visit(Ast ast, StackFrame frame) {
		try {
			cg.emit.increaseIndent("Emitting " + AstOneLine.toString(ast));
			return super.visit(ast, frame);
		} finally {
			cg.emit.decreaseIndent();
		}
	}

	@Override
	public Register methodCall(MethodCall ast, StackFrame frame) {
		{
			throw new ToDoException();
		}
	}

	public Register methodCall(MethodSymbol sym, List<Expr> allArguments) {
		
		throw new RuntimeException("Not required");
	}

	// Emit vtable for arrays of this class:
	@Override
	public Register classDecl(ClassDecl ast, StackFrame frame) {
		{
			currentClass = cg.vtableManager.get(ast.name);
			return visitChildren(ast, frame);
		}
	}

	@Override
	public Register methodDecl(MethodDecl ast, StackFrame f) {
		{
			VTable table = cg.vtableManager.get(currentClass.classDecl.name);
			String label = table.getLabel(ast.name).toString();
		
			cg.emit.emitLabel(label);
			
			// Frame manager: set up the frame
			StackFrame frame = new StackFrame(cg, ast);

			if (!ast.body().children().isEmpty()){
				visit(ast.body(), frame);
			}
			
			cg.emit.emitComment("method suffix");
			cg.emitMethodSuffix(true);
			return null;
		}
	}

	@Override
	public Register ifElse(IfElse ast, StackFrame frame) {
		{
			throw new ToDoException();
		}
	}

	@Override
	public Register whileLoop(WhileLoop ast, StackFrame frame) {
		{
			throw new ToDoException();
		}
	}

	@Override
	public Register assign(Assign ast, StackFrame frame) {
		{
			Register rightReg = cg.eg.visit(ast.right(), frame);
			
			String destination = "";
			if (ast.left() instanceof Var){
				Var var = (Var) ast.left();
				destination = frame.getVariable(var);
				
			} else if (ast.left() instanceof Index){
				//TODO:
			} else {
				// TODO:
			}
			
			cg.emit.emit("movl", rightReg, destination);
			cg.rm.releaseRegister(rightReg);

			return null;
		}
	}
	@Override
	public Register builtInWrite(BuiltInWrite ast, StackFrame frame) {
		{
			Register reg = cg.eg.visit(ast.arg(), frame);
						
			cg.emit.emit("sub", constant(16), STACK_REG);
			cg.emit.emitStore(reg, 4, STACK_REG);
			cg.emit.emitStore("$STR_D", 0, STACK_REG);
			cg.emit.emit("call", Config.PRINTF);
			cg.emit.emit("add", constant(16), STACK_REG);
			
			frame.releaseRegister(reg);

			return null;
		}
	}
	@Override
	public Register builtInWriteln(BuiltInWriteln ast, StackFrame frame) {
		{
			cg.emit.emit("sub", constant(16), STACK_REG);
			cg.emit.emitStore("$STR_NL", 0, STACK_REG);
			cg.emit.emit("call", Config.PRINTF);
			cg.emit.emit("add", constant(16), STACK_REG);
			return null;
		}
	}
	@Override
	public Register returnStmt(ReturnStmt ast, StackFrame frame) {
		{
			throw new ToDoException();
		}
	}

}
