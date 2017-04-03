package cd.frontend.semantic;

import java.util.HashMap;
import java.util.Map;

import com.sun.org.apache.xerces.internal.util.SymbolTable;

import cd.ir.Symbol.MethodSymbol;
import cd.ir.Symbol.TypeSymbol;
import cd.ir.Symbol.VariableSymbol;

public abstract class SymbolTable1 {
	
	protected SymbolTable1(){}
	
	TypeSymbol getType(MethodSymbol s) {
		return null;
	}
	
	TypeSymbol getType(VariableSymbol s) {
		return null;
	}
	
	
	public static class GlobalTable extends SymbolTable1 {
		Map<String, ClassTable> classList;
		// Class List
		// Build in-type list & constant list
		public GlobalTable(){
			super();
			classList = new HashMap<String, ClassTable>();
		}
		
		/*
		 * Adds a Class with Name 'name' to the classTable
		 * returns 'true' if success, and 'false' if duplicate
		 */
		public boolean addClass(String name, ClassTable classTable){
			if (classTable == null)
				return false;
			if (classList.containsKey(name))
				return false;
			classList.put(name, classTable);
			return true;
		}
		
		/*
		 * Checks classList for duplicate class
		 */
		public boolean containsClass(String name){
			if (classList.containsKey(name))
				return false;
			else
				return true;
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



