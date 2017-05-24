package cd.transform;

import cd.ir.Ast;
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
import cd.ir.AstVisitor;
import cd.ir.BasicBlock;
import cd.ir.ControlFlowGraph;

public class CfgExprVisitor extends AstVisitor<BasicBlock, BasicBlock > {



protected final CfgBuilder builder;
	
	CfgExprVisitor(CfgBuilder builder){
		this.builder = builder;
	}
	
	public BasicBlock cfg(Expr ast, BasicBlock block) {
		return visit(ast, block);
	}
	
	/*
	public BasicBlock visit(Ast ast, Void A) {
		System.out.println("CfgExprVisitor: "+ast.toString());
			return super.visit(ast, null);
	}*/
	
	
@Override
	public BasicBlock visit(Expr ast, BasicBlock block) {
	System.out.println("CfgExprVisitor::visit "+ast.toString());

		// TODO Auto-generated method stub
		return super.visit(ast, block);
	}

	@Override
	public BasicBlock visitChildren(Expr ast, BasicBlock block) {
		System.out.println("	public BasicBlock visitChildren(Expr ast, BasicBlock block) {");
		// TODO Auto-generated method stub
		return super.visitChildren(ast, block);
	}

	@Override
	public BasicBlock binaryOp(BinaryOp ast, BasicBlock block) {
		System.out.println("	public BasicBlock binaryOp(BinaryOp ast, BasicBlock block) {");
		// TODO Auto-generated method stub
		return super.binaryOp(ast, block);
	}

	@Override
	public BasicBlock booleanConst(BooleanConst ast, BasicBlock block) {
		System.out.println("	public BasicBlock booleanConst(BooleanConst ast, BasicBlock block) {");
		// TODO Auto-generated method stub
		return super.booleanConst(ast, block);
	}

	@Override
	public BasicBlock builtInRead(BuiltInRead ast, BasicBlock block) {
		System.out.println("	public BasicBlock builtInRead(BuiltInRead ast, BasicBlock block) {");
		// TODO Auto-generated method stub
		return super.builtInRead(ast, block);
	}

	@Override
	public BasicBlock cast(Cast ast, BasicBlock block) {
		System.out.println("	public BasicBlock cast(Cast ast, BasicBlock block) {");
		// TODO Auto-generated method stub
		return super.cast(ast, block);
	}

	@Override
	public BasicBlock field(Field ast, BasicBlock block) {
		System.out.println("	public BasicBlock field(Field ast, BasicBlock block) {");
		// TODO Auto-generated method stub
		return super.field(ast, block);
	}

	@Override
	public BasicBlock index(Index ast, BasicBlock block) {
		System.out.println("	public BasicBlock index(Index ast, BasicBlock block) {");
		// TODO Auto-generated method stub
		return super.index(ast, block);
	}

	@Override
	public BasicBlock intConst(IntConst ast, BasicBlock block) {
		System.out.println("	public BasicBlock intConst(IntConst ast, BasicBlock block) {");
		// TODO Auto-generated method stub
		return super.intConst(ast, block);
	}

	@Override
	public BasicBlock methodCall(MethodCallExpr ast, BasicBlock block) {
		System.out.println("	public BasicBlock methodCall(MethodCallExpr ast, BasicBlock block) {");
		// TODO Auto-generated method stub
		return super.methodCall(ast, block);
	}

	@Override
	public BasicBlock newObject(NewObject ast, BasicBlock block) {
		System.out.println("	public BasicBlock newObject(NewObject ast, BasicBlock block) {");

		// TODO Auto-generated method stub
		return super.newObject(ast, block);
	}

	@Override
	public BasicBlock newArray(NewArray ast, BasicBlock block) {
		System.out.println("	public BasicBlock newArray(NewArray ast, BasicBlock block) {");

		// TODO Auto-generated method stub
		return super.newArray(ast, block);
	}

	@Override
	public BasicBlock nullConst(NullConst ast, BasicBlock block) {
		System.out.println("	public BasicBlock nullConst(NullConst ast, BasicBlock block) {");

		// TODO Auto-generated method stub
		return super.nullConst(ast, block);
	}

	@Override
	public BasicBlock thisRef(ThisRef ast, BasicBlock block) {
		System.out.println("	public BasicBlock thisRef(ThisRef ast, BasicBlock block) {");

		// TODO Auto-generated method stub
		return super.thisRef(ast, block);
	}

	@Override
	public BasicBlock unaryOp(UnaryOp ast, BasicBlock block) {
		System.out.println("	public BasicBlock unaryOp(UnaryOp ast, BasicBlock block) {");

		// TODO Auto-generated method stub
		return super.unaryOp(ast, block);
	}

	@Override
	public BasicBlock var(Var ast, BasicBlock block) {
		System.out.println("	public BasicBlock var(Var ast, BasicBlock block) {");

		// TODO Auto-generated method stub
		return super.var(ast, block);
	}
	
	

}
