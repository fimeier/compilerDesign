package cd.frontend.parser;

import java.util.ArrayList;
import java.util.List;

import org.antlr.v4.runtime.misc.NotNull;

import cd.ToDoException;
import cd.frontend.parser.JavaliParser.*;
import cd.ir.Ast;
import cd.ir.Ast.ClassDecl;
import cd.ir.Ast.MethodDecl;
import cd.ir.Ast.Seq;

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
		Seq decls = new Seq(new ArrayList<Ast>());
		Seq body = new Seq(new ArrayList<Ast>());
		
		MethodDecl methodDecl = 
				new MethodDecl(returnType, name, argumentTypes, argumentNames, decls, body);
	
		members.add(methodDecl);
		return members;
	}

	@Override
	public List<Ast> visitVarDecl(VarDeclContext ctx) {
		List<Ast> members = new ArrayList<>();
		return members;
	}
	
	
}