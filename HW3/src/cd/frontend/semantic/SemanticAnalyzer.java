package cd.frontend.semantic;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import cd.Main;
import cd.frontend.semantic.SemanticFailure.Cause;
import cd.ir.Ast.ClassDecl;
import cd.ir.Ast.MethodDecl;
import cd.ir.Ast.VarDecl;
import cd.ir.Ast;
import cd.ir.Symbol;
import cd.ir.Symbol.ClassSymbol;
import cd.ir.Symbol.MethodSymbol;
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

		//TODO: special "classes"
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
	
	/**finds circles in inheritances
	 * @return true if a circle has been found
	 */
	private boolean hasInheritanceCircle(ClassSymbol superClass, ClassSymbol startClass) {
		if (superClass == startClass){
			return true;
		}
		if (superClass == globalClassTable.get(ClassSymbol.objectType.name)){
			return false;
		}
		return hasInheritanceCircle(superClass.superClass,startClass);
	}


	public void check(List<ClassDecl> classDecls) throws SemanticFailure {

		/*
		 * First round: find all classes
		 */
		//TODO: create Map globalClassTable and add all "class names" (for lookup) 
		for (ClassDecl cd : classDecls){
			ClassSymbol classSymbol = new ClassSymbol(cd);
			if (!globalClassTable.containsKey(cd.name)) {
				globalClassTable.put(cd.name, classSymbol);
			}
		}
		/*
		 * Second round: find all fields && set super classes
		 */
		for (ClassDecl cd : classDecls){
			//sets the superClass field for each class in the globalClassTable
			ClassSymbol classSymbol = this.globalClassTable.get(cd.name);
			if (globalClassTable.get(cd.superClass) != null){
				classSymbol.superClass = globalClassTable.get(cd.superClass);
			}
			else
				throw new SemanticFailure(Cause.NO_SUCH_TYPE);

			//TODO: add all field names for each class
			for (VarDecl vd : cd.fields()){
				System.out.println("found field: "+vd.name+" in class="+cd.name );
				VariableSymbol kindSym = new VariableSymbol("kind", null, VariableSymbol.Kind.FIELD);
				VariableSymbol varSym = tableCreator.varDecl(vd,kindSym);
				if (!classSymbol.fields.containsKey(varSym.name))
					classSymbol.fields.put(varSym.name, varSym);
				else
					throw new SemanticFailure(Cause.DOUBLE_DECLARATION);
			}			
		}

		/*
		 * Third round: find all methods and check return types and arguments
		 * here we set the method return type and the arguments
		 * the rest will be set in the TableCreator.methodDecl called by classDecl
		 */
		for (ClassDecl cd : classDecls){
			ClassSymbol classSymbol = this.globalClassTable.get(cd.name);		
			//add all method names for each class
			/* TODO: 
			 * check return type
			 * argument types
			 */
			for (MethodDecl md : cd.methods()){
				System.out.println("found medhod: "+md.name+" in class="+cd.name );
				MethodSymbol mSym = new MethodSymbol(md);
				if (!classSymbol.methods.containsKey(mSym.name))
					classSymbol.methods.put(mSym.name, mSym);
				else
					throw new SemanticFailure(Cause.DOUBLE_DECLARATION);
				//set class field
				mSym.inClass=classSymbol;
				//set and check method return type
				mSym.returnType = tableCreator.checkType(md.returnType);
				System.out.println("return type: "+mSym.returnType.name +" "+mSym.name+"(..)");

				Map<String, Void> parameters = new HashMap<String, Void>();
				// add Parameter variables
				for (int i = 0; i<md.argumentNames.size(); i++){
					String type = md.argumentTypes.get(i);
					String name = md.argumentNames.get(i);
					VarDecl vd = new VarDecl(type, name);
					VariableSymbol kindSym = new VariableSymbol("kind", null, VariableSymbol.Kind.PARAM);
					VariableSymbol varSym = tableCreator.varDecl(vd, kindSym);
					if (!parameters.containsKey(varSym.name)) {
						mSym.parameters.add(i, varSym);
						parameters.put(varSym.name, null);
					}
					else
						throw new SemanticFailure(Cause.DOUBLE_DECLARATION);

				}

			}
		}
		
		/*
		 * Fourth round: fill in rest of symbol table
		 */
		for (ClassDecl cd : classDecls){
			tableCreator.classDecl(cd, null);
		}
		
		/*TODO: allenfalls können die Tests auch früher ausgeführt werden...
		 * jedoch wird es dann unübersichtlicher
		 *
		 * Fifth round: do all other checks
		 */
		for (ClassDecl cd : classDecls){
			
			/*
			 * Check: CIRCULAR_INHERITANCE
			 */
			ClassSymbol startClass = this.globalClassTable.get(cd.name);
			if (this.hasInheritanceCircle(startClass.superClass,startClass)){
				throw new SemanticFailure(Cause.CIRCULAR_INHERITANCE);
			}
		}

	}

}

	