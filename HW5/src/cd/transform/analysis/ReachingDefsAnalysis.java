package cd.transform.analysis;

import java.util.Collection;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import cd.ToDoException;
import cd.ir.Ast;
import cd.ir.Ast.Assign;
import cd.ir.Ast.MethodDecl;
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
		cfg.generateGenKillDefSet();

		//TODO Initialization


		/* 
		 * set initial state
		 * 
		 */

		for(BasicBlock block: cfg.allBlocks){
			inStates.put(block, initialState());
			outStates.put(block, initialState());
		}




		//TODO call iterate
		super.iterate();

	}

	@Override
	protected Set<Def> initialState() {
		//throw new ToDoException();
		return new HashSet<Def>();
	}

	@Override
	protected Set<Def> startState() {
		return new HashSet<Def>();
		//throw new ToDoException();
	}

	@Override
	protected Set<Def> transferFunction(BasicBlock block, Set<Def> inState) {

		//set new IN(B)
		inStates.put(block, inState);

		//calculate new OUT(B)
		Set<Def> newOutState = initialState();
		newOutState.addAll(block.genSet);
		inState.removeAll(block.killSet);
		newOutState.addAll(inState);
		

		return newOutState;
		//outStates.put(block, oldOutState);
	}

	@Override
	protected Set<Def> join(Set<Set<Def>> states) {
		Set<Def> newInState = new HashSet<>();
		for (Set<Def> stat: states){
			newInState.addAll(stat);
		}
		//newInState.addAll((Collection<? extends Def>) states);
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
}
