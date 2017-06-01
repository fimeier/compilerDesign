package cd.transform.analysis;

import cd.ir.Ast.Assign;
import cd.ir.Ast.BinaryOp;
import cd.ir.Ast.BuiltInWrite;
import cd.ir.Ast.Cast;
import cd.ir.Ast.Expr;
import cd.ir.Ast.Field;
import cd.ir.Ast.IfElse;
import cd.ir.Ast.Index;
import cd.ir.Ast.MethodCallExpr;
import cd.ir.Ast.ReturnStmt;
import cd.ir.Ast.UnaryOp;
import cd.ir.Ast.Var;
import cd.ir.Ast.WhileLoop;

import java.util.Set;

import cd.ir.AstVisitor;
import cd.ir.Symbol.VariableSymbol;
import cd.ir.Symbol.VariableSymbol.Kind;
import cd.util.Tuple;

public class NNStmtVisitor extends AstVisitor<Boolean, Tuple<Set<VariableSymbol>,Set<VariableSymbol>> > {
	protected final NonNullAnalysis nna;

	NNStmtVisitor(NonNullAnalysis nonNullAnalysis) {
		nna = nonNullAnalysis;
	}

	@Override
	public Boolean assign(Assign assign, Tuple<Set<VariableSymbol>, Set<VariableSymbol>> arg) {
		
		//visit(assign.right(), arg);
		//visit(assign.left(), arg);
				
		return null;
	}


	@Override
	public Boolean builtInWrite(BuiltInWrite ast, Tuple<Set<VariableSymbol>, Set<VariableSymbol>> arg) {
		visit(ast.arg(),arg);
		return null;
	}

	@Override
	public Boolean ifElse(IfElse ast, Tuple<Set<VariableSymbol>, Set<VariableSymbol>> arg) {
		visit(ast.condition(), arg);
		return null;
	}

	@Override
	public Boolean returnStmt(ReturnStmt ast, Tuple<Set<VariableSymbol>, Set<VariableSymbol>> arg) {
		if (ast.arg() != null){
			visit(ast.arg(), arg);
		}
		return null;
	}


	@Override
	public Boolean whileLoop(WhileLoop ast, Tuple<Set<VariableSymbol>, Set<VariableSymbol>> arg) {
		visit(ast.condition(),arg);
		return null;
	}


	@Override
	public Boolean binaryOp(BinaryOp ast, Tuple<Set<VariableSymbol>, Set<VariableSymbol>> arg) {
		visit(ast.left(),arg);
		visit(ast.right(),arg);
		return null;
	}

	@Override
	public Boolean cast(Cast ast, Tuple<Set<VariableSymbol>, Set<VariableSymbol>> arg) {
		return visit(ast.arg(),arg);
	}

	@Override
	public Boolean field(Field ast, Tuple<Set<VariableSymbol>, Set<VariableSymbol>> arg) {
		if (ast.arg() instanceof Var){
			Var var = (Var) ast.arg();
			if (var.type.isReferenceType() && !var.sym.kind.equals(Kind.FIELD)){
				arg.a.add(var.sym);
				arg.b.remove(var.sym);
			}
		} else {
			visit(ast.arg(), arg);
		}
		return null;
	}

	@Override
	public Boolean index(Index ast, Tuple<Set<VariableSymbol>, Set<VariableSymbol>> arg) {
		if (ast.left() instanceof Var){
			Var var = (Var) ast.left();
			if (var.type.isReferenceType() && !var.sym.kind.equals(Kind.FIELD)){
				arg.a.add(var.sym);
				arg.b.remove(var.sym);
			}
		} else {
			visit(ast.left(), arg);
		}
		visit(ast.right(), arg);
		return null;
	}

	@Override
	public Boolean methodCall(MethodCallExpr ast, Tuple<Set<VariableSymbol>, Set<VariableSymbol>> arg) {
		if (ast.receiver() instanceof Var){
			Var var = (Var) ast.receiver();
			if (var.type.isReferenceType() && !var.sym.kind.equals(Kind.FIELD)){
				arg.a.add(var.sym);
				arg.b.remove(var.sym);
			}
		} else {
			visit(ast.receiver(), arg);
		}
		
		for (Expr e: ast.argumentsWithoutReceiver()){
			visit(e, arg);
		}
				
		return null;
	}

	@Override
	public Boolean unaryOp(UnaryOp ast, Tuple<Set<VariableSymbol>, Set<VariableSymbol>> arg) {
		visit(ast.arg(), arg);
		return null;
	}	

}
