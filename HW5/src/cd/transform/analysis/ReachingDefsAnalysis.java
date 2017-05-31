package cd.transform.analysis;

import java.util.HashMap;
import java.util.HashSet;
import java.util.Map;
import java.util.Set;

import cd.ir.Ast;
import cd.ir.Ast.Assign;
import cd.ir.Ast.MethodDecl;
import cd.ir.Ast.Stmt;
import cd.ir.Ast.Var;
import cd.ir.BasicBlock;
import cd.ir.ControlFlowGraph;
import cd.ir.Symbol.VariableSymbol.Kind;
import cd.transform.analysis.ReachingDefsAnalysis.Def;
import cd.util.debug.AstOneLine;

/**
 * Computes the sets of reaching definitions for each basic block.
 */
public class ReachingDefsAnalysis extends DataFlowAnalysis<Set<Def>> {

	/**
	 * Perform reaching definitions analysis.
	 * 
	 * @param cfg
	 *            {@link ControlFlowGraph} of a {@link MethodDecl}
	 */
	public ReachingDefsAnalysis(ControlFlowGraph cfg) {
		super(cfg);


		/*
		 * create GEN and KILL Sets
		 */
		generateGenKillDefSet();

		/* 
		 * set initial state
		 * 
		 */

		for(BasicBlock block: cfg.allBlocks){
			inStates.put(block, initialState());
			outStates.put(block, initialState());
		}

		super.iterate();

	}

	@Override
	protected Set<Def> initialState() {
		return new HashSet<Def>();
	}

	@Override
	protected Set<Def> startState() {
		return new HashSet<Def>();
	}

	@Override
	protected Set<Def> transferFunction(BasicBlock block, Set<Def> inState) {

		//set new IN(B)
		inStates.put(block, inState);

		//calculate new OUT(B)
		Set<Def> newOutState = initialState();
		newOutState.addAll(block.genSetDef);
		inState.removeAll(block.killSetDef);
		newOutState.addAll(inState);


		return newOutState;
	}

	@Override
	protected Set<Def> join(Set<Set<Def>> states) {
		Set<Def> newInState = new HashSet<>();
		for (Set<Def> stat: states){
			newInState.addAll(stat);
		}
		return newInState;
	}

	/**
	 * Class representing a definition in the {@link Ast} of a method.
	 */
	public static class Def {
		public final Assign assign;
		public final String target;

		/**
		 * Create a {@link Def} from an {@link Assign} of the form <code>var = ...</code>
		 */
		public Def(Assign assign) {
			if (!(assign.left() instanceof Var) || ((Var) assign.left()).sym.kind == Kind.FIELD)
				throw new IllegalArgumentException("definitions must have (local) variable on LHS");

			this.assign = assign;
			this.target = ((Var) assign.left()).name;
		}

		@Override
		public String toString() {
			return AstOneLine.toString(assign);
		}
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
		for(BasicBlock block: cfg.allBlocks){

			Set<Def> defInBlock = new HashSet<>();

			Map<String,Def> tempGenSet = new HashMap<>();
			block.genSetDef = new HashSet<>();
			block.killSetDef = new HashSet<>();

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
				block.genSetDef.add(entry.getValue());
			}
			//System.out.println("genSet Block "+block.index+": "+block.genSet.toString());

			//add all definitions in this block
			defInAllBlocks.put(block.index, defInBlock);

		}

		//KILL sets
		for(BasicBlock block: cfg.allBlocks){
			Set<Def> defInBlock = defInAllBlocks.get(block.index);
			for (Def entry: defInBlock){
				Boolean removeEntry = !block.killSetDef.contains(entry);

				Set<Def> definitionSet = getDefSet(entry.target);
				//definitionSet.remove(entry);
				block.killSetDef.addAll(definitionSet);

				if (removeEntry){
					block.killSetDef.remove(entry);
				}
			}

			//System.out.println("killSet Block "+block.index+": "+block.killSet.toString());
		}

		//Debug
		//System.out.println("Gefundene target's: "+defSet.keySet().toString());
	}

}
