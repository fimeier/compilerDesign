package cd.frontend.semantic;

import cd.frontend.semantic.SemanticFailure.Cause;
import cd.ir.Ast.ClassDecl;
import cd.ir.Ast.MethodDecl;
import cd.ir.Ast.VarDecl;
import cd.ir.AstVisitor;
import cd.ir.Symbol;
import cd.ir.Symbol.ArrayTypeSymbol;
import cd.ir.Symbol.ClassSymbol;
import cd.ir.Symbol.TypeSymbol;
import cd.ir.Symbol.VariableSymbol;

public class TableCreator extends AstVisitor<Symbol, Void>{
	protected final SemanticAnalyzer sa;
	//private ClassTable classTable;

	TableCreator(SemanticAnalyzer semanticAnalyzer) {
		sa = semanticAnalyzer;
	}

	@Override
	public ClassSymbol classDecl(ClassDecl ast, Void arg) {
		ClassSymbol classSymbol = new ClassSymbol(ast);
		for (VarDecl vd : ast.fields()){
			VariableSymbol varSym = varDecl(vd,arg);
			classSymbol.fields.put(varSym.name, varSym);
		}
		//TODO:
		
		ast.sym = classSymbol;
		return classSymbol;
	}

	@Override
	public Symbol methodDecl(MethodDecl ast, Void arg) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public VariableSymbol varDecl(VarDecl ast, Void arg) { //ok
		VariableSymbol variableSymbol;
		
		String name = ast.name;
		
		TypeSymbol type = null;
		if (ast.type.endsWith("[]")){
			String arrayType = ast.type.split("[]")[0];
			type = sa.getType(arrayType);
			if (type == null){
				throw new SemanticFailure(Cause.NO_SUCH_TYPE);
			} else {
				type = new ArrayTypeSymbol(type);
			}
		} else {
			type = sa.getType(ast.type);
			if (type == null){
				throw new SemanticFailure(Cause.NO_SUCH_TYPE);
			} 
		}
		
		//TODO: change kind in calling class
		variableSymbol = new VariableSymbol(name, type);
		ast.sym = variableSymbol;
		return variableSymbol;
	}

	
	
}
