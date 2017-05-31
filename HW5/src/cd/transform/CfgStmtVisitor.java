package cd.transform;

import cd.ir.Ast;
import cd.ir.Ast.Assign;
import cd.ir.Ast.BuiltInWrite;
import cd.ir.Ast.BuiltInWriteln;
import cd.ir.Ast.IfElse;
import cd.ir.Ast.MethodCall;
import cd.ir.Ast.Nop;
import cd.ir.Ast.ReturnStmt;
import cd.ir.Ast.Seq;
import cd.ir.Ast.WhileLoop;
import cd.ir.AstVisitor;
import cd.ir.BasicBlock;


public class CfgStmtVisitor extends AstVisitor<BasicBlock, BasicBlock > {

	protected final CfgBuilder builder;

	CfgStmtVisitor(CfgBuilder builder){
		this.builder = builder;
	}

	public BasicBlock cfg(Seq ast, BasicBlock block) {	
		BasicBlock last = block;
		for (Ast child: ast.children()){
			last = super.visit(child, last);
		}
		return last;
	}

	@Override
	public BasicBlock visit(Ast ast, BasicBlock block) {
		return super.visit(ast, block);
	}



	@Override
	public BasicBlock assign(Assign ast, BasicBlock block) {
		block.stmts.add(ast);
		return block;
	}

	@Override
	public BasicBlock builtInWrite(BuiltInWrite ast, BasicBlock block) {
		block.stmts.add(ast);
		return block;
	}

	@Override
	public BasicBlock builtInWriteln(BuiltInWriteln ast, BasicBlock block) {
		block.stmts.add(ast);
		return block;
	}

	/*
	@Override
	public BasicBlock classDecl(ClassDecl ast, BasicBlock block) {
		return super.classDecl(ast, block);
	}

	@Override
	public BasicBlock methodDecl(MethodDecl ast, BasicBlock block) {
		return super.methodDecl(ast, block);
	}

	@Override
	public BasicBlock varDecl(VarDecl ast, BasicBlock block) {
		return super.varDecl(ast, block);
	}*/

	@Override
	public BasicBlock ifElse(IfElse ast, BasicBlock block) {

		builder.cfg.terminateInCondition(block, ast.condition());

		//visit then
		BasicBlock thenBlockExit = visit(ast.then(),block.trueSuccessor());
		//visit else
		BasicBlock ElseBlockExit =visit(ast.otherwise(),block.falseSuccessor());

		BasicBlock newBlockAfter = builder.cfg.newBlock();

		connect(thenBlockExit, newBlockAfter);
		connect(ElseBlockExit, newBlockAfter);

		return newBlockAfter;
	}

	@Override
	public BasicBlock returnStmt(ReturnStmt ast, BasicBlock block) {
		block.stmts.add(ast);
		return block;
	}

	@Override
	public BasicBlock methodCall(MethodCall ast, BasicBlock block) {
		block.stmts.add(ast);
		return block;
	}

	@Override
	public BasicBlock nop(Nop ast, BasicBlock block) {
		assert(block.stmts.size()==0);
		block.stmts.add(ast);
		return block;
	}

	@Override
	public BasicBlock seq(Seq ast, BasicBlock block) {
		BasicBlock lastBlockInSeq = block;
		for (int i = 0; i < ast.children().size(); i++){ // Ast child : ast.children()){
			lastBlockInSeq = visit(ast.children().get(i), lastBlockInSeq);
			//block must contain something
			if(lastBlockInSeq.stmts.size()>=1){
				/*
				 * if the last value is a return-Stmt
				 * connect it to the end-block
				 */
				if ( lastBlockInSeq.stmts.get(lastBlockInSeq.stmts.size()-1).getClass().getSimpleName().equals("ReturnStmt")){
					connect(lastBlockInSeq, builder.cfg.end);
				}
			}
		}
		return lastBlockInSeq;	
	}

	@Override
	public BasicBlock whileLoop(WhileLoop ast, BasicBlock block) {

		//"While-Condition-BLock"
		BasicBlock newBlockWhile = builder.cfg.newBlock();
		//connect the block with the "While-Condition-BLock"
		connect(block, newBlockWhile);

		//generates while body and block after while
		builder.cfg.terminateInCondition(newBlockWhile, ast.condition());

		BasicBlock blockWhileBodyReturn =  visit(ast.body(),newBlockWhile.trueSuccessor());

		connect(blockWhileBodyReturn, newBlockWhile);

		return newBlockWhile.falseSuccessor();
	}
	
	public void connect(BasicBlock from, BasicBlock to) {
		//System.out.println("CONNECT: "+from.index +" -> " +to.index);
		//IF returnStmt-> not END => don't do it
		if(from.stmts.size()>=1){
			if ( from.stmts.get(from.stmts.size()-1).getClass().getSimpleName().equals("ReturnStmt") && !to.equals(builder.cfg.end)){
				return;
			}
		}
		builder.cfg.connect(from, to);
	}



}
