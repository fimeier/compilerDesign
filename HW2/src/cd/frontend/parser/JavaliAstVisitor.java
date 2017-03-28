package cd.frontend.parser;

import java.util.ArrayList;
import java.util.List;

import org.antlr.v4.runtime.misc.NotNull;
import org.antlr.v4.runtime.tree.ErrorNode;
import org.antlr.v4.runtime.tree.ParseTree;
import org.antlr.v4.runtime.tree.RuleNode;
import org.antlr.v4.runtime.tree.TerminalNode;

import cd.ToDoException;
import cd.frontend.parser.JavaliParser.*;
import cd.ir.Ast;
import cd.ir.Ast.Assign;
import cd.ir.Ast.BooleanConst;
import cd.ir.Ast.ClassDecl;
import cd.ir.Ast.Expr;
import cd.ir.Ast.IntConst;
import cd.ir.Ast.MethodDecl;
import cd.ir.Ast.NullConst;
import cd.ir.Ast.Seq;
import cd.ir.Ast.Var;
import cd.ir.Ast.VarDecl;

public final class JavaliAstVisitor extends JavaliBaseVisitor<List<Ast>> {
	
public List<ClassDecl> classDecls = new ArrayList<>();
	
	@Override
	public List<Ast> visitClassDecl(ClassDeclContext ctx) {//ok
		
		String name = ctx.Identifier(0).toString();
		String superClass = null;
		if (ctx.Identifier().size() > 1){
			superClass = ctx.Identifier(1).toString();
		} else {
			superClass = "Object";
		}

		List<Ast> members =  visitMemberList(ctx.memberList());;
		
		ClassDecl c = new ClassDecl(name, superClass, members);
		classDecls.add(c);
			
		return members;
	}
	
	@Override // (varDecl | methodDecl)*
	public List<Ast> visitMemberList(MemberListContext ctx) {//ok
		List<Ast> members = new ArrayList<>();
		
		List<VarDeclContext> varDeclList = ctx.varDecl();
		for (int i = 0; i<varDeclList.size();i++){
			members.addAll(visitVarDecl(ctx.varDecl(i)));
		}
		
		List<MethodDeclContext> methodDeclList = ctx.methodDecl();
		for (int i = 0; i<methodDeclList.size();i++){
			members.addAll(visitMethodDecl(ctx.methodDecl(i)));
		}
		
		return members;
	}
	@Override
	public List<Ast> visitVarDecl(VarDeclContext ctx) { //ok
		List<Ast> members = new ArrayList<>();
		
		String type = ctx.type().getText();
		
		//TODO: types nicer?
		/*
		if (ctx.type().primitiveType() != null)
			type = ctx.type().primitiveType().getText();
		else if (ctx.type().referenceType() != null){
			//ctx.type().referenceType()
			if (ctx.type().referenceType().Identifier() != null)
				type = ctx.type().referenceType().Identifier().toString();
			else if (ctx.type().referenceType().arrayType() != null){
				ArrayTypeContext arrCtx = ctx.type().referenceType().arrayType();
				...
			}
		}*/
		
		for (TerminalNode n : ctx.Identifier()){
			VarDecl varDecl = new VarDecl(type, n.toString());
			members.add(varDecl);
		}
		
		return members;
	}	
	@Override 
	public List<Ast> visitMethodDecl(MethodDeclContext ctx) { //ok
		List<Ast> members = new ArrayList<>();
		
 		String returnType;
		if (ctx.type() == null)
 			returnType = "void";
 		else 
 			returnType = ctx.type().toString();
		String name = ctx.Identifier().toString();
		List<String> argumentTypes = new ArrayList<>();
		List<String> argumentNames = new ArrayList<>();
		
		// varDecl*
		List<Ast> varDecls = new ArrayList<>();
		List<VarDeclContext> varDeclList = ctx.varDecl();
		for (int i = 0; i<varDeclList.size();i++){
			varDecls.addAll(visitVarDecl(ctx.varDecl(i)));
		}
		Seq decls = new Seq(varDecls);
		
		// stmt*
		List<Ast> stmtBody = new ArrayList<>();
		List<StmtContext> stmtBodyList = ctx.stmt();
		for (int i = 0; i<stmtBodyList.size();i++){
			stmtBody.addAll(visitStmt(ctx.stmt(i)));
		}
		Seq body = new Seq(stmtBody);
		
		MethodDecl methodDecl = 
				new MethodDecl(returnType, name, argumentTypes, argumentNames, decls, body);
	
		members.add(methodDecl);
		return members;
	}

	//STMT:
	@Override
	public List<Ast> visitStmt(StmtContext ctx) { //ok
		List<Ast> ret = new ArrayList<>();
		
		switch (ctx.getChild(0).getClass().getSimpleName()) {
        	case "AssignmentStmtContext":  
        		ret.addAll(visitAssignmentStmt(ctx.assignmentStmt())); break;
        	case "MethodCallStmtContext":  
        		ret.addAll(visitMethodCallStmt(ctx.methodCallStmt())); break;
        	case "IfStmtContext":  
        		ret.addAll(visitIfStmt(ctx.ifStmt())); break;
        	case "WhileStmtContext":  
        		ret.addAll(visitWhileStmt(ctx.whileStmt())); break;
        	case "ReturnStmtContext":  
        		ret.addAll(visitReturnStmt(ctx.returnStmt())); break;
        	case "WriteStmtContext":  
        		ret.addAll(visitWriteStmt(ctx.writeStmt())); break;
		}

		return ret;
	}
	@Override // identAccess '=' ( expr | newExpr | readExpr ) ';'
	public List<Ast> visitAssignmentStmt(AssignmentStmtContext ctx) { //ok
		List<Ast> ret = new ArrayList<>();
		
		// TODO: change to visitIdentaccess
		Var var = new Var(ctx.identAccess().getText());
		
		Expr right = null;
				
		if (ctx.expr() != null){
			right = (Expr )visitExpr(ctx.expr()).get(0);
		}
		
		Assign assign = new Assign(var, right);
		ret.add(assign);
		return ret;
	}
	@Override
	public List<Ast> visitMethodCallStmt(MethodCallStmtContext ctx) {
		List<Ast> ret = new ArrayList<>();
		//TODO: implement
		return ret;
	}
	@Override
	public List<Ast> visitIfStmt(IfStmtContext ctx) {
		List<Ast> ret = new ArrayList<>();
		//TODO: implement
		return ret;
	}
	@Override
	public List<Ast> visitWhileStmt(WhileStmtContext ctx) {
		List<Ast> ret = new ArrayList<>();
		//TODO: implement
		return ret;
	}
	@Override
	public List<Ast> visitReturnStmt(ReturnStmtContext ctx) {
		List<Ast> ret = new ArrayList<>();
		//TODO: implement
		return ret;
	}
	@Override
	public List<Ast> visitWriteStmt(WriteStmtContext ctx) {
		List<Ast> ret = new ArrayList<>();
		//TODO: implement
		return ret;
	}

	//EXPR:
	public List<Ast> visitExpr(ExprContext ctx) { //ok
		List<Ast> ret = new ArrayList<>();
				
		switch (ctx.getClass().getSimpleName()) {
    	case "LITERALContext":  
    		ret.addAll(visitLITERAL((LITERALContext) ctx));
    		break;
    	case "IDENTACCESSContext":  
    		ret.addAll(visitIDENTACCESS((IDENTACCESSContext) ctx));
    		break;
    	case "EXPRContext":  
    		ret.addAll(visitEXPR((EXPRContext) ctx));
    		break;
    	case "SIGNEXPRContext":  
    		ret.addAll(visitSIGNEXPR((SIGNEXPRContext) ctx));
    		break;
    	case "CASTEXPRContext":  
    		ret.addAll(visitCASTEXPR((CASTEXPRContext) ctx));
    		break;
    	case "BINOPSTRONGContext":  
    		ret.addAll(visitBINOPSTRONG((BINOPSTRONGContext) ctx));
    		break;
    	case "BINOPWEAKContext":  
    		ret.addAll(visitBINOPWEAK((BINOPWEAKContext) ctx));
    		break;
    	case "ORDERPEXPRContext":  
    		ret.addAll(visitORDERPEXPR((ORDERPEXPRContext) ctx));
    		break;
    	case "EQEXPRContext":  
    		ret.addAll(visitEQEXPR((EQEXPRContext) ctx));
    		break;
    	case "ANDEXPRContext":  
    		ret.addAll(visitANDEXPR((ANDEXPRContext) ctx));
    		break;
    	case "OREXPRContext":  
    		ret.addAll(visitOREXPR((OREXPRContext) ctx));
    		break;
		}		
		
		return ret;
	}
	@Override
	public List<Ast> visitIDENTACCESS(IDENTACCESSContext ctx) {
		List<Ast> ret = new ArrayList<>();
		//TODO: implement
		return ret;
	}

	@Override
	public List<Ast> visitEXPR(EXPRContext ctx) {
		List<Ast> ret = new ArrayList<>();
		//TODO: implement
		return ret;
	}
	@Override
	public List<Ast> visitSIGNEXPR(SIGNEXPRContext ctx) {
		List<Ast> ret = new ArrayList<>();
		//TODO: implement
		return ret;
	}
	@Override
	public List<Ast> visitCASTEXPR(CASTEXPRContext ctx) {
		List<Ast> ret = new ArrayList<>();
		//TODO: implement
		return ret;
	}


	@Override
	public List<Ast> visitBINOPSTRONG(BINOPSTRONGContext ctx) {
		List<Ast> ret = new ArrayList<>();
		//TODO: implement
		return ret;
	}

	@Override
	public List<Ast> visitBINOPWEAK(BINOPWEAKContext ctx) {
		List<Ast> ret = new ArrayList<>();
		//TODO: implement
		return ret;
	}
	@Override
	public List<Ast> visitORDERPEXPR(ORDERPEXPRContext ctx) {
		List<Ast> ret = new ArrayList<>();
		//TODO: implement
		return ret;
	}
	@Override
	public List<Ast> visitEQEXPR(EQEXPRContext ctx) {
		List<Ast> ret = new ArrayList<>();
		//TODO: implement
		return ret;
	}
	@Override
	public List<Ast> visitANDEXPR(ANDEXPRContext ctx) {
		List<Ast> ret = new ArrayList<>();
		//TODO: implement
		return ret;
	}

	@Override
	public List<Ast> visitOREXPR(OREXPRContext ctx) {
		List<Ast> ret = new ArrayList<>();
		//TODO: implement
		return ret;
	}



	//Literal:
		@Override
	public List<Ast> visitLITERAL(LITERALContext ctx) { //ok
		List<Ast> ret = new ArrayList<>();
		
		switch (ctx.getChild(0).getClass().getSimpleName()) {
    	case "LIT_BOOLContext":  
    		ret.addAll(visitLIT_BOOL((LIT_BOOLContext) ctx.getChild(0)));
    		break;
    	case "LIT_INTContext":  
    		ret.addAll(visitLIT_INT((LIT_INTContext) ctx.getChild(0)));
    		break;
    	case "LIT_NULLContext":  
    		ret.addAll(visitLIT_NULL((LIT_NULLContext) ctx.getChild(0)));
    		break;
		}
		return ret;
	}
	@Override 
	public List<Ast> visitLIT_BOOL(LIT_BOOLContext ctx) { //ok
		List<Ast> ret = new ArrayList<>();
		BooleanConst b = new BooleanConst(Boolean.parseBoolean(ctx.getText()));
		ret.add(b);
		return ret;
	}
	@Override
	public List<Ast> visitLIT_INT(LIT_INTContext ctx) { //ok
		List<Ast> ret = new ArrayList<>();

		IntConst i = new IntConst(Integer.parseInt(ctx.getText()));
		ret.add(i);
		
		return ret;
	}
	@Override
	public List<Ast> visitLIT_NULL(LIT_NULLContext ctx) { //ok
		List<Ast> ret = new ArrayList<>();

		NullConst i = new NullConst();
		ret.add(i);
		
		return ret;
	}

	@Override
	public List<Ast> visitStmtBlock(StmtBlockContext ctx) {
		// TODO Auto-generated method stub
		return super.visitStmtBlock(ctx);
	}
	@Override
	public List<Ast> visitNewExpr(NewExprContext ctx) {
		// TODO Auto-generated method stub
		return super.visitNewExpr(ctx);
	}
	@Override
	public List<Ast> visitFormalParamList(FormalParamListContext ctx) {
		// TODO Auto-generated method stub
		return super.visitFormalParamList(ctx);
	}
	@Override
	public List<Ast> visitMethodCallExpression(MethodCallExpressionContext ctx) {
		// TODO Auto-generated method stub
		return super.visitMethodCallExpression(ctx);
	}
	@Override
	public List<Ast> visitMethodCallExpr(MethodCallExprContext ctx) {
		// TODO Auto-generated method stub
		return super.visitMethodCallExpr(ctx);
	}
	@Override
	public List<Ast> visitActualParamList(ActualParamListContext ctx) {
		// TODO Auto-generated method stub
		return super.visitActualParamList(ctx);
	}
	@Override
	public List<Ast> visitReadExpr(ReadExprContext ctx) {
		// TODO Auto-generated method stub
		return super.visitReadExpr(ctx);
	}
	@Override
	public List<Ast> visitIdentAccess(IdentAccessContext ctx) {
		// TODO Auto-generated method stub
		return super.visitIdentAccess(ctx);
	}
}