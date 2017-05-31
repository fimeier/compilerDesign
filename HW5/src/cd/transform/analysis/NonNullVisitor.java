package cd.transform.analysis;

import cd.ir.Ast.BinaryOp;
import cd.ir.Ast.BooleanConst;
import cd.ir.Ast.BuiltInRead;
import cd.ir.Ast.Cast;
import cd.ir.Ast.Expr;
import cd.ir.Ast.Field;
import cd.ir.Ast.Index;
import cd.ir.Ast.IntConst;
import cd.ir.Ast.MethodCallExpr;
import cd.ir.Ast.NewArray;
import cd.ir.Ast.NewObject;
import cd.ir.Ast.NullConst;
import cd.ir.Ast.ThisRef;
import cd.ir.Ast.UnaryOp;
import cd.ir.Ast.Var;
import cd.ir.Symbol.VariableSymbol;

import java.util.Set;

import cd.ir.ExprVisitor;


public class NonNullVisitor extends ExprVisitor<Boolean, Set<VariableSymbol>> {

	/*
	 * return false if null, true if non-null, null if not important
	 */
	

	@Override
	public Boolean binaryOp(BinaryOp ast, Set<VariableSymbol> arg) {
		return null;
	}

	@Override
	public Boolean booleanConst(BooleanConst ast, Set<VariableSymbol> arg) {
		return null;
	}

	@Override
	public Boolean builtInRead(BuiltInRead ast, Set<VariableSymbol> arg) {
		return null;
	}

	@Override
	public Boolean cast(Cast ast, Set<VariableSymbol> arg) {
		return visit(ast.arg(),arg);
	}

	@Override
	public Boolean field(Field ast, Set<VariableSymbol> arg) {
		return false;
	}

	@Override
	public Boolean index(Index ast, Set<VariableSymbol> arg) {
		return false;
	}

	@Override
	public Boolean intConst(IntConst ast, Set<VariableSymbol> arg) {
		return null;
	}

	@Override
	public Boolean methodCall(MethodCallExpr ast, Set<VariableSymbol> arg) {
		return false;
	}

	@Override
	public Boolean newObject(NewObject ast, Set<VariableSymbol> arg) {
		return true;
	}

	@Override
	public Boolean newArray(NewArray ast, Set<VariableSymbol> arg) {
		return true;
	}

	@Override
	public Boolean nullConst(NullConst ast, Set<VariableSymbol> arg) {
		return false;
	}

	@Override
	public Boolean thisRef(ThisRef ast, Set<VariableSymbol> arg) {
		return true;
	}

	@Override
	public Boolean unaryOp(UnaryOp ast, Set<VariableSymbol> arg) {
		return null;
	}

	@Override
	public Boolean var(Var ast, Set<VariableSymbol> arg) {
		if (arg.contains(ast.sym)){
			return true;
		}
		return false;
	}
	
	
}
