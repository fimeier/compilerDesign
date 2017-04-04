package cd.frontend.semantic;

import java.util.HashMap;
import java.util.Map;

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
		for (MethodDecl md : ast.methods()){
			MethodSymbol methSym =  methodDecl(md, classSymbol);
			if (!classSymbol.fields.containsKey(methSym.name))
				classSymbol.methods.put(methSym.name, methSym);
			else
				throw new SemanticFailure(Cause.DOUBLE_DECLARATION);
		}
		ast.sym = classSymbol;
		return classSymbol;
	}
	@Override
	public MethodSymbol methodDecl(MethodDecl ast, Symbol inClass) { //ok
		MethodSymbol methodSymbol = new MethodSymbol(ast);
		
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
			
		}
		
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
		
		methodSymbol.returnType = checkType(ast.returnType);
		methodSymbol.inClass = (ClassSymbol)inClass;
		
		visit(ast.body(), methodSymbol);
		
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


	
	// Statements:
	@Override
	public Symbol builtInWrite(BuiltInWrite ast, Symbol arg) { //ok
		TypeSymbol typeSymbol = (TypeSymbol) visit(ast.arg(), (MethodSymbol)arg);
		if (typeSymbol == null)
			throw new SemanticFailure(Cause.NO_SUCH_VARIABLE);
		if (typeSymbol.name != PrimitiveTypeSymbol.intType.name)
			throw new SemanticFailure(Cause.TYPE_ERROR);

		return null;
	}
	@Override
	public Symbol assign(Assign ast, Symbol arg) {
		// TODO Auto-generated method stub
		return super.assign(ast, arg);
	}
	
	
	// Expression:

	@Override
	public Symbol ifElse(IfElse ast, Symbol arg) {
		// TODO Auto-generated method stub
		return super.ifElse(ast, arg);
	}

	@Override
	public Symbol returnStmt(ReturnStmt ast, Symbol arg) {
		// TODO Auto-generated method stub
		return super.returnStmt(ast, arg);
	}

	@Override
	public Symbol methodCall(MethodCall ast, Symbol arg) {
		
		
		return super.methodCall(ast, arg);
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

	@Override
	public TypeSymbol binaryOp(BinaryOp ast, Symbol arg) { //ok?
		
		TypeSymbol leftType = (TypeSymbol) visit(ast.left(), arg);
		TypeSymbol rightType = (TypeSymbol) visit(ast.right(), arg);
		BOp op = ast.operator;
		
		// binary arithmetic ops with integers
		if ((op==BOp.B_TIMES)||(op==BOp.B_DIV)||(op==BOp.B_MOD)||(op==BOp.B_PLUS)||(op==BOp.B_MINUS)){
			if ((leftType.name == PrimitiveTypeSymbol.intType.name) 
				&& (rightType.name == PrimitiveTypeSymbol.intType.name)){
				ast.type = PrimitiveTypeSymbol.intType;
				return PrimitiveTypeSymbol.intType;
			} else {
				throw new SemanticFailure(Cause.TYPE_ERROR);
			}
		}
		
		// binary ops with boolean
		if ((op==BOp.B_AND)||(op==BOp.B_OR)||(op==BOp.B_EQUAL)||(op==BOp.B_NOT_EQUAL)||(op==BOp.B_LESS_THAN)
				||(op==BOp.B_LESS_OR_EQUAL)||(op==BOp.B_GREATER_THAN)||(op==BOp.B_GREATER_OR_EQUAL)){
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

	@Override
	public Symbol builtInRead(BuiltInRead ast, Symbol arg) {
		// TODO Auto-generated method stub
		return super.builtInRead(ast, arg);
	}

	@Override
	public Symbol cast(Cast ast, Symbol arg) {
		// TODO Auto-generated method stub
		return super.cast(ast, arg);
	}

	@Override
	public Symbol field(Field ast, Symbol arg) {
		// this.a -> fieldname = a, arg -> this
		
		//TODO:
		/*
		if (ast.arg() == "this"){
			getField(ast.fieldName, arg);
		}
		getField()*/
		return super.field(ast, arg);
	}

	@Override
	public Symbol index(Index ast, Symbol arg) {
		// TODO Auto-generated method stub
		return super.index(ast, arg);
	}

	@Override
	public Symbol intConst(IntConst ast, Symbol arg) { //ok
		ast.type = PrimitiveTypeSymbol.intType;
		return PrimitiveTypeSymbol.intType;
	}

	@Override
	public Symbol methodCall(MethodCallExpr ast, Symbol arg) {
		// TODO Auto-generated method stub
		return super.methodCall(ast, arg);
	}

	@Override
	public Symbol newObject(NewObject ast, Symbol arg) {
		// TODO Auto-generated method stub
		return super.newObject(ast, arg);
	}

	@Override
	public Symbol newArray(NewArray ast, Symbol arg) {
		// TODO Auto-generated method stub
		return super.newArray(ast, arg);
	}

	@Override
	public Symbol nullConst(NullConst ast, Symbol arg) {
		// TODO Auto-generated method stub
		return super.nullConst(ast, arg);
	}

	@Override
	public Symbol thisRef(ThisRef ast, Symbol arg) {
		
		return null;
	}


	@Override
	public TypeSymbol var(Var ast, Symbol arg) { //ok?
		VariableSymbol varSym = getVariable(ast.name, (MethodSymbol)arg);
		if (varSym == null)
			return null;
		else {
			ast.sym = varSym;
			ast.type = varSym.type;
			return varSym.type;
		}
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
		for (VariableSymbol it : methodSym.parameters){
			if (it.name == varName){
				return it;
			}
		}
		
		varSym = getField(varName, methodSym);

		return varSym;
	}

	/*
	 * searches for field in the possible scope
	 * returns VariableSymbol if found, 'null' if not found
	 */
	VariableSymbol getField(String fieldName, MethodSymbol methodSym){
		VariableSymbol varSym = null;

		//search class fields
		varSym = methodSym.inClass.fields.get(fieldName);
		if (varSym != null)
			return varSym;
		
		// recursive search fields in superClass
		ClassSymbol superC = methodSym.inClass.superClass;
		while (superC.name != ClassSymbol.objectType.name){
			varSym = superC.fields.get(fieldName);
			if (varSym != null)
				return varSym;
			superC = superC.superClass;
		}
		return varSym;
	}
	
	/*
	 * checks if 'typeName' is a valid type
	 * returns the corresponding TypeSymbol, 'null' if type undefined
	 */
	TypeSymbol checkType(String typeName){ //ok
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
	
}
