package cd.transform.analysis;

import java.util.HashMap;
import java.util.HashSet;
import java.util.Set;

import cd.ir.Ast.Assign;
import cd.ir.Ast.MethodDecl;
import cd.ir.Ast.Stmt;
import cd.ir.Ast.Var;
import cd.ir.BasicBlock;
import cd.ir.Symbol.VariableSymbol;
import cd.ir.Symbol.VariableSymbol.Kind;
import cd.util.Tuple;

/**
 * A data-flow analysis that determines if a variable is guaranteed to be non-<code>null</code> at a
 * given point in the program. The state of this analysis represents the set of
 * non-<code>null</code> variables.
 */
public class NonNullAnalysis extends DataFlowAnalysis<Set<VariableSymbol>> {
	
	public NonNullAnalysis(MethodDecl method) {
		super(method.cfg);
		if(method.cfg == null)
			throw new IllegalArgumentException("method is missing CFG");
		
		
		//  create GEN and KILL Sets
		generateGenKillSet();

		super.iterate();
		
	}
	
	@Override
	protected Set<VariableSymbol> initialState() {
		return new HashSet<VariableSymbol>();
	}
	
	@Override
	protected Set<VariableSymbol> startState() {
		return new HashSet<VariableSymbol>();
	}
	
	@Override
	protected Set<VariableSymbol> transferFunction(BasicBlock block, Set<VariableSymbol> inState) {
		//set new IN(B)
		inStates.put(block, inState);

		//calculate new OUT(B)
		Set<VariableSymbol> newOutState = new HashSet<>();
		newOutState.addAll(inState);
		newOutState.removeAll(block.killSetNN);
		newOutState.addAll(block.genSetNN);
		
		return newOutState;
	}
	
	@Override
	protected Set<VariableSymbol> join(Set<Set<VariableSymbol>> states) {
		Set<VariableSymbol> newInState = new HashSet<VariableSymbol>();
		boolean empty = true;
		for (Set<VariableSymbol> stat: states){
			if (empty){
				newInState.addAll(stat);
				empty = false;
			} else {
				newInState.retainAll(stat);
			}
		}
		return newInState;	
	}
	
	/**
	 * Returns the set of variables that are guaranteed to be non-<code>null</code> before
	 * the given statement.
	 */
	public Set<VariableSymbol> nonNullBefore(Stmt stmt) {
		
	NonNullVisitor nnVisitor = new NonNullVisitor();
	NNStmtVisitor nnStmt = new NNStmtVisitor(this);
	
	Set<VariableSymbol> nnSet = new HashSet<>();

		for(BasicBlock b: cfg.allBlocks){
			
			nnSet = new HashSet<>(inStates.get(b));
			
			Set<VariableSymbol> genSetNN = new HashSet<>();
			Set<VariableSymbol> killSetNN = new HashSet<>();
			
			for (Stmt s : b.stmts){
				
				if (s.equals(stmt)){
					return nnSet;
				}
				
				if (s instanceof Assign){
					Assign assign = (Assign) s;
					
					nnStmt.visit(assign.right(), new Tuple(genSetNN, killSetNN));
					nnStmt.visit(assign.left(), new Tuple(genSetNN, killSetNN));
					
					if (assign.left() instanceof Var && !(((Var) assign.left()).sym.kind == Kind.FIELD)){
						
						if (assign.left().type.isReferenceType()){
							Boolean isNN = nnVisitor.visit(assign.right(), nnSet);
							if (isNN != null) {
								
								Var v = (Var) assign.left();
								if (isNN){ // non-null: add right to gen, remove from kill
									genSetNN.add(v.sym);
									killSetNN.remove(v.sym);
									
								} else { // null: add right to kill, remove from gen
									genSetNN.remove(v.sym);
									killSetNN.add(v.sym);
								}
								
							}
						}
						
					}
				} else {
					nnStmt.visit(s, new Tuple(genSetNN, killSetNN));
				}
				nnSet.removeAll(killSetNN);
				nnSet.addAll(genSetNN);
			}
		}
		return nnSet;
	}
	
	
	HashMap<BasicBlock, Set<VariableSymbol>> beforeCondMap = new HashMap<BasicBlock, Set<VariableSymbol>>();
	/**
	 * Returns the set of variables that are guaranteed to be non-<code>null</code> before
	 * the condition of the given basic block.
	 */
	public Set<VariableSymbol> nonNullBeforeCondition(BasicBlock block) {
		Set<VariableSymbol> beforeCond = new HashSet<VariableSymbol>();

		if (block.condition != null){
			if (block.stmts.size() <= 0){
				beforeCond = inStates.get(block);
			} else {
				beforeCond = beforeCondMap.get(block);
			}
			
		}
		
		return beforeCond;
	}
	
	
	public void generateGenKillSet(){
		
		NonNullVisitor nnVisitor = new NonNullVisitor();
		NNStmtVisitor nnStmt = new NNStmtVisitor(this);
		
		Set nnSet = new HashSet<VariableSymbol>();
		
		for(BasicBlock b: cfg.allBlocks){
			inStates.put(b, new HashSet(nnSet));
			
			b.genSetNN = new HashSet<VariableSymbol>();
			b.killSetNN = new HashSet<VariableSymbol>();
			
			for (Stmt s : b.stmts){
				
				if (s instanceof Assign){
					Assign assign = (Assign) s;
					
					nnStmt.visit(assign.right(), new Tuple(b.genSetNN, b.killSetNN));					
					nnStmt.visit(assign.left(), new Tuple(b.genSetNN, b.killSetNN));

					if (assign.left() instanceof Var && !(((Var) assign.left()).sym.kind == Kind.FIELD)){
						
						if (assign.left().type.isReferenceType()){
							Boolean isNN = nnVisitor.visit(assign.right(), nnSet);
							if (isNN != null) {
								
								Var v = (Var) assign.left();
								if (isNN){ // non-null: add right to gen, remove from kill
									b.genSetNN.add(v.sym);
									b.killSetNN.remove(v.sym);
									
								} else { // null: add right to kill, remove from gen
									b.genSetNN.remove(v.sym);
									b.killSetNN.add(v.sym);
								}
								
							}
						}
						
					}
				} else {
					nnStmt.visit(s, new Tuple(b.genSetNN, b.killSetNN));
				}
				nnSet.removeAll(b.killSetNN);
				nnSet.addAll(b.genSetNN);
			}
						
			if (b.condition != null){
				beforeCondMap.put(b, new HashSet<>(nnSet));
				nnStmt.visit(b.condition, new Tuple(b.genSetNN, b.killSetNN));
			}
			
			nnSet.removeAll(b.killSetNN);
			nnSet.addAll(b.genSetNN);
			
			outStates.put(b, new HashSet(nnSet));
			
		}
	}
	
}
