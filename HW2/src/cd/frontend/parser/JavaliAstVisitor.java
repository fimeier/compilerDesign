package cd.frontend.parser;

import java.util.ArrayList;
import java.util.Collection;
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
import cd.ir.Ast.BinaryOp;
import cd.ir.Ast.BooleanConst;
import cd.ir.Ast.Cast;
import cd.ir.Ast.ClassDecl;
import cd.ir.Ast.Expr;
import cd.ir.Ast.Field;
import cd.ir.Ast.IfElse;
import cd.ir.Ast.Index;
import cd.ir.Ast.IntConst;
import cd.ir.Ast.MethodCall;
import cd.ir.Ast.MethodCallExpr;
import cd.ir.Ast.MethodDecl;
import cd.ir.Ast.Nop;
import cd.ir.Ast.NullConst;
import cd.ir.Ast.Seq;
import cd.ir.Ast.ThisRef;
import cd.ir.Ast.UnaryOp;
import cd.ir.Ast.Var;
import cd.ir.Ast.VarDecl;
import cd.ir.Ast.BinaryOp.BOp;
import cd.ir.Ast.UnaryOp.UOp;

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
	@Override // '{' stmt* '}'
	public List<Ast> visitStmtBlock(StmtBlockContext ctx) { //ok
		List<Ast> ret = new ArrayList<>();
		List<Ast> nodes = new ArrayList<>();
		int count = ctx.stmt().size();
		for (int i = 0; i<count; i++){
			System.out.println(ctx.stmt(i).getText());
			nodes.addAll(visitStmt(ctx.stmt(i)));
		}
		if (nodes.isEmpty()){
			nodes.add(new Nop());
		}
		Seq seq = new Seq(nodes);
		ret.add(seq);
		return ret;
	}
	@Override
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
	public List<Ast> visitMethodCallStmt(MethodCallStmtContext ctx) { //ok
		List<Ast> ret = new ArrayList<>();
<<<<<<< HEAD
        MethodCallExpr mce = (MethodCallExpr) visitMethodCallExpression(ctx.methodCallExpression()).get(0);
         
        MethodCall mc = new MethodCall(mce);
        ret.add(mc);
        //TODO: implement
        return ret;
    }
	@Override
	public List<Ast> visitIfStmt(IfStmtContext ctx) {
=======
		ret.addAll(visitMethodCallExpression(ctx.methodCallExpression()));
		return ret;
	}
	@Override // 'if' '(' expr ')' stmtBlock ('else' stmtBlock)?
	public List<Ast> visitIfStmt(IfStmtContext ctx) { //ok
>>>>>>> origin/master
		List<Ast> ret = new ArrayList<>();
		System.out.println("if");
		
		Expr cond = (Expr) visitExpr(ctx.expr()).get(0);
		Ast then = visitStmtBlock(ctx.stmtBlock(0)).get(0);
		
		Ast otherwise;
		if (ctx.stmtBlock(1) != null){
			otherwise = (Ast) visitStmtBlock(ctx.stmtBlock(1));
		} else {
			otherwise = new Nop();
		}
		IfElse ifelse = new IfElse(cond, then, otherwise);
		ret.add(ifelse);
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
	public List<Ast> visitIDENTACCESS(IDENTACCESSContext ctx) { //ok
		List<Ast> ret = new ArrayList<>();
		ret.addAll(visitIdentAccess(ctx.identAccess()));
		return ret;
	}


	@Override
	public List<Ast> visitEXPR(EXPRContext ctx) { //ok
		List<Ast> ret = new ArrayList<>();
		ret.add(visitExpr(ctx.expr()).get(0));
		return ret;
	}
	@Override
	public List<Ast> visitSIGNEXPR(SIGNEXPRContext ctx) { //ok
		List<Ast> ret = new ArrayList<>();
		
		UOp operator = null; 
		switch (ctx.getChild(0).toString()) {
    		case "-":  
    			operator = UOp.U_MINUS;
    			break;
    		case "+":  
    			operator = UOp.U_PLUS;
    			break;
    		case "!":  
    			operator = UOp.U_BOOL_NOT;
    			break;
		}
		Expr arg = (Expr) visitExpr(ctx.expr()).get(0);
		UnaryOp uop = new UnaryOp(operator, arg);
		
		ret.add(uop);
		return ret;
	}
	@Override // '(' referenceType ')' expr
	public List<Ast> visitCASTEXPR(CASTEXPRContext ctx) { //ok
		List<Ast> ret = new ArrayList<>();
		
		// TODO: change to referenceType visitor
		String typeName = ctx.referenceType().getText();
		Expr arg = (Expr) visitExpr(ctx.expr()).get(0);		
		Cast cast = new Cast(arg, typeName);
		ret.add(cast);
		
		return ret;
	}


	@Override
	public List<Ast> visitBINOPSTRONG(BINOPSTRONGContext ctx) { //ok
		List<Ast> ret = new ArrayList<>();
		
		BOp operator = null; 
		switch (ctx.getChild(1).toString()) {
    		case "*":  
    			operator = BOp.B_TIMES;
    			break;
    		case "/":  
    			operator = BOp.B_DIV;
    			break;
    		case "%":  
    			operator = BOp.B_MOD;
    			break;
		}
		Expr left = (Expr) visitExpr(ctx.expr(0)).get(0);
		Expr right = (Expr) visitExpr(ctx.expr(1)).get(0);
		BinaryOp binop = new BinaryOp(left, operator, right);
		ret.add(binop);
		return ret;
	}

	@Override
	public List<Ast> visitBINOPWEAK(BINOPWEAKContext ctx) { //ok
		List<Ast> ret = new ArrayList<>();
		
		BOp operator = null; 
		switch (ctx.getChild(1).toString()) {
    		case "+":  
    			operator = BOp.B_PLUS;
    			break;
    		case "-":  
    			operator = BOp.B_MINUS;
    			break;
		}
		Expr left = (Expr) visitExpr(ctx.expr(0)).get(0);
		Expr right = (Expr) visitExpr(ctx.expr(1)).get(0);
		BinaryOp binop = new BinaryOp(left, operator, right);
		ret.add(binop);
		return ret;
	}
	@Override
	public List<Ast> visitORDERPEXPR(ORDERPEXPRContext ctx) { //ok
		List<Ast> ret = new ArrayList<>();
		
		BOp operator = null; 
		switch (ctx.getChild(1).toString()) {
    		case "<":  
    			operator = BOp.B_LESS_THAN;
    			break;
    		case "<=":  
    			operator = BOp.B_LESS_OR_EQUAL;
    			break;
    		case ">":  
    			operator = BOp.B_GREATER_THAN;
    			break;
    		case ">=":  
    			operator = BOp.B_GREATER_OR_EQUAL;
    			break;
		}
		Expr left = (Expr) visitExpr(ctx.expr(0)).get(0);
		Expr right = (Expr) visitExpr(ctx.expr(1)).get(0);
		BinaryOp binop = new BinaryOp(left, operator, right);
		ret.add(binop);
		return ret;
	}
	@Override
	public List<Ast> visitEQEXPR(EQEXPRContext ctx) { //ok
		List<Ast> ret = new ArrayList<>();
		
		BOp operator = null; 
		if(ctx.NEQ != null){
			operator = BOp.B_NOT_EQUAL;
		} else if (ctx.EQ != null) {
			operator = BOp.B_EQUAL;

		}
		Expr left = (Expr) visitExpr(ctx.expr(0)).get(0);
		Expr right = (Expr) visitExpr(ctx.expr(1)).get(0);
		BinaryOp binop = new BinaryOp(left, operator, right);
		ret.add(binop);
		return ret;
	}
	@Override
	public List<Ast> visitANDEXPR(ANDEXPRContext ctx) { //ok
		List<Ast> ret = new ArrayList<>();
		BOp operator = BOp.B_AND; 
		Expr left = (Expr) visitExpr(ctx.expr(0)).get(0);
		Expr right = (Expr) visitExpr(ctx.expr(1)).get(0);
		BinaryOp binop = new BinaryOp(left, operator, right);
		ret.add(binop);
		return ret;
	}
	@Override
	public List<Ast> visitOREXPR(OREXPRContext ctx) { //ok
		List<Ast> ret = new ArrayList<>();
		BOp operator = BOp.B_OR; 
		Expr left = (Expr) visitExpr(ctx.expr(0)).get(0);
		Expr right = (Expr) visitExpr(ctx.expr(1)).get(0);
		BinaryOp binop = new BinaryOp(left, operator, right);
		ret.add(binop);
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
		List<Ast> ret = new ArrayList<>();
		 
        System.out.println(ctx.getText());
        // TODO Auto-generated method stub
        //hardcoded ident()
        
         MethodCallExpr mce = null;
 //       MethodCallExpr mce = new MethodCallExpr((Expr) visitExpr((ExprContext) ctx.expr(0).children.get(0)),ctx.children.get(0).getText(),ctx.);
        ret.add(mce);
         
        return ret;
 
//      return super.visitMethodCallExpr(ctx);
    }
	@Override
	public List<Ast> visitReadExpr(ReadExprContext ctx) {
		// TODO Auto-generated method stub
		return super.visitReadExpr(ctx);
	}

	//IdentifierAccess
	public List<Ast> visitIdentAccess(IdentAccessContext ctx) { //ok
		List<Ast> ret = new ArrayList<>();
				
		switch (ctx.getClass().getSimpleName()) {
    		case "ACCESSIDContext":  
    			ret.addAll(visitACCESSID((ACCESSIDContext) ctx));
    			break;
    		case "ACCESSTHISContext":  
    			ret.addAll(visitACCESSTHIS((ACCESSTHISContext) ctx));
    			break;
    		case "ACCESSDOTIDContext":  
    			ret.addAll(visitACCESSDOTID((ACCESSDOTIDContext) ctx));
    			break;
    		case "ACCECSS_BR_EXPRContext":  
    			ret.addAll(visitACCECSS_BR_EXPR((ACCECSS_BR_EXPRContext) ctx));
    			break;
    		case "ACCESS_METHODCALLContext":  
    			ret.addAll(visitACCESS_METHODCALL((ACCESS_METHODCALLContext) ctx));
    			break;
		}
		return ret;
	}
	@Override
	public List<Ast> visitACCESSID(ACCESSIDContext ctx) { //ok
		List<Ast> ret = new ArrayList<>();
		Var v = new Var(ctx.getText());
		ret.add(v);
		return ret;
	}
	@Override
	public List<Ast> visitACCESSTHIS(ACCESSTHISContext ctx) { //ok
		List<Ast> ret = new ArrayList<>();
		ThisRef r = new ThisRef();
		ret.add(r);
		return ret;
	}
	@Override
	public List<Ast> visitACCESSDOTID(ACCESSDOTIDContext ctx) { //ok
		List<Ast> ret = new ArrayList<>();
		
		Expr arg = (Expr) visitIdentAccess(ctx.identAccess()).get(0);
		String fieldName = ctx.Identifier().getText();
		Field f = new Field(arg, fieldName);
		ret.add(f);
		
		return ret;
	}
	@Override
	public List<Ast> visitACCECSS_BR_EXPR(ACCECSS_BR_EXPRContext ctx) { //ok
		List<Ast> ret = new ArrayList<>();
		
		Expr array = (Expr) visitIdentAccess(ctx.identAccess()).get(0);
		Expr index = (Expr) visitExpr(ctx.expr()).get(0);
		Index ind = new Index(array, index);
		ret.add(ind);
		
		return ret;
	}
	@Override
	public List<Ast> visitACCESS_METHODCALL(ACCESS_METHODCALLContext ctx) { //ok
		List<Ast> ret = new ArrayList<>();
		ret.addAll(visitMethodCallExpression(ctx.methodCallExpression()));
		return ret;
	}
	
}