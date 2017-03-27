package cd.frontend.parser;

import java.util.ArrayList;
import java.util.List;

import cd.ToDoException;
import cd.frontend.parser.JavaliParser.ClassDeclContext;
import cd.ir.Ast.ClassDecl;

public final class JavaliAstVisitor extends JavaliBaseVisitor<Void> {
	
	public List<ClassDecl> classDecls = new ArrayList<>();
	@Override
	public Void visitClassDecl(ClassDeclContext ctx) {
		{
			//classDecls = ctx.;
			System.out.println("hello");
			//throw new ToDoException();
		}
		return null;
	}
}
