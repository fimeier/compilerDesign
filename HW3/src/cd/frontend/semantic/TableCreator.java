package cd.frontend.semantic;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.lang.model.type.PrimitiveType;

import cd.frontend.semantic.SemanticFailure.Cause;
import cd.ir.Ast.Assign;
import cd.ir.Ast.BinaryOp;
import cd.ir.Ast.BinaryOp.BOp;
import cd.ir.Ast.BooleanConst;
import cd.ir.Ast.BuiltInRead;
import cd.ir.Ast.BuiltInWrite;
import cd.ir.Ast.Cast;
import cd.ir.Ast.ClassDecl;
import cd.ir.Ast.Expr;
import cd.ir.Ast.Field;
import cd.ir.Ast.IfElse;
import cd.ir.Ast.Index;
import cd.ir.Ast.IntConst;
import cd.ir.Ast.MethodCall;
import cd.ir.Ast.MethodCallExpr;
import cd.ir.Ast.MethodDecl;
import cd.ir.Ast.NewArray;
import cd.ir.Ast.NewObject;
import cd.ir.Ast.NullConst;
import cd.ir.Ast.ReturnStmt;
import cd.ir.Ast.ThisRef;
import cd.ir.Ast.UnaryOp;
import cd.ir.Ast.UnaryOp.UOp;
import cd.ir.Ast.Var;
import cd.ir.Ast.VarDecl;
import cd.ir.Ast.WhileLoop;
import cd.ir.Ast;
import cd.ir.AstVisitor;
import cd.ir.Symbol;
import cd.ir.Symbol.ArrayTypeSymbol;
import cd.ir.Symbol.ClassSymbol;
import cd.ir.Symbol.MethodSymbol;
import cd.ir.Symbol.PrimitiveTypeSymbol;
import cd.ir.Symbol.TypeSymbol;
import cd.ir.Symbol.VariableSymbol;
import cd.ir.Symbol.VariableSymbol.Kind;

public class TableCreator extends AstVisitor<Symbol, Symbol>{
	protected final SemanticAnalyzer sa;

	TableCreator(SemanticAnalyzer semanticAnalyzer) {
		sa = semanticAnalyzer;
	}

	// Declarations:
	@Override
	public ClassSymbol classDecl(ClassDecl ast, Symbol arg) { //ok
		ClassSymbol classSymbol = sa.globalClassTable.get(ast.name);

		//TODO: change structure?????
		for (MethodDecl md : ast.methods()){
			MethodSymbol methSym =  methodDecl(md, classSymbol);
			/*
			 * already checked in SemanticAnalyzer round three
			if (!classSymbol.methods.containsKey(methSym.name))
				classSymbol.methods.put(methSym.name, methSym);
			else
				throw new SemanticFailure(Cause.DOUBLE_DECLARATION);
			 */
		}
		ast.sym = classSymbol;
		return classSymbol;
	}
	@Override
	public MethodSymbol methodDecl(MethodDecl ast, Symbol inClass) { //ok
		//MethodSymbol methodSymbol = new MethodSymbol(ast);
		MethodSymbol methodSymbol = getMethod(ast.name, (ClassSymbol) inClass);

		/*
		 * already "checked" in SemanticAnalyzer round three
		Map<String, Void> parameters = new HashMap<String, Void>();

		// add Parameter variables
		for (int i = 0; i<ast.argumentNames.size(); i++){
			String type = ast.argumentTypes.get(i);
			String name = ast.argumentNames.get(i);
			VarDecl vd = new VarDecl(type, name);
			VariableSymbol kindSym = new VariableSymbol("kind", null, VariableSymbol.Kind.PARAM);
			VariableSymbol varSym = varDecl(vd, kindSym);
			if (!parameters.containsKey(varSym.name)) {
				methodSymbol.parameters.add(i, varSym);
				parameters.put(varSym.name, null);
			}
			else
				throw new SemanticFailure(Cause.DOUBLE_DECLARATION);

		}*/

		//TODO getParameterList????
		//Map<String, Void> parameters = methodSymbol.parameters
		Map<String, VariableSymbol> parameters = getParametersMap(methodSymbol);

		//TODO: stimmt das so? wie sieht es mit Hidding aus....???
		// add local variables
		for (int i = 0; i<ast.decls().children().size(); i++){
			VarDecl vd = (VarDecl )ast.decls().children().get(i);
			VariableSymbol kindSym = new VariableSymbol("kind", null, VariableSymbol.Kind.LOCAL);
			VariableSymbol varSym = varDecl(vd,kindSym);
			if (!parameters.containsKey(varSym.name) && !methodSymbol.locals.containsKey(varSym.name))
				methodSymbol.locals.put(varSym.name, varSym);
			else
				throw new SemanticFailure(Cause.DOUBLE_DECLARATION);
		}

		//TODO: MISSING_RETURN check
		//type is void || "return-statement on method-level"
		if (methodSymbol.returnType.name.equals(PrimitiveTypeSymbol.voidType.name) || ast.body().childrenOfType(Ast.ReturnStmt.class).size()!=0){
			//System.out.println("MISSING_RETURN check ("+methodSymbol.name+"): type is void || \"return-statement on method-level\"");
			visit(ast.body(), methodSymbol);
		} else {
			//System.out.println("MISSING_RETURN check ("+methodSymbol.name+"): Each statement needs a return-stm...");
			if (missingReturnStatement(ast.body(),methodSymbol)){
				throw new SemanticFailure(Cause.MISSING_RETURN);
			}
		};
		return methodSymbol;
	}
	@Override
	public VariableSymbol varDecl(VarDecl ast, Symbol kindArg) { //ok
		VariableSymbol variableSymbol;

		String name = ast.name;

		TypeSymbol type = checkType(ast.type);

		// 0: PARAM, 1: LOCAL, 2: FIELD
		Kind kind =  ((VariableSymbol)kindArg).kind;

		variableSymbol = new VariableSymbol(name, type, kind);
		ast.sym = variableSymbol;
		return variableSymbol;
	}


	//TODO: builtInWrite ist falsch.... was ist mit einer expr??? was ist mit write() vs writeln()
	// Statements:
	@Override
	public Symbol builtInWrite(BuiltInWrite ast, Symbol arg) { //ok
		TypeSymbol typeSymbol = (TypeSymbol) visit(ast.arg(), (MethodSymbol)arg);
		//TODO: kann das jemals null sein??? expr hat immer typ... sonst Fehler an anderem Ort
		if (typeSymbol == null)
			throw new SemanticFailure(Cause.NO_SUCH_VARIABLE);
		if (typeSymbol.name != PrimitiveTypeSymbol.intType.name)
			throw new SemanticFailure(Cause.TYPE_ERROR);

		return null;
	}



	/**
	 * 
	 * @param typeLeft sollte superType sein..
	 * @param typeRight sollte subType sein..
	 * @return returns true if it is a subtype
	 */
	public boolean checkSubtype(TypeSymbol typeLeft, TypeSymbol typeRight){
		boolean isSubtype = false;

		//simple check iff types exists
		if (typeLeft==null||typeRight==null)
			return false;

		String tLeftClass = typeLeft.getClass().getSimpleName();
		String tRightClass = typeRight.getClass().getSimpleName();
		
		//prüfe ob ref typ
		//special case for null
		if(typeLeft.isReferenceType() && typeRight.equals(sa.globalClassTable.get(ClassSymbol.nullType.name)))
			return true;

		//TODO: ist das korrekt??? Für special case for null funktioniert das z.B. nicht
		if (!tLeftClass.equals(tRightClass))
			return false;
		
	
		switch(tLeftClass){
		case("ArrayTypeSymbol"): {
			typeLeft = ((ArrayTypeSymbol) typeLeft).elementType;
			typeRight = ((ArrayTypeSymbol) typeRight).elementType;
			if (typeLeft.getClass().getSimpleName().equals("PrimitiveTypeSymbol")){
				if (typeLeft.name.equals(typeRight.name)){
					isSubtype = true;
				}
			} else {
				/* so wie ich das verstehe, ist das in Javali nie erlaubt, würde aber in dieser Implemenation funktionieren
				 * isSubtype = sa.isSubtype((ClassSymbol)typeLeft,(ClassSymbol)typeRight);
				 */
				if (typeLeft.name.equals(typeRight.name)){
					isSubtype = true;
				}
			}
			break;
		}
		//TODO: int, boolean, void
		case("PrimitiveTypeSymbol"): {
			if (typeLeft.name.equals(typeRight.name)){
				isSubtype = true;
			}
			break;
		}
		case("ClassSymbol"):{
			//System.out.println("already a ClassSymbol (subtyping)");
			isSubtype = sa.isSubtype((ClassSymbol)typeLeft,(ClassSymbol)typeRight);
			break;
		}
		default: {
			System.out.println("!!!!!!!!!!!!!!!!!: Missing-Case (subtyping) for "+typeLeft.getClass().getSimpleName());
			break;	
		}
		}
		return isSubtype;
	}

	//TODO: SUBTYPING!!!!!!!
	@Override
	public Symbol assign(Assign ast, Symbol arg) {
		/* TODO: Check: left-hand side must be assignable, can be:
		 * (varx), field.x, array[index]
		 * class A {
				void test(B a){
					a = new B();
				}
			} //referenz Impl lässt das zu... sollte doch NOT_ASSIGNABLE werfen..???
		 */

		//TODO []=[], asdsad=ob(), =int[]... infos gehen verloren bei typeLeft/Right
		/*
		 * Check: NOT_ASSIGNABLE
		 * ok: Var, Index, Field
		 */
		String lType = ast.left().getClass().getSimpleName();
		if ( !lType.equals("Var") && !lType.equals("Index") && !lType.equals("Field"))
			throw new SemanticFailure(Cause.NOT_ASSIGNABLE);
		
		TypeSymbol typeLeft = (TypeSymbol) visit(ast.left(),arg);
		TypeSymbol typeRight = (TypeSymbol) visit(ast.right(),arg);
		
		boolean isSubtype = false;
		isSubtype = checkSubtype(typeLeft, typeRight);

		if (!isSubtype)
			throw new SemanticFailure(Cause.TYPE_ERROR);



		return null;
		//return super.assign(ast, arg);
	}


	// Expression:

	/* TODO löschen
	@Override
	public Symbol ifElse(IfElse ast, Symbol arg) {
		TypeSymbol tExpr = (TypeSymbol) visit(ast.condition(),arg);
		if (!tExpr.name.equals(PrimitiveTypeSymbol.booleanType.name)){
			throw new SemanticFailure(Cause.TYPE_ERROR);
		}
		return super.ifElse(ast, arg);
	}*/

	//TODO Type check....
	@Override
	public Symbol returnStmt(ReturnStmt ast, Symbol arg) {

		//OK?? Iff null => no return arg => error OR void
		if (ast.arg()==null){
			if ( ((MethodSymbol) arg).returnType.name.equals(PrimitiveTypeSymbol.voidType.name)){
				return null;				
			}
			throw new SemanticFailure(Cause.TYPE_ERROR);
		}

		TypeSymbol typeRExpr = (TypeSymbol) visit(ast.arg(),arg);
		//habe diese Zeile angepasst....stimmt das mit dem subtype??
		if (!typeRExpr.name.equals(((MethodSymbol) arg).returnType.name) && !checkSubtype(((MethodSymbol) arg).returnType,typeRExpr))
		//if (!typeRExpr.name.equals(((MethodSymbol) arg).returnType.name))
			throw new SemanticFailure(Cause.TYPE_ERROR);

		//return super.returnStmt(ast, arg); 31;23
		return null;
	}




	@Override
	public Symbol ifElse(IfElse ast, Symbol arg) {
		TypeSymbol conditionType = (TypeSymbol) visit(ast.condition(),arg);
		//Check: condition expr must be of type boolean
		if (!conditionType.name.equals(Symbol.PrimitiveTypeSymbol.booleanType.name))
			throw new SemanticFailure(Cause.TYPE_ERROR);	
		return super.ifElse(ast, arg);
	}
	
	@Override
	public Symbol whileLoop(WhileLoop ast, Symbol arg) {
		// TODO Auto-generated method stub
		return super.whileLoop(ast, arg);
	}

	@Override
	public Symbol visit(Expr ast, Symbol arg) {

		return super.visit(ast, arg);
	}

	@Override
	public Symbol visitChildren(Expr ast, Symbol arg) {
		// TODO Auto-generated method stub
		return super.visitChildren(ast, arg);
	}


	/*TODO: Fehler.... int <= int ..... => boolean	 * (non-Javadoc)
	 * ||,&& mit integern??? != etc... int/bool?
	 */


	@Override
	public TypeSymbol binaryOp(BinaryOp ast, Symbol arg) { //ok?

		TypeSymbol leftType = (TypeSymbol) visit(ast.left(), arg);
		TypeSymbol rightType = (TypeSymbol) visit(ast.right(), arg);
		BOp op = ast.operator;
		
		/* binary arithmetic ops with integer arguments and return type integer
		 * *, /, %, +, -
		 */
		if ((op==BOp.B_TIMES)||(op==BOp.B_DIV)||(op==BOp.B_MOD)||(op==BOp.B_PLUS)||(op==BOp.B_MINUS)){
			if ((leftType.name == PrimitiveTypeSymbol.intType.name) 
					&& (rightType.name == PrimitiveTypeSymbol.intType.name)){
				ast.type = PrimitiveTypeSymbol.intType;
				return PrimitiveTypeSymbol.intType;
			} else {
				throw new SemanticFailure(Cause.TYPE_ERROR);
			}
		}

		/* binary ops with integer arguments and return type boolean
		 * ==, !=, <, <=, >, >=
		 */
		if ((op==BOp.B_EQUAL)||(op==BOp.B_NOT_EQUAL)||(op==BOp.B_LESS_THAN)
				||(op==BOp.B_LESS_OR_EQUAL)||(op==BOp.B_GREATER_THAN)||(op==BOp.B_GREATER_OR_EQUAL)){
			if ((leftType.name == PrimitiveTypeSymbol.intType.name) 
					&& (rightType.name == PrimitiveTypeSymbol.intType.name)){
				ast.type = PrimitiveTypeSymbol.booleanType;
				return PrimitiveTypeSymbol.booleanType;
			} else {
				throw new SemanticFailure(Cause.TYPE_ERROR);
			}
		}

		/* binary ops with boolean arguments and return type boolean
		 * &&, ||, ==, !=
		 */
		if ((op==BOp.B_AND)||(op==BOp.B_OR)||(op==BOp.B_EQUAL)||(op==BOp.B_NOT_EQUAL)){
			if ((leftType.name == PrimitiveTypeSymbol.booleanType.name) 
					&& (rightType.name == PrimitiveTypeSymbol.booleanType.name)){
				ast.type = PrimitiveTypeSymbol.booleanType;
				return PrimitiveTypeSymbol.booleanType;
			} else {
				throw new SemanticFailure(Cause.TYPE_ERROR);
			}
		}

		return null;
	}
	@Override
	public TypeSymbol unaryOp(UnaryOp ast, Symbol arg) { //ok?
		TypeSymbol expr = (TypeSymbol) visit(ast.arg(), arg);
		UOp op = ast.operator;

		// unary arithmetic ops with integers
		if ((op==UOp.U_MINUS)||(op==UOp.U_PLUS)){
			if (expr.name == PrimitiveTypeSymbol.intType.name){
				ast.type = PrimitiveTypeSymbol.intType;
				return PrimitiveTypeSymbol.intType;
			} else {
				throw new SemanticFailure(Cause.TYPE_ERROR);
			}
		}

		// unary ops with boolean
		if (op==UOp.U_BOOL_NOT){
			if (expr.name == PrimitiveTypeSymbol.booleanType.name){
				ast.type = PrimitiveTypeSymbol.booleanType;
				return PrimitiveTypeSymbol.booleanType;
			} else {
				throw new SemanticFailure(Cause.TYPE_ERROR);
			}
		}

		return null;
	}

	@Override
	public Symbol booleanConst(BooleanConst ast, Symbol arg) { //ok
		ast.type = PrimitiveTypeSymbol.booleanType;
		return PrimitiveTypeSymbol.booleanType;
	}

	//TODO arg check??? bzw no arg check???
	@Override
	public TypeSymbol builtInRead(BuiltInRead ast, Symbol arg) {
		return PrimitiveTypeSymbol.intType;
	}

	@Override
	public Symbol cast(Cast ast, Symbol arg) {
		TypeSymbol cType = checkType(ast.typeName);
		//Check Null nicht nötig, da checkType das bereits tut
		ast.type = cType;

		TypeSymbol typeRight = (TypeSymbol) visit(ast.arg(),arg);

		boolean isSubtype = false;
		/*
		 * two possible cases for casting: (a) b
		 * 1. b subtype of a
		 * 2. a subtype of b
		 */
		//1. b subtype of a
		isSubtype = checkSubtype(cType, typeRight);
		//2. a subtype of b
		isSubtype = isSubtype || checkSubtype(typeRight, cType);

		if (!isSubtype)
			throw new SemanticFailure(Cause.TYPE_ERROR);

		return cType;	
		//return super.cast(ast, arg);
	}

	@Override
	public TypeSymbol field(Field ast, Symbol arg) {
		// this.a -> fieldname = a, arg -> this
		//TODO:
		/*
		 * 
		if (ast.arg() == "this"){
			getField(ast.fieldName, arg);
		}
		getField()*/
		Symbol lastValue = null;
		/*for (Ast child : ast.children()){
			lastValue = visit(child, arg);
		}*/
		lastValue = visit(ast.arg(),arg);

		String fName = ast.fieldName;

		TypeSymbol asd = ast.arg().type;

		VariableSymbol varSym = null;

		if (lastValue.name == "this"){
			varSym = getField(fName, ((MethodSymbol)arg).inClass);
		} else {
			varSym = getField(fName, (ClassSymbol) lastValue);
		}

		if (varSym==null){
			throw new SemanticFailure(Cause.NO_SUCH_FIELD);
		}



		return varSym.type;

		//return super.field(ast, arg);
	}

	//TODO check length???
	@Override
	public Symbol index(Index ast, Symbol arg) {
		TypeSymbol lT = (TypeSymbol) visit(ast.left(),arg);
		TypeSymbol rT = (TypeSymbol) visit(ast.right(),arg);

		//Check: indexing expr must be of type int
		if (!rT.name.equals(Symbol.PrimitiveTypeSymbol.intType.name))
			throw new SemanticFailure(Cause.TYPE_ERROR);

		return ((ArrayTypeSymbol)lT).elementType;
		//return super.index(ast, arg);
	}

	@Override
	public Symbol intConst(IntConst ast, Symbol arg) { //ok
		ast.type = PrimitiveTypeSymbol.intType;
		return PrimitiveTypeSymbol.intType;
	}

	//TODO brauchts diese method wirklich...????
	/*
	@Override
	public Symbol methodCall(MethodCall ast, Symbol arg) {


		return super.methodCall(ast, arg);
	}*/

	@Override
	public TypeSymbol methodCall(MethodCallExpr ast, Symbol arg) {

		String mName = ast.methodName;
		Symbol lastValue = null;

		//TODO null check...
		//kann das jemals null sein????
		/*was macht das genau...???
		 * class in der methode aufgerufen wird????
		 * was ist wenn this zurück gegeben wird????
		 * */
		lastValue = visit(ast.receiver(),arg);

		if (lastValue.name.equals("this")){
			//System.out.println("###################333search local class...");
			lastValue = ((MethodSymbol) arg).inClass;
		}
		//TODO check if lastValue is of class type
		//	PrimitiveTypeSymbol, ArrayTypeSymbol,
		String lvType = lastValue.getClass().getSimpleName();
		//666666666666666666666666666
		//if (lvType.equals("PrimitiveTypeSymbol")){
		if (!lvType.equals("ClassSymbol")){
			//System.out.println(lastValue.getClass().getSimpleName());
			throw new SemanticFailure(Cause.TYPE_ERROR);
		}

		//bekommt TypeSymbol von field
		TypeSymbol mReturnType = null;

		//TODO check null...
		MethodSymbol mSym = getMethod(mName, (ClassSymbol) lastValue);
		if (mSym==null)
			throw new SemanticFailure(Cause.NO_SUCH_METHOD);


		if (ast.argumentsWithoutReceiver().size()!=mSym.parameters.size())
			throw new SemanticFailure(Cause.WRONG_NUMBER_OF_ARGUMENTS);

		int i = 0;
		for (Expr expr: ast.argumentsWithoutReceiver()){
			//System.out.println("Method "+mName+" args: " +expr.toString());
			TypeSymbol tArg = (TypeSymbol) visit(expr,arg);
			TypeSymbol tParam = mSym.parameters.get(i).type;
			//TODO: muss hier auf implizite casts geprüft werden?
			//darf parameter auch subtype sein??? mich verwirrt es, weil beim expliziten casten beides geht
			if (!tArg.name.equals(tParam.name) && 
					!(tArg.name.equals(ClassSymbol.nullType.name)&&mSym.parameters.get(0).type.isReferenceType())
					&& !checkSubtype(tParam, tArg)){
				throw new SemanticFailure(Cause.TYPE_ERROR);
			}
			//System.out.println("Method "+mName+" args: " +expr.toString()+ " tArg="+tArg.name + " and param="+tParam);

			i++;
		}

		mReturnType = mSym.returnType;


		return mReturnType;
	}

	//TODO Subtype checking... ev bei assign
	@Override
	public Symbol newObject(NewObject ast, Symbol arg) {	
		TypeSymbol typeNewObject = checkType(ast.typeName);
		if (typeNewObject==null)
			throw new SemanticFailure(Cause.NO_SUCH_TYPE);
		return typeNewObject;

		//		return super.newObject(ast, arg);

		/*
		 * f (ast.arg()==null)
			throw new SemanticFailure(Cause.TYPE_ERROR);

		TypeSymbol typeRExpr = (TypeSymbol) visit(ast.arg(),arg);
		if (!typeRExpr.name.equals(((MethodSymbol) arg).returnType.name))
			throw new SemanticFailure(Cause.TYPE_ERROR);

		//return super.returnStmt(ast, arg); 31;23
		return null;
		 */
	}

	@Override
	public Symbol newArray(NewArray ast, Symbol arg) {

		//Check iff type exists
		ArrayTypeSymbol typeNewArray = (ArrayTypeSymbol) checkType(ast.typeName);
		if (typeNewArray==null)
			throw new SemanticFailure(Cause.NO_SUCH_TYPE);


		TypeSymbol length = (TypeSymbol) visit(ast.arg(),arg);
		//check: the type of length must be int
		if (!length.name.equals(PrimitiveTypeSymbol.intType.name))
			throw new SemanticFailure(Cause.TYPE_ERROR);


		//??return type without [] (for further type checking in assign
		//TypeSymbol elementType = typeNewArray.elementType;
		//return elementType;
		return typeNewArray;
	}

	@Override
	public ClassSymbol nullConst(NullConst ast, Symbol arg) {
		//return super.nullConst(ast, arg);
		return ClassSymbol.nullType;
	}

	@Override
	public Symbol thisRef(ThisRef ast, Symbol arg) {
		
		///666
		TypeSymbol tRef = ((MethodSymbol)arg).inClass;

		//TypeSymbol tRef = ((MethodSymbol)arg).inClass.thisSymbol;

		return tRef;
	}

	//TODO: check if ok now...
	@Override
	public TypeSymbol var(Var ast, Symbol arg) { //ok?
		VariableSymbol varSym = getVariable(ast.name, (MethodSymbol)arg);
		if (varSym == null)
			throw new SemanticFailure(Cause.NO_SUCH_VARIABLE);
		else {
			ast.sym = varSym;
			ast.type = varSym.type;
			return varSym.type;
		}
	}

	/*
	 * TODO: needed because of: Symbol ::public final List<VariableSymbol> parameters ...;
	 */
	Map<String, VariableSymbol> getParametersMap(MethodSymbol mSym){
		Map<String, VariableSymbol> parameters = new HashMap<String, VariableSymbol>();
		for (VariableSymbol var: mSym.parameters){
			parameters.put(var.name, var);
		}
		return parameters;		
	}



	/*
	 * searches for method in the possible scope
	 * returns MethodSymbol if found, 'null' if not found
	 */
	MethodSymbol getMethod(String mName, ClassSymbol classSym){
		
		if (classSym.name.equals(ClassSymbol.objectType.name))
			return null;
					
		MethodSymbol mSym = null;

		//search class fields
		mSym = classSym.methods.get(mName);
		if (mSym != null)
			return mSym;

		// recursive search fields in superClass
		ClassSymbol superC = classSym.superClass;
		while (superC.name != ClassSymbol.objectType.name){
			mSym = superC.methods.get(mName);
			if (mSym != null)
				return mSym;
			superC = superC.superClass;
		}
		return mSym;
	}

	/*
	 * searches for variable in the possible scope
	 * returns VariableSymbol if found, 'null' if not found
	 */
	VariableSymbol getVariable(String varName, MethodSymbol methodSym){ //ok
		VariableSymbol varSym = null;

		// search local vars
		varSym = methodSym.locals.get(varName);
		if (varSym != null){
			return varSym;
		}
		// search method parameters
		varSym = getParametersMap(methodSym).get(varName);
		if (varSym != null){
			return varSym;
		}

		//search fields
		varSym = getField(varName, methodSym.inClass);

		return varSym;
	}

	/*
	 * searches for field in the possible scope
	 * returns VariableSymbol if found, 'null' if not found
	 */
	VariableSymbol getField(String fieldName, ClassSymbol classSym){
		VariableSymbol varSym = null;

		//search class fields
		varSym = classSym.fields.get(fieldName);
		if (varSym != null)
			return varSym;

		// recursive search fields in superClass
		ClassSymbol superC = classSym.superClass;
		while (superC.name != ClassSymbol.objectType.name){
			varSym = superC.fields.get(fieldName);
			if (varSym != null)
				return varSym;
			superC = superC.superClass;
		}
		return varSym;
	}

	//TODO anpassen.... funktioniert so nicht... ERROR
	/* wrong...
	 * checks if 'typeName' is a valid type
	 * returns the corresponding TypeSymbol, 'null' if type undefined
	 * throws SemanticFailure => no null return values!!!!!!
	 */
	TypeSymbol checkType(String typeName){ //ok
		// Type of the variable: Primitive- , Array- or Classtype
		TypeSymbol type = null;
		if (typeName.endsWith("[]")){
			String arrayType = typeName.split("\\[\\]")[0];
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

	/**
	 * 
	 * @return true IFF there is a missing return statement
	 */
	boolean missingReturnStatement(Ast ast, MethodSymbol arg){
		boolean check = true;
		/* alle möglichen Stmt testen....
		 * testen bis false (return gefunden) oder letztes statement
		 * Regeln: (true==missingReturnStatement)
		 * assign = true
		 * MethodCallStmt = true
		 * ifStmt, While => rekursiv???
		 * returnStmt = false
		 * writeStmt = true
		 */

		//TODO: empty Body????

		for (Ast child: ast.rwChildren){
			//System.out.println(child.getClass().getSimpleName() + ": "+child.toString());
			switch (child.getClass().getSimpleName()){
			case("Assign"): {
				check = true;
				break;
			}
			case("MethodCall"): {
				check = true;
				break;
			}
			case("IfElse"): {
				/*
				 * Regel:
				 * if (tautology) => false (wird in der Referenzimplementation nicht geprüft (int meth(){if(true){return 1;} else{write(2)}}
				 * if und else block und jeweils return statement => false
				 * sonst true == missing return statement
				 * while(true){return true;} wird nicht geprüft in refertenz impl
				 */
				// .size()==0 <=> "if and else block"
				if (child.childrenOfType(Ast.Nop.class).size()==0){
					boolean thenCheck = missingReturnStatement(((Ast.IfElse) child).then(), arg);
					boolean elseCheck = missingReturnStatement(((Ast.IfElse) child).otherwise(), arg);
					check = thenCheck || elseCheck;
				} else {
					check = true;
				}
				break;
			}
			case("WhileLoop"): {
				//while(true){return true;} wird nicht geprüft in refertenz impl => immer missing...!!!
				check = true;
				break;
			}
			case("ReturnStmt"): {
				check = false;
				break;
			}
			case("BuiltInWrite"): {
				check = true;
				break;
			}
			default:
				System.out.println("ERROR: missing case");
				check = true;
			}
			//return found (the rest of the code is not reachable=> ignore it)
			if(!check){
				return check;
			}
		}


		return check;
	}

}
