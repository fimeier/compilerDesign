package cd.frontend.semantic;

import cd.ir.Ast;
import cd.ir.Ast.ClassDecl;
import cd.ir.Ast.MethodDecl;
import cd.ir.Ast.VarDecl;
import cd.ir.AstVisitor;

public class TableCreator extends AstVisitor<SymbolTable, Void>{
	protected final SemanticAnalyzer sa;

	TableCreator(SemanticAnalyzer semanticAnalyzer) {
		sa = semanticAnalyzer;
	}
	
	public void gen(Ast ast) {
		visit(ast, null);
	}

	@Override
	public SymbolTable classDecl(ClassDecl ast, Void arg) {
		// TODO Auto-generated method stub
		return super.classDecl(ast, arg);
	}

	@Override
	public SymbolTable methodDecl(MethodDecl ast, Void arg) {
		// TODO Auto-generated method stub
		return super.methodDecl(ast, arg);
	}

	@Override
	public SymbolTable varDecl(VarDecl ast, Void arg) {
		// TODO Auto-generated method stub
		return super.varDecl(ast, arg);
	}

	
	
}
