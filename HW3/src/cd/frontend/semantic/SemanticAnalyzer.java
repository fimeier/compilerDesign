package cd.frontend.semantic;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import cd.Main;
import cd.frontend.semantic.SemanticFailure.Cause;
import cd.ir.Ast.ClassDecl;
import cd.ir.Symbol;
import cd.ir.Symbol.ClassSymbol;
import cd.ir.Symbol.PrimitiveTypeSymbol;
import cd.ir.Symbol.TypeSymbol;
import cd.ir.Symbol.VariableSymbol;

public class SemanticAnalyzer {
	
	public final Main main;
	public final Map<String, ClassSymbol> globalClassTable;
	public final Map<String, TypeSymbol> builtInTypeTable;
	private TableCreator tableCreator;
	
	public SemanticAnalyzer(Main main) {
		this.main = main;
		this.globalClassTable = new HashMap<String, ClassSymbol>();
		this.builtInTypeTable = new HashMap<String, TypeSymbol>();
		this.tableCreator = new TableCreator(this);
		
		builtInTypeTable.put("int", PrimitiveTypeSymbol.intType);
		builtInTypeTable.put("boolean", PrimitiveTypeSymbol.booleanType);
		builtInTypeTable.put("void", PrimitiveTypeSymbol.voidType);
	}
	
	public TypeSymbol getType(String type){
		if (builtInTypeTable.containsKey(type))
			return builtInTypeTable.get(type);
		else if (globalClassTable.containsKey(type))
			return globalClassTable.get(type);
		else
		return null;
	}
	
	public void check(List<ClassDecl> classDecls) throws SemanticFailure {
		{	
			for (ClassDecl cd : classDecls){
				if (!globalClassTable.containsKey(cd.name))
					globalClassTable.put(cd.name, tableCreator.classDecl(cd, null));
				else 
					throw new SemanticFailure(Cause.DOUBLE_DECLARATION);
			}
		}
	}

}
