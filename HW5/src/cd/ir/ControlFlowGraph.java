package cd.ir;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

import cd.ir.Ast.Assign;
import cd.ir.Ast.Expr;
import cd.ir.Ast.Stmt;
import cd.ir.Ast.Var;
import cd.ir.Symbol.VariableSymbol.Kind;
import cd.transform.analysis.ReachingDefsAnalysis.Def;

/** Represents the control flow graph of a single method. */
public class ControlFlowGraph {
	public BasicBlock start, end;
	public final List<BasicBlock> allBlocks = new ArrayList<BasicBlock>();

	public int count() {
		return allBlocks.size();
	}

	public BasicBlock newBlock() {
		//count wird zu index
		BasicBlock blk = new BasicBlock(count());
		allBlocks.add(blk);
		return blk;
	}

	/**
	 * Given a list of basic blocks that do not yet have successors,
	 * merges their control flows into a single successor and returns
	 * the new successor.
	 */
	public BasicBlock join(BasicBlock... pred) {
		BasicBlock result = newBlock();
		for (BasicBlock p : pred) {
			assert p.condition == null;
			assert p.successors.size() == 0;
			p.successors.add(result);
			result.predecessors.add(p);
		}
		return result;
	}

	/** 
	 * Terminates {@code blk} so that it evaluates {@code cond},
	 * and creates two new basic blocks, one for the case where
	 * the result is true, and one for the case where the result is
	 * false.
	 */
	public void terminateInCondition(BasicBlock blk, Expr cond) {
		assert blk.condition == null;
		assert blk.successors.size() == 0;
		blk.condition = cond;
		blk.successors.add(newBlock());
		blk.successors.add(newBlock());
		blk.trueSuccessor().predecessors.add(blk);
		blk.falseSuccessor().predecessors.add(blk);
	}

	public void connect(BasicBlock from, BasicBlock to) {
		System.out.println("CONNECT: "+from.index +" -> " +to.index);
		//IF returnStmt-> not END => don't do it
		if(from.stmts.size()>=1){
			if ( from.stmts.get(from.stmts.size()-1).getClass().getSimpleName().equals("ReturnStmt") && !to.equals(end)){
				return;
			}
		}
		to.predecessors.add(from);
		from.successors.add(to);
	}

	/*
	 * like:
	 * a :{da,d2}
	 * b: {d4}
	 */
	private Map<String,Set<Def>> defSet;
	public Set<Def> getDefSet(String defName){
		return this.defSet.get(defName);
	}


	public void generateGenKillDefSet() {
		this.defSet = new HashMap<>();

		Map<Integer,Set<Def>> defInAllBlocks = new HashMap<>();


		//pro block
		for(BasicBlock block: allBlocks){

			Set<Def> defInBlock = new HashSet<>();

			Map<String,Def> tempGenSet = new HashMap<>();
			block.genSet = new HashSet<>();
			block.killSet = new HashSet<>();

			//alle Stmts des Blocks
			for (Stmt stmt: block.stmts){
				//Assign assign

				if (stmt.getClass().getSimpleName().equals("Assign")){
					Assign assign = (Assign) stmt;
					if (assign.left() instanceof Var && !(((Var) assign.left()).sym.kind == Kind.FIELD)){

						//create Def for stmt in this block
						Def newDef = new Def((Assign)stmt);
						String target = newDef.target;
						defInBlock.add(newDef);

						/*
						 * add it to defSet
						 */
						//get Set from Map or create it if needed
						Set<Def> definitionSet = getDefSet(target);
						if (definitionSet==null){
							definitionSet = new HashSet<>();
						}
						definitionSet.add(newDef);
						defSet.put(newDef.target, definitionSet);

						tempGenSet.put(target,newDef);
					}

				}
			}
			/*
			 * create GEN Set for the block
			 */
			for (Map.Entry<String, Def> entry : tempGenSet.entrySet()){
				block.genSet.add(entry.getValue());
			}
			System.out.println("genSet Block "+block.index+": "+block.genSet.toString());

			//add all definitions in this block
			defInAllBlocks.put(block.index, defInBlock);

		}

		//KILL sets
		for(BasicBlock block: allBlocks){
			Set<Def> defInBlock = defInAllBlocks.get(block.index);
			for (Def entry: defInBlock){
				Boolean removeEntry = !block.killSet.contains(entry);

				Set<Def> definitionSet = getDefSet(entry.target);
				//definitionSet.remove(entry);
				block.killSet.addAll(definitionSet);

				if (removeEntry){
					block.killSet.remove(entry);
				}
			}

			System.out.println("killSet Block "+block.index+": "+block.killSet.toString());
		}

		//Debug
		System.out.println("Gefundene target's: "+defSet.keySet().toString());
	}

}
