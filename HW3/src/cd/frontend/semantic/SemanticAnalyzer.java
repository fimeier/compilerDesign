package cd.frontend.semantic;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import cd.Main;
import cd.frontend.semantic.SemanticFailure.Cause;
import cd.ir.Ast.ClassDecl;
import cd.ir.Ast.VarDecl;
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
		
		builtInTypeTable.put(PrimitiveTypeSymbol.intType.name, PrimitiveTypeSymbol.intType);
		builtInTypeTable.put(PrimitiveTypeSymbol.booleanType.name, PrimitiveTypeSymbol.booleanType);
		builtInTypeTable.put(PrimitiveTypeSymbol.voidType.name, PrimitiveTypeSymbol.voidType);
		
		globalClassTable.put(ClassSymbol.objectType.name, ClassSymbol.objectType);
		globalClassTable.put(ClassSymbol.nullType.name, ClassSymbol.nullType);
	}
	
	/*
	 * looks up 'type' in global class- and type table 
	 * returns TypeSymbol or 'null' if not found
	 */
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
				ClassSymbol classSymbol = new ClassSymbol(cd);
				if (!globalClassTable.containsKey(cd.name)) {
					globalClassTable.put(cd.name, classSymbol);
				}
			}
			for (ClassDecl cd : classDecls){
				ClassSymbol classSymbol = this.globalClassTable.get(cd.name);
				if (globalClassTable.get(cd.superClass) != null){
					classSymbol.superClass = globalClassTable.get(cd.superClass);
				}
				else
					throw new SemanticFailure(Cause.NO_SUCH_TYPE);
				
				for (VarDecl vd : cd.fields()){
					VariableSymbol kindSym = new VariableSymbol("kind", null, VariableSymbol.Kind.FIELD);
					VariableSymbol varSym = tableCreator.varDecl(vd,kindSym);
					if (!classSymbol.fields.containsKey(varSym.name))
						classSymbol.fields.put(varSym.name, varSym);
					else
						throw new SemanticFailure(Cause.DOUBLE_DECLARATION);
				}
			}

			for (ClassDecl cd : classDecls){
				tableCreator.classDecl(cd, null);
			}
		}
	}

}
