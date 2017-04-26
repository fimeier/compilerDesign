package cd.backend.codegen;

import cd.ToDoException;
import cd.backend.codegen.RegisterManager.Register;
import cd.ir.Ast;
import cd.ir.Ast.BinaryOp;
import cd.ir.Ast.BinaryOp.BOp;
import cd.ir.Ast.BooleanConst;
import cd.ir.Ast.BuiltInRead;
import cd.ir.Ast.Cast;
import cd.ir.Ast.Expr;
import cd.ir.Ast.Field;
import cd.ir.Ast.Index;
import cd.ir.Ast.IntConst;
import cd.ir.Ast.NewArray;
import cd.ir.Ast.NewObject;
import cd.ir.Ast.NullConst;
import cd.ir.Ast.ThisRef;
import cd.ir.Ast.UnaryOp;
import cd.ir.Ast.Var;
import cd.ir.ExprVisitor;
import cd.util.debug.AstOneLine;

/**
 * Generates code to evaluate expressions. After emitting the code, returns a
 * String which indicates the register where the result can be found.
 */
class ExprCalcRegVisitor extends ExprVisitor<Integer, Void> {
	protected final AstCodeGenerator cg;

	ExprCalcRegVisitor(AstCodeGenerator astCodeGenerator) {
		cg = astCodeGenerator;
	}

	public Integer gen(Expr ast) {
		return visit(ast, null);
	}

	@Override
	public Integer visit(Expr ast, Void arg) {
		try {
			return super.visit(ast, null);
		} finally {
			
		}

	}

	@Override
	public Integer binaryOp(BinaryOp ast, Void arg) {
		{
			
			Integer calcL = visit(ast.left(), arg);
			Integer calcR = visit(ast.right(), arg);
			
			if (calcL == calcR){
				return calcL + 1;
			} else {
				return Math.max(calcL, calcR);
			}
			
			//throw new ToDoException();
		}
	}

	@Override
	public Integer booleanConst(BooleanConst ast, Void arg) {
		{
			throw new RuntimeException("Not required");
		}
	}

	@Override
	public Integer builtInRead(BuiltInRead ast, Void arg) {
		{
			throw new ToDoException();
		}
	}

	@Override
	public Integer cast(Cast ast, Void arg) {
		{
			throw new RuntimeException("Not required");
		}
	}

	@Override
	public Integer index(Index ast, Void arg) {
		{
			throw new RuntimeException("Not required");
		}
	}

	@Override
	public Integer intConst(IntConst ast, Void arg) {
		{
			return 1;
			//throw new ToDoException();
		}
	}

	@Override
	public Integer field(Field ast, Void arg) {
		{
			throw new RuntimeException("Not required");
		}
	}

	@Override
	public Integer newArray(NewArray ast, Void arg) {
		{
			throw new RuntimeException("Not required");
		}
	}

	@Override
	public Integer newObject(NewObject ast, Void arg) {
		{
			throw new RuntimeException("Not required");
		}
	}

	@Override
	public Integer nullConst(NullConst ast, Void arg) {
		{
			throw new RuntimeException("Not required");
		}
	}

	@Override
	public Integer thisRef(ThisRef ast, Void arg) {
		{
			throw new RuntimeException("Not required");
		}
	}

	@Override
	public Integer unaryOp(UnaryOp ast, Void arg) {
		{
			return visit(ast.arg(), arg);
		}
	}
	
	@Override
	public Integer var(Var ast, Void arg) {
		{
			return 1;
		}
	}

}
