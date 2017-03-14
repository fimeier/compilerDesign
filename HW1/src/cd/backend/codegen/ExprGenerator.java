package cd.backend.codegen;

import cd.Config;
import cd.ToDoException;
import cd.backend.codegen.RegisterManager.Register;
import cd.ir.Ast;
import cd.ir.Ast.BinaryOp;
import cd.ir.Ast.BinaryOp.BOp;
import cd.ir.Ast.BooleanConst;
import cd.ir.Ast.BuiltInRead;
import cd.ir.Ast.Cast;
import cd.ir.Ast.Expr;
import cd.ir.Ast.Field;
import cd.ir.Ast.Index;
import cd.ir.Ast.IntConst;
import cd.ir.Ast.NewArray;
import cd.ir.Ast.NewObject;
import cd.ir.Ast.NullConst;
import cd.ir.Ast.ThisRef;
import cd.ir.Ast.UnaryOp;
import cd.ir.Ast.UnaryOp.UOp;
import cd.ir.Ast.Var;
import cd.ir.ExprVisitor;
import cd.util.debug.AstOneLine;

/**
 * Generates code to evaluate expressions. After emitting the code, returns a
 * String which indicates the register where the result can be found.
 */
class ExprGenerator extends ExprVisitor<Register, Void> {
	protected final AstCodeGenerator cg;

	ExprGenerator(AstCodeGenerator astCodeGenerator) {
		cg = astCodeGenerator;
	}

	public Register gen(Expr ast) {
		return visit(ast, null);
	}

	@Override
	public Register visit(Expr ast, Void arg) {
		try {
			cg.emit.increaseIndent("Emitting "+ AstOneLine.toString(ast));
			return super.visit(ast, null);
		} finally {
			cg.emit.decreaseIndent();
		}

	}

	@Override
	public Register binaryOp(BinaryOp ast, Void arg) {
		{
			Integer calcL = cg.ecrv.visit(ast.left(), arg);
			Integer calcR = cg.ecrv.visit(ast.right(), arg);

			Register regR, regL;
			if (calcL <= calcR){
				regR = cg.eg.visit(ast.right(), arg);
				regL = cg.eg.visit(ast.left(), arg);

			} else {
				regL = cg.eg.visit(ast.left(), arg);
				regR = cg.eg.visit(ast.right(), arg);
			}
			
			BOp op = ast.operator;
			switch (op){
				case B_TIMES: {
					cg.emit.emit("imul", regL, regR);
				} break;
				case B_DIV: {
					//System.out.println(regR);
					cg.emit.emit("movl", regL, "%eax");
					cg.emit.emitRaw("cltd");
					cg.emit.emit("idivl", regR);
					cg.emit.emit("movl", "%eax", regR);
				} break;
				case B_PLUS: {
					cg.emit.emit("add", regL, regR);
				} break;
				case B_MINUS: 
					cg.emit.emit("sub", regR, regL);
					cg.rm.releaseRegister(regR);
					return regL;
					
				default:break;
			}
			
			cg.rm.releaseRegister(regL);
			return regR;
		}
	}

	@Override
	public Register booleanConst(BooleanConst ast, Void arg) {
		{
			throw new RuntimeException("Not required");
		}
	}

	@Override
	public Register builtInRead(BuiltInRead ast, Void arg) {
		{
			Register reg = cg.rm.getRegister();
			
			cg.emit.emit("subl", "$8", "%esp");
			cg.emit.emit("leal", "0(%esp)", "%eax");
			cg.emit.emit("pushl", "%eax");
			cg.emit.emit("pushl", "$STR_D");
			cg.emit.emit("call" , Config.SCANF);
			cg.emit.emit("movl", "8(%esp)", reg);
			cg.emit.emit("addl", "$16","%esp");

			return reg;
			//throw new ToDoException();
		}
	}

	@Override
	public Register cast(Cast ast, Void arg) {
		{
			throw new RuntimeException("Not required");
		}
	}

	@Override
	public Register index(Index ast, Void arg) {
		{
			throw new RuntimeException("Not required");
		}
	}

	@Override
	public Register intConst(IntConst ast, Void arg) {
		{
			Register reg = cg.rm.getRegister();
			cg.emit.emit("movl", "$"+Integer.toString(((IntConst)ast).value), reg.toString());
			return reg;
			//throw new ToDoException();
		}
	}

	@Override
	public Register field(Field ast, Void arg) {
		{
			throw new RuntimeException("Not required");
		}
	}

	@Override
	public Register newArray(NewArray ast, Void arg) {
		{
			throw new RuntimeException("Not required");
		}
	}

	@Override
	public Register newObject(NewObject ast, Void arg) {
		{
			throw new RuntimeException("Not required");
		}
	}

	@Override
	public Register nullConst(NullConst ast, Void arg) {
		{
			throw new RuntimeException("Not required");
		}
	}

	@Override
	public Register thisRef(ThisRef ast, Void arg) {
		{
			throw new RuntimeException("Not required");
		}
	}

	@Override
	public Register unaryOp(UnaryOp ast, Void arg) {
		{
			UOp op = ast.operator;
			Register reg = cg.eg.visit(ast.arg(), arg);
			switch (op){
				case U_PLUS: break;
				case U_MINUS: {
					cg.emit.emit("neg", reg);
				} break;
				default: break;
			}
			return reg;
			//throw new ToDoException();
		}
	}
	
	@Override
	public Register var(Var ast, Void arg) {
		{
			Register reg = cg.rm.getRegister();
			cg.emit.emit("movl", "var_"+ast.name, reg);
			return reg;
			//throw new ToDoException();
		}
	}

}
