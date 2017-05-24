package cd.transform;

import cd.ToDoException;
import cd.ir.Ast;
import cd.ir.Ast.Expr;
import cd.ir.Ast.IntConst;
import cd.ir.Ast.MethodDecl;
import cd.ir.Ast.Stmt;
import cd.ir.Ast.Var;
import cd.ir.Ast.VarDecl;
import cd.ir.AstVisitor;
import cd.ir.BasicBlock;
import cd.ir.ControlFlowGraph;
import cd.ir.Symbol;

public class CfgBuilder extends AstVisitor<BasicBlock, Void > {
	
	ControlFlowGraph cfg;
	CfgExprVisitor eb;
	CfgStmtVisitor sb;
	
	public void build(MethodDecl mdecl) {
		cfg = mdecl.cfg = new ControlFlowGraph();
		cfg.start = cfg.newBlock(); // Note: Use newBlock() to create new basic blocks
		cfg.end = cfg.newBlock(); // unique exit block to which all blocks that end with a return stmt. lead
		
		
	//	throw new ToDoException();
		
		//Visitor erstellen
	//	eb = new CfgExprVisitor(this);
		sb = new CfgStmtVisitor(this);

		//visitor aufrufen
		BasicBlock last = sb.cfg(mdecl.body(),cfg.start);
		
		cfg.connect(last, cfg.end);
		
		/*
		// add local variables
		for (int i = 0; i<mdecl.decls().children().size(); i++){
			VarDecl vd = (VarDecl )mdecl.decls().children().get(i);
			String vdName = vd.name;
			
			Var v = new Var(vdName);
			IntConst c = new IntConst(1);
			
			Stmt s = new Ast.Assign(v,c);
			cfg.start.stmts.add(s);
			
			//cfg.start.stmts.add((Assign));
			
		}
		*/
		//visit(mdecl.body(),null);
		
		
		
		
		// CFG and AST are not synchronized, only use CFG from now on
		//		mdecl.setBody(null);
		//?????
		/*
		 * erst am Schluss... oben implementieren
		 */
		
		//System.out.print(mdecl.body().children().toString());
		mdecl.setBody(null);
		//System.out.print(mdecl.body().children().toString());

		
	}

}
