package cd.transform;

import cd.ir.Ast;
import cd.ir.Ast.Assign;
import cd.ir.Ast.BuiltInWrite;
import cd.ir.Ast.BuiltInWriteln;
import cd.ir.Ast.ClassDecl;
import cd.ir.Ast.IfElse;
import cd.ir.Ast.MethodCall;
import cd.ir.Ast.MethodDecl;
import cd.ir.Ast.Nop;
import cd.ir.Ast.ReturnStmt;
import cd.ir.Ast.Seq;
import cd.ir.Ast.VarDecl;
import cd.ir.Ast.WhileLoop;
import cd.ir.AstVisitor;
import cd.ir.BasicBlock;
import cd.ir.ControlFlowGraph;

import java.util.ArrayList;
import java.util.List;


public class CfgStmtVisitor extends AstVisitor<BasicBlock, BasicBlock > {

	protected final CfgBuilder builder;

	CfgStmtVisitor(CfgBuilder builder){
		this.builder = builder;
	}

	public BasicBlock cfg(Seq ast, BasicBlock block) {	
		BasicBlock last = block;
		for (Ast child: ast.children()){
			//System.out.println("visit child="+child.toString());
			last = super.visit(child, last);
		}
		return last;
	}

	@Override
	public BasicBlock visit(Ast ast, BasicBlock block) {
		//System.out.println("VISITOR: visit="+ast.toString());
		//System.out.println("CfgStmtVisitor::visit "+ast.toString());
		return super.visit(ast, block);
	}



	@Override
	public BasicBlock assign(Assign ast, BasicBlock block) {
		//System.out.println("	public BasicBlock assign(Assign ast, BasicBlock block) {");

		/*builder.eb.cfg(ast.left(), block);
		builder.eb.cfg(ast.right(), block);*/


		block.stmts.add(ast);

		return block;
		//cfg.   visit(ast.left(),null);
		// TODO Auto-generated method stub
		//return super.assign(ast, block);
	}

	@Override
	public BasicBlock builtInWrite(BuiltInWrite ast, BasicBlock block) {
		//System.out.println("	public BasicBlock builtInWrite(BuiltInWrite ast, BasicBlock block) {");
		// TODO Auto-generated method stub
		/*if (ast==null||block==null){
			System.out.println("null");
		}*/
		block.stmts.add(ast);
		return block;
		//return super.builtInWrite(ast, block);
	}

	@Override
	public BasicBlock builtInWriteln(BuiltInWriteln ast, BasicBlock block) {
		//System.out.println("	public BasicBlock builtInWriteln(BuiltInWriteln ast, BasicBlock block) {");
		block.stmts.add(ast);
		return block;
	}

	@Override
	public BasicBlock classDecl(ClassDecl ast, BasicBlock block) {
		//System.out.println("	public BasicBlock classDecl(ClassDecl ast, BasicBlock block) {");
		// TODO Auto-generated method stub
		return super.classDecl(ast, block);
	}

	@Override
	public BasicBlock methodDecl(MethodDecl ast, BasicBlock block) {
		//System.out.println("	public BasicBlock methodDecl(MethodDecl ast, BasicBlock block) {");
		// TODO Auto-generated method stub
		return super.methodDecl(ast, block);
	}

	@Override
	public BasicBlock varDecl(VarDecl ast, BasicBlock block) {
		//System.out.println("	public BasicBlock varDecl(VarDecl ast, BasicBlock block) {");
		// TODO Auto-generated method stub
		return super.varDecl(ast, block);
	}

	@Override
	public BasicBlock ifElse(IfElse ast, BasicBlock block) {
		//System.out.println("	public BasicBlock ifElse(IfElse ast, BasicBlock block) {");

		builder.cfg.terminateInCondition(block, ast.condition());

		//visit the
		BasicBlock thenBlockExit = visit(ast.then(),block.trueSuccessor());
		//visit else
		BasicBlock ElseBlockExit =visit(ast.otherwise(),block.falseSuccessor());




		BasicBlock newBlockAfter = builder.cfg.newBlock();
		//builder.cfg.connect(block.trueSuccessor(), newBlockAfter);
		//builder.cfg.connect(block.falseSuccessor(), newBlockAfter);

		builder.cfg.connect(thenBlockExit, newBlockAfter);
		builder.cfg.connect(ElseBlockExit, newBlockAfter);



		return newBlockAfter;
	}

	//TODO: funktioniert überhaupt nicht
	/*
	 * return muss neuen block erstellen, da nach return allenfalls die methode weitzergeht
	 * zudem muss der aktuelle block mit dem letzten verlinkt werden
	 * Problem: wenn es das "letzte return" ist, dann wird ein leerer block zurückgegeben... dort verschmelzen mit builtin -funk??
	 * Idee 2: Vermutung: Nach returnStmt kommt IMMER "public BasicBlock seq()"... d.h. dort das Problemm lösen mit dem neuen Block
	 */
	@Override
	public BasicBlock returnStmt(ReturnStmt ast, BasicBlock block) {
		//System.out.println("	public BasicBlock returnStmt(ReturnStmt ast, BasicBlock block) {");
		// TODO Auto-generated method stub
		//		return super.returnStmt(ast, block);
		block.stmts.add(ast);
		//		builder.cfg.connect(block, builder.cfg.end);

		//BasicBlock newBlockWhile = builder.cfg.newBlock();
		//return newBlockWhile;
		return block;
	}

	@Override
	public BasicBlock methodCall(MethodCall ast, BasicBlock block) {
		//System.out.println("	public BasicBlock methodCall(MethodCall ast, BasicBlock block) {");
		// TODO Auto-generated method stub
		//return super.methodCall(ast, block);
		block.stmts.add(ast);
		return block;
	}

	@Override
	public BasicBlock nop(Nop ast, BasicBlock block) {
		//System.out.println("	public BasicBlock nop(Nop ast, BasicBlock block) {");
		// TODO Auto-generated method stub
		//return super.nop(ast, block);
		//BasicBlock newBlock = builder.cfg.newBlock();
		//builder.cfg.connect(block, newBlock);

		//	newBlock.stmts.add(ast);

		//return newBlock;
		assert(block.stmts.size()==0);

		block.stmts.add(ast);

		return block;

	}

	@Override
	public BasicBlock seq(Seq ast, BasicBlock block) {

		/*
		System.out.println("	public BasicBlock seq(Seq ast, BasicBlock block) {");

		System.out.println("**********create new Block and add it...");
		BasicBlock newBlock = builder.cfg.newBlock();


		List<BasicBlock> bList = new ArrayList<>();
		for (Ast child: ast.children()){
			//BasicBlock block = builder.cfg.newBlock();
			visit(child, block);
		}

		 */
		// TODO Auto-generated method stub
		//	return super.seq(ast, block);

		//BasicBlock temp = block;
		BasicBlock lastBlockInSeq = block;
		for (int i = 0; i < ast.children().size(); i++){ // Ast child : ast.children()){
			lastBlockInSeq = visit(ast.children().get(i), lastBlockInSeq);
			//block must contain something
			if(lastBlockInSeq.stmts.size()>=1){

				/*if the last value is a return-Stmt
				 * 1. connect it to the end-block
				 */
				if ( lastBlockInSeq.stmts.get(lastBlockInSeq.stmts.size()-1).getClass().getSimpleName().equals("ReturnStmt")){
					builder.cfg.connect(lastBlockInSeq, builder.cfg.end);
				}
				/*if there are more childrens create a new, empty block
				 * 1. connect it to the end-block
				 */

			}
		}

		return lastBlockInSeq;	
	}

	@Override
	public BasicBlock whileLoop(WhileLoop ast, BasicBlock block) {
		//System.out.println("public BasicBlock whileLoop(WhileLoop ast, BasicBlock block) {");

		//"While-Condition-BLock"
		BasicBlock newBlockWhile = builder.cfg.newBlock();
		//connect the block with the "While-Condition-BLock"
		builder.cfg.connect(block, newBlockWhile);

		//generates while body and block after while
		builder.cfg.terminateInCondition(newBlockWhile, ast.condition());

		BasicBlock blockWhileBodyReturn =  visit(ast.body(),newBlockWhile.trueSuccessor());

		//	builder.cfg.connect(newBlockWhile.trueSuccessor(), newBlockWhile);
		builder.cfg.connect(blockWhileBodyReturn, newBlockWhile);


		return newBlockWhile.falseSuccessor();
	}



}
