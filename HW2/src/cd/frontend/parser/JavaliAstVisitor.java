package cd.frontend.parser;

import java.util.ArrayList;
import java.util.List;

import org.antlr.v4.runtime.misc.NotNull;
import org.antlr.v4.runtime.tree.TerminalNode;

import cd.ToDoException;
import cd.frontend.parser.JavaliParser.*;
import cd.ir.Ast;
import cd.ir.Ast.ClassDecl;
import cd.ir.Ast.MethodDecl;
import cd.ir.Ast.Seq;
import cd.ir.Ast.VarDecl;

public final class JavaliAstVisitor extends JavaliBaseVisitor<List<Ast>> {
	
public List<ClassDecl> classDecls = new ArrayList<>();
	

	//@Override
	//public List<? extends Ast> visitUnit(UnitContext ctx) {
		
		//System.out.println(ctx.getText().toString());
		//ctx.getText()
	//	return null;
	//}
	
	@Override
	public List<Ast> visitClassDecl(ClassDeclContext ctx) {
		
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
	public List<Ast> visitMemberList(MemberListContext ctx) {
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
	// ( type | 'void' ) Identifier '('  formalParamList? ')'
	//'{' varDecl* stmt* '}'
	public List<Ast> visitMethodDecl(MethodDeclContext ctx) {
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
		
		
		
		Seq body = new Seq(new ArrayList<Ast>());
		
		MethodDecl methodDecl = 
				new MethodDecl(returnType, name, argumentTypes, argumentNames, decls, body);
	
		members.add(methodDecl);
		return members;
	}

	@Override //DONE
	// type Identifier (',' Identifier)* ';'
	public List<Ast> visitVarDecl(VarDeclContext ctx) {
		List<Ast> members = new ArrayList<>();
		
		String type = ctx.type().getText();
		
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
	
}