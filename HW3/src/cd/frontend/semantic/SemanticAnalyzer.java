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

	/**finds subclasses
	 * @return true if subClass is a subtype of superClass
	 */
	public boolean isSubtype(ClassSymbol superClass, ClassSymbol subClass) {
		if (superClass == subClass){
			return true;
		}
		if (subClass == globalClassTable.get(ClassSymbol.objectType.name)){
			return false;
		}
		if (subClass == globalClassTable.get(ClassSymbol.nullType.name)){
			return true;
		}

		return isSubtype(superClass,subClass.superClass);
	}



	public void check(List<ClassDecl> classDecls) throws SemanticFailure {

		/*
		 * First round: find all classes
		 */
		for (ClassDecl cd : classDecls){
			ClassSymbol classSymbol = new ClassSymbol(cd);

			/*
			 * Check: OBJECT_CLASS_DEFINED
			 */
			if (cd.name.equals("Object"))
				throw new SemanticFailure(Cause.OBJECT_CLASS_DEFINED);

			if (!globalClassTable.containsKey(cd.name)) 
				globalClassTable.put(cd.name, classSymbol);
			else 
				throw new SemanticFailure(Cause.DOUBLE_DECLARATION);
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

			//add all field names for each class
			for (VarDecl vd : cd.fields()){
				//System.out.println("found field: "+vd.name+" in class="+cd.name );
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
			for (MethodDecl md : cd.methods()){
				//System.out.println("found medhod: "+md.name+" in class="+cd.name );
				MethodSymbol mSym = new MethodSymbol(md);
				if (!classSymbol.methods.containsKey(mSym.name))
					classSymbol.methods.put(mSym.name, mSym);
				else
					throw new SemanticFailure(Cause.DOUBLE_DECLARATION);

				//set class field
				mSym.inClass=classSymbol;
				//set and check method return type
				mSym.returnType = tableCreator.checkType(md.returnType);
				//System.out.println("return type: "+mSym.returnType.name +" "+mSym.name+"(..)");

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

		/*
		 * Fifth round: other checks
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

		/*
		 * Sixth round: other checks
		 */
		for (ClassDecl cd : classDecls){

			/*
			 * Check: INVALID_OVERRIDE
			 */
			ClassSymbol classSymbol = this.globalClassTable.get(cd.name);
			for (MethodDecl md : cd.methods()){
				MethodSymbol mSym = classSymbol.getMethod(md.name);
				MethodSymbol mSymSuperClass = tableCreator.getMethod(mSym.name, classSymbol.superClass);
				if (mSymSuperClass!=null){

					//compare return-type
					if(mSym.returnType.name!=mSymSuperClass.returnType.name)
						throw new SemanticFailure(Cause.INVALID_OVERRIDE);	
					//compare arg-count
					if(mSym.parameters.size()!=mSymSuperClass.parameters.size())
						throw new SemanticFailure(Cause.INVALID_OVERRIDE);
					//compare parameter-type
					int i = 0;
					for(VariableSymbol varSym: mSym.parameters){
						if(!varSym.type.name.equals(mSymSuperClass.parameters.get(i).type.name))
							throw new SemanticFailure(Cause.INVALID_OVERRIDE);
					}
				}
			}


		}

		/*
		 * Check: INVALID_START_POINT
		 */
		//class main?
		ClassSymbol classSymbol = this.globalClassTable.get("Main");		
		if (classSymbol==null){
			throw new SemanticFailure(Cause.INVALID_START_POINT);
		}
		//Main.main()?
		MethodSymbol methodSymbol = classSymbol.methods.get("main");
		if (methodSymbol==null)
			throw new SemanticFailure(Cause.INVALID_START_POINT);
		//return-type void?
		if (!methodSymbol.returnType.name.equals(PrimitiveTypeSymbol.voidType.name))
			throw new SemanticFailure(Cause.INVALID_START_POINT);
		//no args
		if(methodSymbol.parameters.size()!=0)
			throw new SemanticFailure(Cause.INVALID_START_POINT);


	}

}

