package cd.backend.codegen;

import static cd.backend.codegen.AssemblyEmitter.constant;
import static cd.backend.codegen.RegisterManager.STACK_REG;

import java.util.List;


import cd.Config;
import cd.ToDoException;
import cd.backend.codegen.RegisterManager.Register;
import cd.ir.Ast;
import cd.ir.Ast.Assign;
import cd.ir.Ast.BuiltInWrite;
import cd.ir.Ast.BuiltInWriteln;
import cd.ir.Ast.ClassDecl;
import cd.ir.Ast.Expr;
import cd.ir.Ast.Field;
import cd.ir.Ast.IfElse;
import cd.ir.Ast.Index;
import cd.ir.Ast.MethodCall;
import cd.ir.Ast.MethodDecl;
import cd.ir.Ast.ReturnStmt;
import cd.ir.Ast.Stmt;
import cd.ir.Ast.Var;
import cd.ir.Ast.WhileLoop;
import cd.ir.AstVisitor;
import cd.ir.Symbol.MethodSymbol;
import cd.util.debug.AstOneLine;


/**
 * Generates code to process statements and declarations.
 */
class StmtGenerator extends AstVisitor<Register, StackFrame> {
	protected final AstCodeGenerator cg;
	public VTable currentClass;

	StmtGenerator(AstCodeGenerator astCodeGenerator) {
		cg = astCodeGenerator;
	}
	public void gen(Ast ast) {
		visit(ast, null);
	}
	@Override
	public Register visit(Ast ast, StackFrame frame) {
		try {
			cg.emit.increaseIndent("Emitting " + AstOneLine.toString(ast));
			return super.visit(ast, frame);
		} finally {
			cg.emit.decreaseIndent();
		}
	}

	@Override
	public Register methodCall(MethodCall ast, StackFrame frame) {
		{
			Register reg = cg.eg.methodCall(ast.getMethodCallExpr(), frame);
			frame.releaseRegister(reg);
			return null;
		}
	}

	public Register methodCall(MethodSymbol sym, List<Expr> allArguments) {
		throw new RuntimeException("Not required");
	}

	// Emit vtable for arrays of this class:
	@Override
	public Register classDecl(ClassDecl ast, StackFrame frame) {
		{
			currentClass = cg.vtableManager.get(ast.name);
			return visitChildren(ast, frame);
		}
	}

	@Override
	public Register methodDecl(MethodDecl ast, StackFrame f) {
		{
			VTable table = cg.vtableManager.get(currentClass.classDecl.name);
			String label = table.getLabel(ast.name).toString();

			cg.emit.emitLabel(label);

			// Frame manager: set up the frame
			StackFrame frame = new StackFrame(cg, ast);

			frame.setUpFrame();

			if (!ast.body().children().isEmpty()){
				visit(ast.body(), frame);
			}

			frame.tearDownFrame();

			return null;
		}
	}

	@Override
	public Register ifElse(IfElse ast, StackFrame frame) {

		jumpHelper(ast, frame, "IfElse");

		/*
		cg.emit.emitCommentSection("ifElse");
		Register conditionValue = cg.eg.visit(ast.condition(),frame);


		String lableElse = cg.eg.getNewLabel();
		String lableEnd = cg.eg.getNewLabel();

		System.out.println("lableElse="+lableElse +" lableEnd="+lableEnd);

		Expr cond = ast.condition();
		switch (cond.getClass().getSimpleName()){
		 */

		/*
		 * <, <=, >, >=
		 */

		/*
		case "BinaryOp": {
			System.out.println("ifElse BinaryOp");
			switch(((Ast.BinaryOp) cond).operator){
			case B_LESS_THAN:{ //if (a<c){} //jge else
				//jX .lableElse
				cg.emit.emit("jge", lableElse);
				break;
			}
			case B_LESS_OR_EQUAL:{ //if (a<=c){ //jg else
				//jX .lableElse
				cg.emit.emit("jg", lableElse);
				break;
			}
			case B_GREATER_THAN:{ //if (a>c){ //jle else
				//jX .lableElse
				cg.emit.emit("jle", lableElse);
				break;
			}
			case B_GREATER_OR_EQUAL:{ //if (a>=c){ //jl else
				//jX .lableElse
				cg.emit.emit("jl", lableElse);
				break;
			}
			case B_AND:{ //if (a&&c){ //je else
				//jX .lableElse
				cg.emit.emit("je", lableElse);
				break;
			}
			case B_OR:{ //if (a||c){ //je else
				//jX .lableElse
				cg.emit.emit("je", lableElse);
				break;
			}
			default: {
				System.out.println("ifElse(case BinaryOp:) implement: "+((Ast.BinaryOp) cond).operator.repr);
				throw new ToDoException();				
			}
			}

			break;
		}

		case "Var": {
			cg.emit.emit("cmpl",  "$0", conditionValue);
			cg.emit.emit("je", lableElse);
			break;
		}

		//TODO
		case "UnaryOp": {
			cg.emit.emit("je", lableElse);
			break;
		}
		default: {
			System.out.println("public Register ifElse(..) implement: "+ast.condition().getClass().getSimpleName());
			throw new ToDoException();		
		}


		}


		cg.rm.releaseRegister(conditionValue);



		//visit then body
		visit(ast.then(), frame);
		cg.emit.emit("jmp", lableEnd); 


		cg.emit.emitLabel(lableElse);
		//visit else body
		visit(ast.otherwise(), frame);

		cg.emit.emitLabel(lableEnd);

		 */

		return null;
	}

	//TODO: Kopie von ifElse...
	@Override
	public Register whileLoop(WhileLoop ast, StackFrame frame) {

		jumpHelper(ast, frame, "WhileLoop");

		/*	
		cg.emit.emitCommentSection("whileLoop");
		Register conditionValue = cg.eg.visit(ast.condition(),frame);


		String lableElse = cg.eg.getNewLabel();
		String lableEnd = cg.eg.getNewLabel();

		System.out.println("lableElse="+lableElse +" lableEnd="+lableEnd);

		Expr cond = ast.condition();
		switch (cond.getClass().getSimpleName()){
		 */
		///*
		//* <, <=, >, >=
		//*/
		/*
		case "BinaryOp": {
			System.out.println("ifElse BinaryOp");
			switch(((Ast.BinaryOp) cond).operator){
			case B_LESS_THAN:{ //if (a<c){} //jge else
				//jX .lableElse
				cg.emit.emit("jge", lableElse);
				break;
			}
			case B_LESS_OR_EQUAL:{ //if (a<=c){ //jg else
				//jX .lableElse
				cg.emit.emit("jg", lableElse);
				break;
			}
			case B_GREATER_THAN:{ //if (a>c){ //jle else
				//jX .lableElse
				cg.emit.emit("jle", lableElse);
				break;
			}
			case B_GREATER_OR_EQUAL:{ //if (a>=c){ //jl else
				//jX .lableElse
				cg.emit.emit("jl", lableElse);
				break;
			}
			case B_AND:{ //if (a&&c){ //je else
				//jX .lableElse
				cg.emit.emit("je", lableElse);
				break;
			}
			case B_OR:{ //if (a||c){ //je else
				//jX .lableElse
				cg.emit.emit("je", lableElse);
				break;
			}
			default: {
				System.out.println("whileLoop(case BinaryOp:) implement: "+((Ast.BinaryOp) cond).operator.repr);
				throw new ToDoException();				
			}
			}

			break;
		}

		case "Var": {
			cg.emit.emit("cmpl",  "$0", conditionValue);
			cg.emit.emit("je", lableElse);
			break;
		}
		case "UnaryOp": {
			cg.emit.emit("je", lableElse);
			break;
		}
		default: {
			System.out.println("public Register whileLoop(..) implement: "+ast.condition().getClass().getSimpleName());
			throw new ToDoException();		
		}


		}


		cg.rm.releaseRegister(conditionValue);


		//visit then body
		visit(ast.body(), frame);
		cg.emit.emit("jmp", lableEnd); 


		cg.emit.emitLabel(lableElse);
		//visit else body: empty

		cg.emit.emitLabel(lableEnd);

		 */

		return null;
	}

	//public Register whileLoop(WhileLoop ast, StackFrame frame) {
	private void jumpHelper(Stmt astTemp, StackFrame frame, String condType) {
		Register conditionValue;
		Expr cond;
		if (condType.equals("WhileLoop")){
			cg.emit.emitCommentSection("whileLoop");
			conditionValue = cg.eg.visit(((WhileLoop) astTemp).condition(),frame);
			cond = ((WhileLoop) astTemp).condition();			
		} else {
			cg.emit.emitCommentSection("ifElse");
			conditionValue = cg.eg.visit(((IfElse) astTemp).condition(),frame);
			cond = ((IfElse) astTemp).condition();
		}


		String lableElse = cg.eg.getNewLabel();
		String lableEnd = cg.eg.getNewLabel();

		switch (cond.getClass().getSimpleName()){

		/*
		 * <, <=, >, >=
		 */
		case "BinaryOp": {
			//System.out.println("ifElse BinaryOp");
			switch(((Ast.BinaryOp) cond).operator){
			case B_LESS_THAN:{ //if (a<c){} //jge else
				//jX .lableElse
				cg.emit.emit("jge", lableElse);
				break;
			}
			case B_LESS_OR_EQUAL:{ //if (a<=c){ //jg else
				//jX .lableElse
				cg.emit.emit("jg", lableElse);
				break;
			}
			case B_GREATER_THAN:{ //if (a>c){ //jle else
				//jX .lableElse
				cg.emit.emit("jle", lableElse);
				break;
			}
			case B_GREATER_OR_EQUAL:{ //if (a>=c){ //jl else
				//jX .lableElse
				cg.emit.emit("jl", lableElse);
				break;
			}
			case B_AND:{ //if (a&&c){ //je else
				//jX .lableElse
				cg.emit.emit("je", lableElse);
				break;
			}
			case B_OR:{ //if (a||c){ //je else
				//jX .lableElse
				cg.emit.emit("je", lableElse);
				break;
			}
			default: {
				System.out.println("whileLoop(case BinaryOp:) implement: "+((Ast.BinaryOp) cond).operator.repr);
				throw new ToDoException();				
			}
			}

			break;
		}

		case "Var": {
			cg.emit.emit("cmpl",  "$0", conditionValue);
			cg.emit.emit("je", lableElse);
			break;
		}
		case "UnaryOp": {
			cg.emit.emit("je", lableElse);
			break;
		}
		default: {
			System.out.println("public Register jumpHelper(..) implement: ????????");
			throw new ToDoException();		
		}


		}
		cg.rm.releaseRegister(conditionValue);


		if (condType.equals("WhileLoop")){
			//visit then body
			visit(((WhileLoop) astTemp).body(), frame);
			cg.emit.emit("jmp", lableEnd); 

			cg.emit.emitLabel(lableElse);
			//visit else body: empty

			cg.emit.emitLabel(lableEnd);
		} else {
			//visit then body
			visit(((IfElse) astTemp).then(), frame);

			cg.emit.emit("jmp", lableEnd); 


			cg.emit.emitLabel(lableElse);
			//visit else body
			visit(((IfElse) astTemp).otherwise(), frame);

			cg.emit.emitLabel(lableEnd);
		}
	}

	@Override
	public Register assign(Assign ast, StackFrame frame) {

		cg.emit.emitCommentSection("assign");

		Register rightReg = cg.eg.visit(ast.right(), frame);

		if (ast.left() instanceof Var){ // assign to a variable
			Var var = (Var) ast.left();
			frame.assignToVar(var, rightReg);
		} else if (ast.left() instanceof Index){ // assign to an array element
			Index ind = (Index) ast.left();
			Register varReg = cg.eg.visit(ind.left(), frame);
			Register indexReg = cg.eg.visit(ind.right(), frame);

			Var var = (Var)ind.left();
			String typeName = var.type.name.replace("[", "").replace("]", "");	
			VTable table = cg.vtableManager.get(typeName + "_array");

			ObjectShape objectShape;
			if (table.classDecl == null){
				objectShape = cg.objShapeManager.get("Object");
			} else {
				objectShape = cg.objShapeManager.get(table.classDecl.name);
			}
			if (objectShape == null){
				return null;
			}

			// calculate offset of element in array
			//cg.emit.emit("imul", "$"+Integer.toString(objectShape.sizeInN()), indexReg);
			cg.emit.emit("imul", "$4", indexReg);
			cg.emit.emit("addl", "$8", indexReg);
			cg.emit.emit("addl", indexReg, varReg);				

			cg.emit.emit("movl", rightReg, "("+varReg+")");
			frame.releaseRegister(indexReg);
			frame.releaseRegister(varReg);
		} else if (ast.left() instanceof Field){ // assign to field, e.g. a.x
			Field left = (Field) ast.left(); 

			Register targetReg = cg.eg.visit(left.arg(), frame);

			VTable table = cg.vtableManager.get(left.arg().type.name);
			ObjectShape objectShape = cg.objShapeManager.get(table.classDecl.name);

			int offset = objectShape.getOffset(left.fieldName);

			cg.emit.emit("movl", rightReg, frame.getAddr(targetReg.getRepr(), offset));

			frame.releaseRegister(targetReg);
		} else {
			throw new ToDoException(); 
		}

		cg.rm.releaseRegister(rightReg);
		return null;

	}
	@Override
	public Register builtInWrite(BuiltInWrite ast, StackFrame frame) {
		{		
			Register reg = cg.eg.visit(ast.arg(), frame);

			cg.emit.emit("sub", constant(16), STACK_REG);
			cg.emit.emitStore(reg, 4, STACK_REG);
			cg.emit.emitStore("$STR_D", 0, STACK_REG);
			cg.emit.emit("call", Config.PRINTF);
			cg.emit.emit("add", constant(16), STACK_REG);

			frame.releaseRegister(reg);

			return null;
		}
	}
	@Override
	public Register builtInWriteln(BuiltInWriteln ast, StackFrame frame) {
		{
			cg.emit.emit("sub", constant(16), STACK_REG);
			cg.emit.emitStore("$STR_NL", 0, STACK_REG);
			cg.emit.emit("call", Config.PRINTF);
			cg.emit.emit("add", constant(16), STACK_REG);
			return null;
		}
	}
	@Override
	public Register returnStmt(ReturnStmt ast, StackFrame frame) {
		{
			if (ast.arg() == null){
				return null;
			}
			Register reg = cg.eg.visit(ast.arg(), frame);
			frame.setReturn(reg);
			frame.releaseRegister(reg);
			return null;
		}
	}

}
