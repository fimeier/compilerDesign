package cd.backend.codegen;

import static cd.backend.codegen.AssemblyEmitter.constant;
import static cd.backend.codegen.RegisterManager.STACK_REG;
import static cd.backend.codegen.RegisterManager.BASE_REG;


import java.util.ArrayList;
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
	/*
	@Override
	public Register visit(Ast ast, StackFrame frame) {
		try {
			cg.emit.increaseIndent("Emitting " + AstOneLine.toString(ast));
			return super.visit(ast, frame);
		} finally {
			cg.emit.decreaseIndent();
		}
	}
	 */

	@Override
	public Register visit(Ast ast, StackFrame frame) {
		try {
			cg.emit.increaseIndent("Emitting " + AstOneLine.toString(ast));


			//1. save registers
			//List<Register> dontBother = new ArrayList<>();
			Register[] affected = cg.rm.getUsedRegisters();
			if (affected==null){
				return super.visit(ast, frame);
			}
			int offsetSpillingReg = affected.length*4;
			
			//System.out.println("#REGS in Expr=" +affected.length);

			//space for spilling
			cg.emit.emit("pushl", "$0");

			cg.eg.saveRegSpilling(affected);

			Register retReg = super.visit(ast, frame);

			boolean affB = false;
			if (retReg!=null){
				//2. swap retReg??
				for (Register reg: affected){
					if (reg.getRepr().equals(retReg.getRepr())) {
						affB = true;
						//System.out.println("*******swap Needed");
						cg.emit.emitCommentSection("swap needed");

						//Register temp = cg.rm.getRegister();
						//cg.emit.emit("movl", retReg.getRepr(), temp.getRepr());

						cg.emit.emit("movl", retReg.getRepr(), frame.getAddr(STACK_REG.getRepr(), offsetSpillingReg));


						cg.rm.releaseRegister(retReg);
						//retReg = temp;					
					}
				}
			} else {
				cg.emit.emitCommentSection("NO swap needed");

				cg.eg.restoreRegSpilling(affected);
				cg.emit.emit("addl", "$4", STACK_REG.getRepr());

				return null;
			}
			//3. restore
			cg.eg.restoreRegSpilling(affected);

			if (affB){
				retReg = cg.rm.getRegister();
				cg.emit.emit("popl", retReg.getRepr());
			}else {
				cg.emit.emit("addl", "$4", STACK_REG.getRepr());
			}

			return retReg;
		} finally {
			cg.emit.decreaseIndent();
		}

	}

	@Override // reg ok
	public Register methodCall(MethodCall ast, StackFrame frame) {
		{
			//Register reg = cg.eg.methodCall(ast.getMethodCallExpr(), frame);
			Register reg = cg.eg.visit(ast.getMethodCallExpr(), frame);
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

	@Override // reg ok
	public Register methodDecl(MethodDecl ast, StackFrame f) {
		{
			VTable table = cg.vtableManager.get(currentClass.classDecl.name);
			String label = table.getLabel(ast.name).toString();

			cg.emit.emitLabel(label);

			// Frame manager: set up the frame
			StackFrame frame = new StackFrame(cg, ast);

			frame.setUpFrame();

			if (!ast.body().children().isEmpty()){
				Register reg = visit(ast.body(), frame);
				if (reg != null){
					frame.releaseRegister(reg);
				}
			}

			frame.tearDownFrame();

			return null;
		}
	}

	@Override
	public Register ifElse(IfElse ast, StackFrame frame) {

		jumpHelper(ast, frame, "IfElse");

		return null;
	}

	@Override // reg ok
	public Register whileLoop(WhileLoop ast, StackFrame frame) {

		jumpHelper(ast, frame, "WhileLoop");

		return null;
	}

	
	// for IfElse, WhileLoop,... // reg ok 
	private void jumpHelper(Stmt astTemp, StackFrame frame, String condType) {
		Register conditionValue;
		Expr cond;
		String lableWhile = cg.eg.getNewLabel();

		if (condType.equals("WhileLoop")){
			cg.emit.emitCommentSection("whileLoop");
			cg.emit.emitLabel(lableWhile);
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

			case B_EQUAL:{ 
				cg.emit.emit("jne", lableElse);
				break;
			}
			case B_NOT_EQUAL:{ 
				cg.emit.emit("je", lableElse);
				break;
			}

			default: {
				//System.out.println("JumpHelper(case BinaryOp:) implement: "+((Ast.BinaryOp) cond).operator.repr);
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
		case "BooleanConst": {
			cg.emit.emit("cmpl",  "$0", conditionValue);
			cg.emit.emit("je", lableElse);
			break;
		}

		default: {
			//System.out.println("public Register jumpHelper(..) implement: ????????");
			throw new ToDoException();		
		}


		}
		cg.rm.releaseRegister(conditionValue);


		if (condType.equals("WhileLoop")){
			//visit then body
			Register temp = visit(((WhileLoop) astTemp).body(), frame);
			cg.rm.releaseRegister(temp);
			//cg.emit.emit("jmp", lableEnd);  Fehler... muss an den Anfang springen
			cg.emit.emit("jmp", lableWhile); 


			cg.emit.emitLabel(lableElse);
			//visit else body: empty

			cg.emit.emitLabel(lableEnd);
		} else {
			//visit then body
			Register temp = visit(((IfElse) astTemp).then(), frame);
			cg.rm.releaseRegister(temp);


			cg.emit.emit("jmp", lableEnd); 


			cg.emit.emitLabel(lableElse);
			//visit else body
			temp = visit(((IfElse) astTemp).otherwise(), frame);
			cg.rm.releaseRegister(temp);


			cg.emit.emitLabel(lableEnd);
		}
	}
	
	// reg ok?
	@Override
	public Register assign(Assign ast, StackFrame frame) {

		cg.emit.emitCommentSection("assign");

		Register rightReg = cg.eg.visit(ast.right(), frame);
		

		if (ast.left() instanceof Var){ // assign to a variable
			Var var = (Var) ast.left();
			frame.assignToVar(var, rightReg); // release rightReg
		} else if (ast.left() instanceof Index){ // assign to an array element
			Index ind = (Index) ast.left();
			Register varReg = cg.eg.visit(ind.left(), frame);
			Register indexReg = cg.eg.visit(ind.right(), frame);
			cg.eg.nullPointerCheck(varReg);
			//cg.eg.nullPointerCheck(indexReg);
			// ERROR??CHECK
			// check (index >= 0)
			String elseIfLabel =  cg.eg.getNewLabel();
			//cg.emit.emit("movl", "("+indexReg+")", indexReg); // size < 0
			cg.emit.emit("cmpl", "$0", indexReg); // size < 0
			cg.emit.emit("jge",  elseIfLabel);   // if size >= 0 jump to elseLabel
			// throw error 3: negative array index
			cg.eg.throwError(3);

			// else jump here when (index > 0)
			cg.emit.emitLabel(elseIfLabel);
			String elseLabel =  cg.eg.getNewLabel();

			// check (index < array-size)
			cg.emit.emit("cmpl", frame.getAddr(varReg.getRepr(), 4), indexReg); // index < size
			cg.emit.emit("jl",  elseLabel);   // if index >= size jump to elseLabel
			// throw error 3: index out of bounds
			cg.eg.throwError(3);

			// jumpt here when index correct
			cg.emit.emitLabel(elseLabel);

			String typeName = ind.left().type.name;
			typeName = typeName.replace("[", "").replace("]", "");	
			VTable table = cg.vtableManager.get(typeName + "_array");

			ObjectShape objectShape;
			if (table.classDecl == null){
				objectShape = cg.objShapeManager.get("Object");
			} else {
				objectShape = cg.objShapeManager.get(table.classDecl.name);
			}
			if (objectShape == null){
				frame.releaseRegister(indexReg);
				frame.releaseRegister(varReg);
				if (rightReg != null){
					cg.rm.releaseRegister(rightReg);
				}
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
			cg.eg.nullPointerCheck(targetReg);

			VTable table = cg.vtableManager.get(left.arg().type.name);
			ObjectShape objectShape = cg.objShapeManager.get(table.classDecl.name);

			int offset = objectShape.getOffset(left.fieldName);

			cg.emit.emit("movl", rightReg, frame.getAddr(targetReg.getRepr(), offset));

			frame.releaseRegister(targetReg);
		} else {
			throw new ToDoException(); 
		}
		
		if (rightReg != null){
			cg.rm.releaseRegister(rightReg);
		}
		return null;

	}
	@Override // reg ok
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
	@Override // reg ok
	public Register builtInWriteln(BuiltInWriteln ast, StackFrame frame) {
		{
			cg.emit.emit("sub", constant(16), STACK_REG);
			cg.emit.emitStore("$STR_NL", 0, STACK_REG);
			cg.emit.emit("call", Config.PRINTF);
			cg.emit.emit("add", constant(16), STACK_REG);
			return null;
		}
	}
	
	@Override // reg ok
	public Register returnStmt(ReturnStmt ast, StackFrame frame) {
		{
			// save return value if any
			if (ast.arg() != null){
				Register reg = cg.eg.visit(ast.arg(), frame);
				frame.setReturn(reg);
				frame.releaseRegister(reg);
			}

			// restore old ebp
			cg.emit.emitComment("restore old ebp");
			cg.emit.emit("movl", BASE_REG, STACK_REG);
			cg.emit.emit("popl", BASE_REG);
			cg.emit.emitRaw("ret");

			return null;
		}
	}


}
