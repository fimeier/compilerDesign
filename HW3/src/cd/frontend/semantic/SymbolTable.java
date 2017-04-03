package cd.frontend.semantic;

import cd.ir.Symbol.MethodSymbol;
import cd.ir.Symbol.TypeSymbol;
import cd.ir.Symbol.VariableSymbol;

public abstract class SymbolTable {
	
	protected SymbolTable(){}
	
	TypeSymbol getType(MethodSymbol s) {
		return null;
	}
	
	TypeSymbol getType(VariableSymbol s) {
		return null;
	}
	
	
	public static class GlobalTable extends SymbolTable {
		// Class List
		// Build in-type list & constant list
		public GlobalTable(){
			super();
		}
	}
	
	public static class ClassTable extends SymbolTable {
		// Variable List
		// Function List
		public ClassTable(){
			super();
		}
	}
	
	public static class FunctionTable extends SymbolTable {
		// Variable List
		public FunctionTable(){
			super();
		}
	}
}

class VaribleList {
	
	
	
}



