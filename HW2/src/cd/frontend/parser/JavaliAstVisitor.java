package cd.frontend.parser;

import java.util.ArrayList;
import java.util.List;

import org.antlr.v4.runtime.tree.TerminalNode;

import cd.frontend.parser.JavaliParser.*;
import cd.ir.Ast;
import cd.ir.Ast.Assign;
import cd.ir.Ast.BinaryOp;
import cd.ir.Ast.BooleanConst;
import cd.ir.Ast.BuiltInWrite;
import cd.ir.Ast.BuiltInWriteln;
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
import cd.ir.Ast.NewArray;
import cd.ir.Ast.NewObject;
import cd.ir.Ast.Nop;
import cd.ir.Ast.NullConst;
import cd.ir.Ast.ReturnStmt;
import cd.ir.Ast.Seq;
import cd.ir.Ast.ThisRef;
import cd.ir.Ast.UnaryOp;
import cd.ir.Ast.Var;
import cd.ir.Ast.VarDecl;
import cd.ir.Ast.WhileLoop;
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
		
		int count = ctx.memberListBody().size();
		for (int i = 0;i < count; i++){
			members.addAll(visitMemberListBody(ctx.memberListBody(i)));
		}
				
		return members;
	}
	public List<Ast> visitMemberListBody(MemberListBodyContext ctx) { //ok
		List<Ast> ret = new ArrayList<>();
	
		switch (ctx.getClass().getSimpleName()) {
    		case "VarDContext":  
    			ret.addAll(visitVarD((VarDContext) ctx));
    			break;
    		case "MethodDContext":  
    			ret.addAll(visitMethodD((MethodDContext) ctx));
    			break;
		}
		return ret;
	}
	@Override
	public List<Ast> visitVarD(VarDContext ctx) { //ok
		List<Ast> ret = new ArrayList<>();
		ret.addAll(visitVarDecl(ctx.varDecl()));
		return ret;
	}
	@Override
	public List<Ast> visitMethodD(MethodDContext ctx) { //ok
		List<Ast> ret = new ArrayList<>();
		ret.addAll(visitMethodDecl(ctx.methodDecl()));
		return ret;
	}
	@Override
	public List<Ast> visitVarDecl(VarDeclContext ctx) { //ok
		List<Ast> members = new ArrayList<>();
		
		String type = ctx.type().getText();
		
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
 			returnType = ctx.type().getText();
		String name = ctx.Identifier().toString();
		List<String> argumentTypes = new ArrayList<>();
		List<String> argumentNames = new ArrayList<>();
		
		if (ctx.formalParamList()!=null){
			FormalParamListContext fp = ctx.formalParamList();
			for (int i = 0; i<fp.getChildCount();i=i+3){
				String argType = fp.getChild(i).getText();
				String argName = fp.getChild(i+1).getText();
				argumentTypes.add(argType);
				argumentNames.add(argName);
			}
		}
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
        	case "WRITEContext":  
        		ret.addAll(visitWRITE((WRITEContext) ctx.writeStmt())); break;
        	case "WRITELNContext":  
        		ret.addAll(visitWRITELN((WRITELNContext) ctx.writeStmt())); break;
		}

		return ret;
	}
	@Override // '{' stmt* '}'
	public List<Ast> visitStmtBlock(StmtBlockContext ctx) { //ok
		List<Ast> ret = new ArrayList<>();
		List<Ast> nodes = new ArrayList<>();
		int count = ctx.stmt().size();
		for (int i = 0; i<count; i++){
			nodes.addAll(visitStmt(ctx.stmt(i)));
		}
		Seq seq = new Seq(nodes);
		ret.add(seq);
		return ret;
	}
	@Override
	public List<Ast> visitAssignmentStmt(AssignmentStmtContext ctx) { //ok
		List<Ast> ret = new ArrayList<>();
		
		Expr var = (Expr) visitIdentAccess(ctx.identAccess()).get(0);
		
		Expr right = null;
						
		if (ctx.expr() != null){
			right = (Expr )visitExpr(ctx.expr()).get(0);
		}
		else if (ctx.newExpr() != null){
			right = (Expr )visitNewExpr(ctx.newExpr()).get(0);
		}
		else if (ctx.readExpr() != null){
			right = (Expr )visitReadExpr(ctx.readExpr()).get(0);
		}
		
		Assign assign = new Assign(var, right);
		ret.add(assign);
		return ret;
	}
	@Override
	public List<Ast> visitMethodCallStmt(MethodCallStmtContext ctx) { //ok
		List<Ast> ret = new ArrayList<>();
		
        MethodCallExpr mce = (MethodCallExpr) visitMethodCallExpression(ctx.methodCallExpression()).get(0);
       
        if (ctx.identAccess() != null){
            mce.setReceiver((Expr) visitIdentAccess(ctx.identAccess()).get(0));
        }
        MethodCall mc = new MethodCall(mce);
        ret.add(mc);
        return ret;
    }
	@Override // 'if' '(' expr ')' stmtBlock ('else' stmtBlock)?
	public List<Ast> visitIfStmt(IfStmtContext ctx) { //ok
		List<Ast> ret = new ArrayList<>();
		
		Expr cond = (Expr) visitExpr(ctx.expr()).get(0);
		Ast then = visitStmtBlock(ctx.stmtBlock(0)).get(0);
		
		Ast otherwise;
		if (ctx.stmtBlock(1) != null){
			otherwise = visitStmtBlock(ctx.stmtBlock(1)).get(0);
		} else {
			otherwise = new Nop();
		}
		IfElse ifelse = new IfElse(cond, then, otherwise);
		ret.add(ifelse);
		return ret;
	}
	@Override // 'while' '(' expr ')' stmtBlock
	public List<Ast> visitWhileStmt(WhileStmtContext ctx) { //ok
		List<Ast> ret = new ArrayList<>();
		
		Expr condition = (Expr) visitExpr(ctx.expr()).get(0) ;
		Ast body = visitStmtBlock(ctx.stmtBlock()).get(0);
		WhileLoop wl = new WhileLoop(condition, body);
		ret.add(wl);
		return ret;
	}
	@Override // 'return' expr? ';'
	public List<Ast> visitReturnStmt(ReturnStmtContext ctx) { //ok
		List<Ast> ret = new ArrayList<>();
		
		Expr arg;
		if (ctx.expr() != null){
			arg = (Expr) visitExpr(ctx.expr()).get(0);
		} else {
			arg = null;
		}
		
		ReturnStmt rs = new ReturnStmt(arg);
		ret.add(rs);
		return ret;
	}
	@Override // 'write' '(' expr ')' ';'
	public List<Ast> visitWRITE(WRITEContext ctx) { //ok
		List<Ast> ret = new ArrayList<>();

		Expr arg = (Expr) visitExpr(ctx.expr()).get(0);
		BuiltInWrite w = new BuiltInWrite(arg);
		ret.add(w);
		
		return ret;
	} // 'writeln' '(' ')' ';'
	@Override
	public List<Ast> visitWRITELN(WRITELNContext ctx) { //ok
		List<Ast> ret = new ArrayList<>();
		BuiltInWriteln w = new BuiltInWriteln();
		ret.add(w);
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

	@Override //'new' newBody
	public List<Ast> visitNewExpr(NewExprContext ctx) { //ok
		List<Ast> ret = new ArrayList<>();
		
		switch (ctx.newBody().getClass().getSimpleName()){
			case "CONSTRCT_OBJECTContext":  
				ret.addAll(visitCONSTRCT_OBJECT((CONSTRCT_OBJECTContext) ctx.newBody()));
				break;
			case "ARRAY_OBJECTContext":  
				ret.addAll(visitARRAY_OBJECT((ARRAY_OBJECTContext) ctx.newBody()));
				break;
			case "PRIMITIVE_ARRAY_OBJECTContext":  
				ret.addAll(visitPRIMITIVE_ARRAY_OBJECT((PRIMITIVE_ARRAY_OBJECTContext) ctx.newBody()));
				break;
		}
			
		return ret;
	}
	@Override
	public List<Ast> visitARRAY_OBJECT(ARRAY_OBJECTContext ctx) { //ok
		List<Ast> ret = new ArrayList<>();
		
		String typeName = ctx.Identifier().getText()+"[]";
		Expr capacity = (Expr) visitExpr(ctx.expr()).get(0);
		
		NewArray na = new NewArray(typeName, capacity);
		ret.add(na);
		
		return ret;
	}
	@Override
	public List<Ast> visitPRIMITIVE_ARRAY_OBJECT(PRIMITIVE_ARRAY_OBJECTContext ctx) { //ok
		List<Ast> ret = new ArrayList<>();
		
		String typeName =  ctx.primitiveType().getText() +"[]";
		Expr capacity = (Expr) visitExpr(ctx.expr()).get(0);
		
		NewArray na = new NewArray(typeName, capacity);
		ret.add(na);
		
		return ret;
	}
	@Override
	public List<Ast> visitCONSTRCT_OBJECT(CONSTRCT_OBJECTContext ctx) { //ok
		List<Ast> ret = new ArrayList<>();
					
		String typeName = ctx.Identifier().getText();
		NewObject no = new NewObject(typeName);
		ret.add(no);
		return ret;
	}
	@Override // Identifier '(' (expr (',' expr)*)? ')'
	public List<Ast> visitMethodCallExpression(MethodCallExpressionContext ctx) { //ok
		List<Ast> ret = new ArrayList<>();

		Expr rcvr = new ThisRef(); 
	    String methodName = ctx.Identifier().getText();
	    List<Expr> arguments = new ArrayList<>();
	    int count = ctx.expr().size();
	    for (int i = 0; i < count; i++){
	    	arguments.add((Expr) visitExpr(ctx.expr(i)).get(0));
	    }

	    MethodCallExpr mce = new MethodCallExpr(rcvr, methodName, arguments);
        ret.add(mce);
         
        return ret;
 
    }
	@Override //'read' '(' ')'
	public List<Ast> visitReadExpr(ReadExprContext ctx) {
		List<Ast> ret = new ArrayList<>();
		Ast.BuiltInRead b = new Ast.BuiltInRead();
		ret.add(b);
		return ret;
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
    		case "ACCESS_METHODCALL_SEQContext":  
    			ret.addAll(visitACCESS_METHODCALL_SEQ((ACCESS_METHODCALL_SEQContext) ctx));
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
	@Override // methodCallExpression
	public List<Ast> visitACCESS_METHODCALL(ACCESS_METHODCALLContext ctx) { //ok
		List<Ast> ret = new ArrayList<>();
		
		MethodCallExpr mce = (MethodCallExpr) visitMethodCallExpression(ctx.methodCallExpression()).get(0);

		ret.add(mce);		
		return ret;
	}
	@Override //identAccess '.' methodCallExpression
	public List<Ast> visitACCESS_METHODCALL_SEQ(ACCESS_METHODCALL_SEQContext ctx) { //ok
		List<Ast> ret = new ArrayList<>();
		
		MethodCallExpr mce = (MethodCallExpr) visitMethodCallExpression(ctx.methodCallExpression()).get(0);
	       
	    if (!ctx.identAccess().isEmpty()){
	    	mce.setReceiver((Expr) visitIdentAccess(ctx.identAccess()).get(0));
	    }
		
		ret.add(mce);
		return ret;
	}
	
}