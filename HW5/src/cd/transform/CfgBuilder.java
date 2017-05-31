package cd.transform;

import cd.ir.Ast.MethodDecl;
import cd.ir.AstVisitor;
import cd.ir.BasicBlock;
import cd.ir.ControlFlowGraph;

public class CfgBuilder extends AstVisitor<BasicBlock, Void > {

	ControlFlowGraph cfg;
	CfgStmtVisitor sb;

	public void build(MethodDecl mdecl) {
		cfg = mdecl.cfg = new ControlFlowGraph();
		cfg.start = cfg.newBlock(); // Note: Use newBlock() to create new basic blocks
		cfg.end = cfg.newBlock(); // unique exit block to which all blocks that end with a return stmt. lead

		//Visitor erstellen
		sb = new CfgStmtVisitor(this);

		//visitor aufrufen
		BasicBlock last = sb.cfg(mdecl.body(),cfg.start);

		sb.connect(last, cfg.end);

		// CFG and AST are not synchronized, only use CFG from now on
		mdecl.setBody(null);
	}

}
