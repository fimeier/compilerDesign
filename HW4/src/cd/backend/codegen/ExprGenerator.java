package cd.backend.codegen;

import static cd.Config.SCANF;
import static cd.backend.codegen.AssemblyEmitter.constant;
import static cd.backend.codegen.RegisterManager.BASE_REG;
import static cd.backend.codegen.RegisterManager.STACK_REG;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.List;

import cd.ToDoException;
import cd.backend.codegen.RegisterManager.Register;
import cd.frontend.semantic.SemanticFailure;
import cd.frontend.semantic.SemanticFailure.Cause;
import cd.ir.Ast.BinaryOp;
import cd.ir.Ast.BinaryOp.BOp;
import cd.ir.Symbol.TypeSymbol;
import cd.ir.Ast.BooleanConst;
import cd.ir.Ast.BuiltInRead;
import cd.ir.Ast.Cast;
import cd.ir.Ast.Expr;
import cd.ir.Ast.Field;
import cd.ir.Ast.Index;
import cd.ir.Ast.IntConst;
import cd.ir.Ast.MethodCallExpr;
import cd.ir.Ast.NewArray;
import cd.ir.Ast.NewObject;
import cd.ir.Ast.NullConst;
import cd.ir.Ast.ThisRef;
import cd.ir.Ast.UnaryOp;
import cd.ir.Ast.Var;
import cd.ir.ExprVisitor;
import cd.util.debug.AstOneLine;

/**
 * Generates code to evaluate expressions. After emitting the code, returns a
 * String which indicates the register where the result can be found.
 */
class ExprGenerator extends ExprVisitor<Register, StackFrame> {
	protected final AstCodeGenerator cg;

	protected int labelNumber;

	ExprGenerator(AstCodeGenerator astCodeGenerator) {
		cg = astCodeGenerator;
		labelNumber = 1;
	}

	public Register gen(Expr ast) {
		return visit(ast, null);
	}

	@Override
	public Register visit(Expr ast, StackFrame frame) {
		try {
			cg.emit.increaseIndent("Emitting " + AstOneLine.toString(ast));
			return super.visit(ast, frame);
		} finally {
			cg.emit.decreaseIndent();
		}

	}

	/*
	 * returns the left register with the value of the calculation or a boolean
	 * TODO: define what to set sets cpu register ??? for ifElse/whileLoop stuff
	 * 
	 */
	@Override
	public Register binaryOp(BinaryOp ast, StackFrame frame) {
		{

			int leftRN = cg.rnv.calc(ast.left());
			int rightRN = cg.rnv.calc(ast.right());

			Register leftReg, rightReg;
			if (leftRN > rightRN) {
				leftReg =  visit(ast.left(), frame);
				rightReg = visit(ast.right(), frame);
			} else {
				rightReg = visit(ast.right(), frame);
				leftReg = visit(ast.left(), frame);
			}

			cg.debug("Binary Op: %s (%s,%s)", ast, leftReg, rightReg);


			//OK??
			/* binary arithmetic ops with integer arguments and return type integer
			 * *, +, -, %, / 
			 */
			if (ast.operator.equals(BOp.B_TIMES)||ast.operator.equals(BOp.B_PLUS)|| ast.operator.equals(BOp.B_MINUS) ||ast.operator.equals(BOp.B_MOD) ||ast.operator.equals(BOp.B_DIV) ){
				switch (ast.operator) {
				case B_TIMES: // *
					cg.emit.emit("imul", rightReg, leftReg);
					break;
				case B_PLUS: // +
					cg.emit.emit("add", rightReg, leftReg);
					break;
				case B_MINUS: // -
					cg.emit.emit("sub", rightReg, leftReg);
					break;
				default: { // % or /
					//save regs
					List<Register> dontBother = Arrays.asList(rightReg, leftReg);
					Register[] affected = { Register.EAX, Register.EBX, Register.EDX };
					saveRegisters(dontBother, affected);

					// Move the LHS (numerator) into eax
					// Move the RHS (denominator) into ebx
					cg.emit.emit("pushl", rightReg);
					cg.emit.emit("pushl", leftReg);
					cg.emit.emit("popl", Register.EAX);
					cg.emit.emit("popl", "%ebx");
					cg.emit.emitRaw("cltd"); // sign-extend %eax into %edx
					cg.emit.emit("idivl", "%ebx"); // division, result into edx:eax

					if(ast.operator.equals(BOp.B_MOD)){
						// % : Move the result into the LHS
						cg.emit.emit("movl", Register.EDX, leftReg);
					} else {
						// / : Move the result into the LHS
						cg.emit.emit("movl", Register.EAX, leftReg);
					}
					//restore Registers
					restoreRegisters(dontBother, affected);
					break;
				}
				}//end of switch

			}

			//OK?
			else if (ast.operator.equals(BOp.B_LESS_THAN)||ast.operator.equals(BOp.B_LESS_OR_EQUAL)|| ast.operator.equals(BOp.B_GREATER_THAN) ||ast.operator.equals(BOp.B_GREATER_OR_EQUAL)  ){
				/* binary ops with integer arguments and return type boolean
				 * <, <=, >, >=
				 */

				//sets condition codes for ifElse, whileLoop...
				cg.emit.emit("cmpl",  rightReg, leftReg);

				//save regs
				List<Register> dontBother = Arrays.asList(rightReg, leftReg);
				Register[] affected = { Register.EAX};
				saveRegisters(dontBother, affected);

				switch (ast.operator) {

				case B_LESS_THAN: { // <
					//set <: register with correct boolean true or false
					cg.emit.emit("setl", "%al");
					break;
				}
				case B_LESS_OR_EQUAL: { // <=
					//set <=: register with correct boolean true or false
					cg.emit.emit("setle", "%al");
					break;
				}
				case B_GREATER_THAN: { // >
					//set >: register with correct boolean true or false
					cg.emit.emit("setg", "%al");
					break;
				}
				case B_GREATER_OR_EQUAL: { // >=
					//set >=: register with correct boolean true or false
					cg.emit.emit("setge", "%al");
					break;
				}
				default: {
					System.out.println("public Register binaryOp(..) implement: "+ast.operator.toString());
					throw new ToDoException();
				}

				}//end of switch
				//sign extend and safe result back
				cg.emit.emit("movzbl", "%al", leftReg);
				//restore Registers
				restoreRegisters(dontBother, affected);
			}

			else {
				switch (ast.operator) {
				/* binary ops with boolean arguments and return type boolean
				 * &&, ||
				 */
				case B_AND: {
					cg.emit.emit("andl",  rightReg, leftReg);
					cg.emit.emit("cmpl",  "$0", leftReg);				
					break;
				}
				case B_OR: {
					cg.emit.emit("orl",  rightReg, leftReg);
					cg.emit.emit("cmpl",  "$0", leftReg);				
					break;
				}

				/* binary ops with L subtype R or R subtype L and return type boolean
				 * ==, !=
				 */
				//TODO
				case B_EQUAL:{ // ==
					/*
					 * compare registers
					 * return 0 or 1
					 * if ((op==BOp.B_EQUAL)||(op==BOp.B_NOT_EQUAL)){
					 */
					cg.emit.emit("cmpl",  rightReg, leftReg);//b eq a


					break;
				}
				case B_NOT_EQUAL: { // !=

					break;
				}
				default: {
					System.out.println("public Register binaryOp(..) implement: "+ast.operator.toString());
					throw new ToDoException();
				}

				}//end of switch
			}

			cg.rm.releaseRegister(rightReg);

			return leftReg;
		}
	}

	@Override
	public Register booleanConst(BooleanConst ast, StackFrame frame) {
		{
			Register reg = cg.rm.getRegister();
			int val = 0;
			if (ast.value){
				val = 1;
			}
			cg.emit.emit("movl", "$" + val, reg);
			return reg;
		}
	}

	@Override
	public Register builtInRead(BuiltInRead ast, StackFrame frame) {
		{
			Register reg = cg.rm.getRegister();
			cg.emit.emit("sub", constant(16), STACK_REG);
			cg.emit.emit("leal", AssemblyEmitter.registerOffset(8, STACK_REG), reg);
			cg.emit.emitStore(reg, 4, STACK_REG);
			cg.emit.emitStore("$STR_D", 0, STACK_REG);
			cg.emit.emit("call", SCANF);
			cg.emit.emitLoad(8, STACK_REG, reg);
			cg.emit.emit("add", constant(16), STACK_REG);
			return reg;
		}
	}

	//TODO
	@Override
	public Register cast(Cast ast, StackFrame frame) {
		{
			/*
			 * casting: (a) b
			 */
			
			cg.emit.emitCommentSection("cast");
			
			//TODOregisters
			Register reg1 = cg.rm.getRegister();
			Register reg2 = cg.rm.getRegister();
			
			//labels
			String labelNotSubtype = cg.eg.getNewLabel();
			String labelIsSubtype = cg.eg.getNewLabel();
			String labelEnd = cg.eg.getNewLabel();
			
			//String labelCheckSubtype = cg.eg.getNewLabel();
			String labelCheckObjectType = cg.eg.getNewLabel();


			/*
			 * check subtype
			 */
			
			/*
			 * get cast type and store it in reg1
			 */
			String castTypeName = ast.typeName;
			//get vtable-address from castTypeName
			cg.emit.emitCommentSection("castTypeName");
			ObjectShape objShape = cg.objShapeManager.get(castTypeName);
			cg.emit.emit("movl", "$"+objShape.getAddr(), reg1);



			/*
			 * get rightRegisteType and store it in reg2
			 */
			//TypeSymbol typeRight =
			Register rTypeRegister = cg.eg.visit(ast.arg(),frame);
			//get vtable-address from supertype
			cg.emit.emitCommentSection("rTypeRegister");
			cg.emit.emit("movl", rTypeRegister, reg2); 

			/*
			 * labelCheckObjectType
			 */
			cg.emit.emitLabel(labelCheckObjectType);
			cg.emit.emit("cmpl", "$0", reg2);
			cg.emit.emit("je", labelNotSubtype); //wenn reg2 vom TypObject => nicht gefunden


			
			/*
			 * Test (A) b; ist b bereits vom Typ A?
			 */

			cg.emit.emit("cmpl", reg1, reg2);
			cg.emit.emit("je", labelIsSubtype); //springt zum labelIsSubtype wenn identisch
			
			/*
			 * get superType and check again
			 */
			cg.emit.emit("movl", "("+reg2.getRepr()+")", reg2); //get superType and store it in reg2
			cg.emit.emit("jmp", labelCheckObjectType);
			
			
			

			/*
			 * labelNotSubtype
			 */
			cg.emit.emitLabel(labelNotSubtype);
			//TODO
			//
			throwError(1);
			
			cg.emit.emit("jmp", labelEnd);
			
			
			
			
			
			/*
			 * labelIsSubtype
			 */
			cg.emit.emitLabel(labelIsSubtype);
			
			
			
			
			
			/*
			 * labelEnd
			 */
			cg.emit.emitLabel(labelEnd);


			
			

			//boolean isSubtype = false;
			/*
			 * two possible cases for casting: (a) b
			 * 1. b subtype of a
			 * 2. a subtype of b
			 */
			/*
			//1. b subtype of a
			isSubtype = checkSubtype(cType, typeRight);
			//2. a subtype of b
			isSubtype = isSubtype || checkSubtype(typeRight, cType);

			if (!isSubtype)
				throw new SemanticFailure(Cause.TYPE_ERROR);

			return cType;	
			*/
			//.....
			
			//return error code
			
			//throw new ToDoException();
			return rTypeRegister;
			
			//TODO register freigeben
		}
	}

	@Override
	public Register index(Index ast, StackFrame frame) {
		{
			// only read, assign in assign visitor
			Register varReg = cg.eg.visit(ast.left(), frame);
			Register indexReg = cg.eg.visit(ast.right(), frame);

			// ERROR CHECK
			// check indexReg >= 0 and  //TODO: error 5
			String elseLabel =  cg.eg.getNewLabel();
			//cg.emit.emit("cmpl", "$0", sizeReg); // size < 0
			//cg.emit.emit("jge",  elseLabel);   // if size >= 0 jump to elseLabel

			// throw error 5: negative array size
			//throwError(5);
			// else jump here and continue
			cg.emit.emitLabel(elseLabel);

			Var var = (Var)ast.left();
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

			// calcutale offset in array
			cg.emit.emit("imul", "$4", indexReg);
			cg.emit.emit("addl", "$8", indexReg);
			cg.emit.emit("addl", indexReg, varReg);
			cg.emit.emit("movl", "("+varReg+")", varReg);

			frame.releaseRegister(indexReg);

			return varReg;
		}
	}


	@Override
	public Register intConst(IntConst ast, StackFrame frame) {
		{
			Register reg = cg.rm.getRegister();
			cg.emit.emit("movl", "$" + ast.value, reg);
			return reg;
		}
	}

	@Override
	public Register field(Field ast, StackFrame frame) {
		{
			Register targetReg = cg.eg.visit(ast.arg(), frame);
			
			VTable table = cg.vtableManager.get(ast.arg().type.name);
			ObjectShape objectShape = cg.objShapeManager.get(table.classDecl.name);

			int offset = objectShape.getOffset(ast.fieldName);

			cg.emit.emit("movl", frame.getAddr(targetReg.getRepr(), offset), targetReg.getRepr());
			
			return targetReg;
		}
	}

	@Override
	public Register newArray(NewArray ast, StackFrame frame) {
		{
			// NOTE: Array of Objects are stored not contiguously in memory! (inlike in C)
			// We store a reference to an Object
			String typeName = ast.typeName.replace("[", "").replace("]", "");
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


			// get the size of the array
			Register sizeReg = visit(ast.arg(), frame);


			// ERROR CHECK
			// check sizeReg >= 0
			String elseLabel =  cg.eg.getNewLabel();
			cg.emit.emit("cmpl", "$0", sizeReg); // size < 0
			cg.emit.emit("jge",  elseLabel);   // if size >= 0 jump to elseLabel

			// throw error 5: negative array size
			throwError(5);
			// else jump here and continue
			cg.emit.emitLabel(elseLabel);


			// calculate the size of the array
			cg.emit.emit("addl", "$2", sizeReg);

			// Create Array and safe its address to %eax
			cg.emit.emit("pushl", "$4" );    // arg2: 4 byte per element
			cg.emit.emit("pushl", sizeReg);  // arg1: size of array
			cg.emit.emit("call", "calloc");  // call calloc with args
			cg.emit.emit("addl", "$8", "%esp");  // remove args from stack

			/* %eax contains address of the created Array */
			// now copy the vtable address to the top of the Object in the heap
			cg.emit.emit("movl", "$"+objectShape.getAddr(), "(%eax)");
			// The size of the array is stored at array_ptr+4
			cg.emit.emit("movl", sizeReg, frame.getAddr("%eax", 4));

			// move addr of the Object to a register and return it
			Register reg = frame.getRegister();
			cg.emit.emit("movl", "%eax", reg);
			return reg;
		}
	}


	@Override
	public Register newObject(NewObject ast, StackFrame frame) {
		{
			cg.emit.emitCommentSection("newObject");
			//Register reg
			VTable table = cg.vtableManager.get(ast.typeName);
			ObjectShape objectShape = cg.objShapeManager.get(table.classDecl.name);

			// Create Object and safe its address to %eax
			cg.emit.emit("pushl", "$4" );    // arg2: size
			cg.emit.emit("pushl", "$"+objectShape.sizeInN() );  // arg1: n items
			cg.emit.emit("call", "calloc");  // call calloc with args
			cg.emit.emit("addl", "$8", "%esp");  // remove args from stack

			// %eax contains address of the created Object
			// now copy the vtable address to the top of the Object in the heap
			cg.emit.emit("movl", "$"+objectShape.getAddr(), "(%eax)");

			// move addr of the Object to a register and return it
			Register reg = frame.getRegister();
			cg.emit.emit("movl", "%eax", reg);
			return reg;
		}
	}

	@Override
	public Register nullConst(NullConst ast, StackFrame frame) {
		{
			Register reg = frame.getRegister();
			cg.emit.emit("movl", "$0", reg);
			return reg;
		}
	}

	@Override
	public Register thisRef(ThisRef ast, StackFrame frame) {
		{
			Register reg = frame.getRegister();
			cg.emit.emit("movl", frame.target(), reg);
			return reg;
		}
	}

	@Override
	public Register methodCall(MethodCallExpr ast, StackFrame frame) {
		{
			
			//get the vtable of the receiving object
			VTable table = cg.vtableManager.get(ast.receiver().type.name);
			// get the label of the function
			String functionName = table.getLabel(ast.methodName);
			
					
			// safe caller saved Registers to stack
			boolean regsSaved[] = {false,false,false}; // eax, ecx, edx
			int i = 0;
			for (Register r: RegisterManager.CALLER_SAVE){
				if (cg.rm.isInUse(r)){
					regsSaved[i] = true;
					cg.emit.emit("pushl", r.getRepr());
					cg.rm.releaseRegister(r);
				}
				i++;
			}
			
			/* prepare function call: */
			// make space for return value
			cg.emit.emit("subl", "$4", "%esp");  
			// add the argmuents to the stack
			List<Expr> arguments = new ArrayList<Expr>(ast.argumentsWithoutReceiver());
			Collections.reverse(arguments);
			for (Expr arg: arguments) {
				Register argReg = frame.getRegister();
				argReg = cg.eg.visit(arg, frame);
				cg.emit.emit("pushl", argReg);
				frame.releaseRegister(argReg);
			}
			// get address of receiver Object
			Register receiverReg = cg.eg.visit(ast.receiver(), frame);
			//set the receiver of the function (arg0)
			cg.emit.emit("pushl", receiverReg);
			frame.releaseRegister(receiverReg);
			
			// call the function:
			cg.emit.emit("call", functionName);
			// remove the args from the stack
			cg.emit.emit("addl", "$"+ast.allArguments().size()*4, "%esp");
			
			// restore caller saved Registers from stack
			for (int j = 2; j <= 0 ; j--){
				if (regsSaved[j]){
					Register restoreReg = RegisterManager.CALLER_SAVE[j];
					cg.emit.emit("popl", restoreReg);
					cg.rm.setToUsed(restoreReg);
				}
			}
			
			// copy the result from the stack into register and return;
			Register returnReg = frame.getRegister();
			cg.emit.emit("popl", returnReg);
			return returnReg;
		}
	}

	//OK
	@Override
	public Register unaryOp(UnaryOp ast, StackFrame frame) {
		{
			Register argReg = visit(ast.arg(), frame);
			
			switch (ast.operator) {
			// unary arithmetic ops with integers
			case U_PLUS:
				break;

			case U_MINUS:
				cg.emit.emit("negl", argReg);
				break;

			// unary ops with boolean
			case U_BOOL_NOT:
				cg.emit.emit("negl", argReg);
				cg.emit.emit("incl", argReg);
				
				//set condition codes for ifElse, WhileLoop....
				cg.emit.emit("cmpl",  "$0", argReg);
				break;
			default: {
				System.out.println("ERROR: implement... public Register unaryOp: "+ast.operator.toString());
				throw new ToDoException();
			}
			}
			return argReg;
		}
	}

	@Override
	public Register var(Var ast, StackFrame frame) {
		{
			cg.emit.emitCommentSection("var");
			Register reg = frame.getVariable(ast);
			return reg;
		}
	}

	public String getNewLabel(){
		labelNumber++;
		return ".L"+labelNumber;
	}

	public void saveRegisters(List<Register> dontBother, Register[] affected){
		//save registers: affected - dontBother
		for (Register s : affected){
			if (!dontBother.contains(s) && cg.rm.isInUse(s)){
				cg.emit.emit("pushl", s);
			}
		}
	}
	public void restoreRegisters(List<Register> dontBother, Register[] affected){
		//restore any registers we saved
		for (int i = affected.length - 1; i >= 0; i--) {
			Register s = affected[i];
			if (!dontBother.contains(s) && cg.rm.isInUse(s))
				cg.emit.emit("popl", s);
		}
	}
	
	private void throwError(int errorCode){
		cg.emit.emit("movl", "$"+errorCode, Register.EAX);
		cg.emit.emit("jmp", ".ERROR_EXIT");
	}

}
