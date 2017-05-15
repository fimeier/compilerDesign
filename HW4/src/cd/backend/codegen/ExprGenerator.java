package cd.backend.codegen;

import static cd.Config.SCANF;
import static cd.backend.codegen.AssemblyEmitter.constant;
import static cd.backend.codegen.RegisterManager.STACK_REG;

import java.util.Arrays;
import java.util.List;

import cd.ToDoException;
import cd.backend.codegen.RegisterManager.Register;
import cd.ir.Ast.BinaryOp;
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

	ExprGenerator(AstCodeGenerator astCodeGenerator) {
		cg = astCodeGenerator;
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

	@Override
	public Register binaryOp(BinaryOp ast, StackFrame frame) {
		{
			// Simplistic HW1 implementation that does
			// not care if it runs out of registers, and
			// supports only a limited range of operations:

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

			switch (ast.operator) {
			case B_TIMES:
				cg.emit.emit("imul", rightReg, leftReg);
				break;
			case B_PLUS:
				cg.emit.emit("add", rightReg, leftReg);
				break;
			case B_MINUS:
				cg.emit.emit("sub", rightReg, leftReg);
				break;
			case B_DIV:
				// Save EAX, EBX, and EDX to the stack if they are not used
				// in this subtree (but are used elsewhere). We will be
				// changing them.
				List<Register> dontBother = Arrays.asList(rightReg, leftReg);
				Register[] affected = { Register.EAX, Register.EBX, Register.EDX };

				for (Register s : affected)
					if (!dontBother.contains(s) && cg.rm.isInUse(s))
						cg.emit.emit("pushl", s);

				// Move the LHS (numerator) into eax
				// Move the RHS (denominator) into ebx
				cg.emit.emit("pushl", rightReg);
				cg.emit.emit("pushl", leftReg);
				cg.emit.emit("popl", Register.EAX);
				cg.emit.emit("popl", "%ebx");
				cg.emit.emitRaw("cltd"); // sign-extend %eax into %edx
				cg.emit.emit("idivl", "%ebx"); // division, result into edx:eax

				// Move the result into the LHS, and pop off anything we saved
				cg.emit.emit("movl", Register.EAX, leftReg);
				for (int i = affected.length - 1; i >= 0; i--) {
					Register s = affected[i];
					if (!dontBother.contains(s) && cg.rm.isInUse(s))
						cg.emit.emit("popl", s);
				}
				break;
			default:
				{
					throw new ToDoException();
				}
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

	@Override
	public Register cast(Cast ast, StackFrame frame) {
		{
			throw new ToDoException();
		}
	}

	@Override
	public Register index(Index ast, StackFrame frame) {
		{
			throw new ToDoException();
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
			throw new ToDoException();
		}
	}

	@Override
	public Register newArray(NewArray ast, StackFrame frame) {
		{
			throw new ToDoException();
		}
	}

	@Override
	public Register newObject(NewObject ast, StackFrame frame) {
		{
			throw new ToDoException();
		}
	}

	@Override
	public Register nullConst(NullConst ast, StackFrame frame) {
		{
			throw new ToDoException();
		}
	}

	@Override
	public Register thisRef(ThisRef ast, StackFrame frame) {
		{
			
			throw new ToDoException();
		}
	}

	@Override
	public Register methodCall(MethodCallExpr ast, StackFrame frame) {
		{
			throw new ToDoException();
		}
	}

	@Override
	public Register unaryOp(UnaryOp ast, StackFrame frame) {
		{
			Register argReg = visit(ast.arg(), frame);
			switch (ast.operator) {
			case U_PLUS:
				break;

			case U_MINUS:
				cg.emit.emit("negl", argReg);
				break;

			case U_BOOL_NOT:
				cg.emit.emit("negl", argReg);
				cg.emit.emit("incl", argReg);
				break;
			}

			return argReg;
		}
	}
	
	@Override
	public Register var(Var ast, StackFrame frame) {
		{
			String location = frame.getVariable(ast);
			Register reg = frame.getRegister();
			cg.emit.emit("movl", location, reg);
			return reg;
		}
	}

}
