package cd.frontend.parser;

import java.util.ArrayList;
import java.util.List;

import org.antlr.v4.runtime.misc.NotNull;

import cd.ToDoException;
import cd.frontend.parser.JavaliParser.*;
import cd.ir.Ast;
import cd.ir.Ast.ClassDecl;

public final class JavaliAstVisitor extends JavaliBaseVisitor<List<? extends Ast>> {
	
public List<ClassDecl> classDecls = new ArrayList<>();
	

	//public Void visitUnit(UnitContext ctx) {return null;}
	
	@Override
	public List<? extends Ast> visitClassDecl(ClassDeclContext ctx) {
		
		String name = ctx.Identifier(0).toString();
		String superClass = ctx.Identifier(1).toString();
		List<? extends Ast> members =  visitMemberList(ctx.memberList());;
		
		ClassDecl c = new ClassDecl(name, superClass, members);
		classDecls.add(c);
			
		return classDecls;
	}
	
	@Override // (varDecl | methodDecl)*
	public List<? extends Ast> visitMemberList(MemberListContext ctx) {
		
		int count = ctx.getChildCount();
		for (int i = 0; i< count; i++){
			//TODO: implement here..
		}
		
		List<? extends Ast> members =  null;
		
		return members;
	}
	
	
	@Override
	public List<? extends Ast> visitNewExpr(NewExprContext ctx) {
		// TODO Auto-generated method stub
		return super.visitNewExpr(ctx);
	}

	@Override
	public List<? extends Ast> visitFormalParamList(FormalParamListContext ctx) {
		// TODO Auto-generated method stub
		return super.visitFormalParamList(ctx);
	}

	@Override
	public List<? extends Ast> visitReferenceType(ReferenceTypeContext ctx) {
		// TODO Auto-generated method stub
		return super.visitReferenceType(ctx);
	}

	@Override
	public List<? extends Ast> visitMethodCallExpression(MethodCallExpressionContext ctx) {
		// TODO Auto-generated method stub
		return super.visitMethodCallExpression(ctx);
	}

	@Override
	public List<? extends Ast> visitMethodDecl(MethodDeclContext ctx) {
		// TODO Auto-generated method stub
		return super.visitMethodDecl(ctx);
	}

	@Override
	public List<? extends Ast> visitType(TypeContext ctx) {
		// TODO Auto-generated method stub
		return super.visitType(ctx);
	}

	@Override
	public List<? extends Ast> visitMethodCallExpr(MethodCallExprContext ctx) {
		// TODO Auto-generated method stub
		return super.visitMethodCallExpr(ctx);
	}

	@Override
	public List<? extends Ast> visitExpr(ExprContext ctx) {
		// TODO Auto-generated method stub
		return super.visitExpr(ctx);
	}

	@Override
	public List<? extends Ast> visitAssignmentStmt(AssignmentStmtContext ctx) {
		// TODO Auto-generated method stub
		return super.visitAssignmentStmt(ctx);
	}

	@Override
	public List<? extends Ast> visitPrimitiveType(PrimitiveTypeContext ctx) {
		// TODO Auto-generated method stub
		return super.visitPrimitiveType(ctx);
	}

	@Override
	public List<? extends Ast> visitActualParamList(ActualParamListContext ctx) {
		// TODO Auto-generated method stub
		return super.visitActualParamList(ctx);
	}

	@Override
	public List<? extends Ast> visitArrayType(ArrayTypeContext ctx) {
		// TODO Auto-generated method stub
		return super.visitArrayType(ctx);
	}

	@Override
	public List<? extends Ast> visitWhileStmt(WhileStmtContext ctx) {
		// TODO Auto-generated method stub
		return super.visitWhileStmt(ctx);
	}

	@Override
	public List<? extends Ast> visitReadExpr(ReadExprContext ctx) {
		// TODO Auto-generated method stub
		return super.visitReadExpr(ctx);
	}

	@Override
	public List<? extends Ast> visitIdentAccess(IdentAccessContext ctx) {
		// TODO Auto-generated method stub
		return super.visitIdentAccess(ctx);
	}

	@Override
	public List<? extends Ast> visitWriteStmt(WriteStmtContext ctx) {
		// TODO Auto-generated method stub
		return super.visitWriteStmt(ctx);
	}

	@Override
	public List<? extends Ast> visitReturnStmt(ReturnStmtContext ctx) {
		// TODO Auto-generated method stub
		return super.visitReturnStmt(ctx);
	}

	@Override
	public List<? extends Ast> visitMethodCallStmt(MethodCallStmtContext ctx) {
		// TODO Auto-generated method stub
		return super.visitMethodCallStmt(ctx);
	}

	@Override
	public List<? extends Ast> visitStmtBlock(StmtBlockContext ctx) {
		// TODO Auto-generated method stub
		return super.visitStmtBlock(ctx);
	}

	@Override
	public List<? extends Ast> visitUnit(UnitContext ctx) {
		// TODO Auto-generated method stub
		return super.visitUnit(ctx);
	}

	@Override
	public List<? extends Ast> visitIfStmt(IfStmtContext ctx) {
		// TODO Auto-generated method stub
		return super.visitIfStmt(ctx);
	}

	@Override
	public List<? extends Ast> visitVarDecl(VarDeclContext ctx) {
		// TODO Auto-generated method stub
		return super.visitVarDecl(ctx);
	}

	@Override
	public List<? extends Ast> visitStmt(StmtContext ctx) {
		// TODO Auto-generated method stub
		return super.visitStmt(ctx);
	}
}
