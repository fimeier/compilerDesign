package cd.frontend.semantic;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import cd.frontend.semantic.SemanticFailure.Cause;
import cd.ir.Ast.ClassDecl;
import cd.ir.Ast.MethodDecl;
import cd.ir.Ast.VarDecl;
import cd.ir.Ast;
import cd.ir.AstVisitor;
import cd.ir.Symbol;
import cd.ir.Symbol.ArrayTypeSymbol;
import cd.ir.Symbol.ClassSymbol;
import cd.ir.Symbol.MethodSymbol;
import cd.ir.Symbol.TypeSymbol;
import cd.ir.Symbol.VariableSymbol;
import cd.ir.Symbol.VariableSymbol.Kind;

public class TableCreator extends AstVisitor<Symbol, Integer>{
	protected final SemanticAnalyzer sa;
	//private ClassTable classTable;

	TableCreator(SemanticAnalyzer semanticAnalyzer) {
		sa = semanticAnalyzer;
	}

	@Override
	public ClassSymbol classDecl(ClassDecl ast, Integer arg) {
		ClassSymbol classSymbol = sa.globalClassTable.get(ast.name);
		for (VarDecl vd : ast.fields()){
			VariableSymbol varSym = varDecl(vd,2);
			if (!classSymbol.fields.containsKey(varSym.name))
				classSymbol.fields.put(varSym.name, varSym);
			else
				throw new SemanticFailure(Cause.DOUBLE_DECLARATION);
		}
		for (MethodDecl md : ast.methods()){
			MethodSymbol methSym =  methodDecl(md, arg);
			if (!classSymbol.fields.containsKey(methSym.name))
				classSymbol.methods.put(methSym.name, methSym);
			else
				throw new SemanticFailure(Cause.DOUBLE_DECLARATION);
		}
		if (sa.globalClassTable.get(ast.superClass) != null)
			classSymbol.superClass = sa.globalClassTable.get(ast.superClass);
		else
			throw new SemanticFailure(Cause.NO_SUCH_TYPE);
		ast.sym = classSymbol;
		return classSymbol;
	}

	
	
	@Override
	public MethodSymbol methodDecl(MethodDecl ast, Integer arg) {
		MethodSymbol methodSymbol = new MethodSymbol(ast);
		
		Map<String, Void> parameters = new HashMap<String, Void>();
			
		// add Parameter variables
		for (int i = 0; i<ast.argumentNames.size(); i++){
			String type = ast.argumentTypes.get(i);
			String name = ast.argumentNames.get(i);
			VarDecl vd = new VarDecl(type, name);
			VariableSymbol varSym = varDecl(vd,0);
			if (!parameters.containsKey(varSym.name)) {
				methodSymbol.parameters.add(i, varSym);
				parameters.put(varSym.name, null);
			}
			else
				throw new SemanticFailure(Cause.DOUBLE_DECLARATION);
			
		}
		
		for (int i = 0; i<ast.decls().children().size(); i++){
			VarDecl vd = (VarDecl )ast.decls().children().get(i);
			VariableSymbol varSym = varDecl(vd,1);
			
			if (!parameters.containsKey(varSym.name) && !methodSymbol.locals.containsKey(varSym.name))
				methodSymbol.locals.put(varSym.name, varSym);
			else
				throw new SemanticFailure(Cause.DOUBLE_DECLARATION);
		}
		
		// TODO: check null ..
		methodSymbol.returnType = checkType(ast.returnType);
		
		return methodSymbol;
		
	}

	TypeSymbol checkType(String typeName){
		// Type of the variable: Primitive- , Array- or Classtype
		TypeSymbol type = null;
		if (typeName.endsWith("[]")){
			String arrayType = typeName.split("[]")[0];
			type = sa.getType(arrayType);
			if (type == null){
				throw new SemanticFailure(Cause.NO_SUCH_TYPE);
			} else {
				type = new ArrayTypeSymbol(type);
			}
		} else {
			type = sa.getType(typeName);
			if (type == null){
				throw new SemanticFailure(Cause.NO_SUCH_TYPE);
			} 
		}
		return type;
	}
	
	@Override
	public VariableSymbol varDecl(VarDecl ast, Integer kindArg) { //ok
		VariableSymbol variableSymbol;
		
		String name = ast.name;
		
		TypeSymbol type = checkType(ast.type);
		
		// 0: PARAM, 1: LOCAL, 2: FIELD
		Kind kind = Kind.values()[kindArg];
		
		variableSymbol = new VariableSymbol(name, type, kind);
		ast.sym = variableSymbol;
		return variableSymbol;
	}

	
	
}
