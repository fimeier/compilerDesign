package cd.backend.codegen;

import java.util.HashMap;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;
import java.util.TreeMap;

import cd.ir.Ast.ClassDecl;
import cd.ir.Ast.MethodDecl;

public class VTable {
	private Map<String, Entry> map;
	
	private Map<Integer, String> offsetMap;
	
	private class Entry {
		public String l;
		public int offset;
		
		public Entry(String l, int offset) {
			this.l = l;
			this.offset = offset;
		}
	}
	
	protected VTable superVTable;
	
	public int size;
	
	public ClassDecl classDecl;
	
	/**
	 * creates the object's vtable.
	 */
	public VTable() {
		map = new HashMap<>();
		offsetMap = new TreeMap<>();
		size = 4;	//So this is a unique location.
	}
	
	public VTable(VTable superVTable, ClassDecl decl) {
		
		map = new HashMap<>();
		
		offsetMap = new HashMap<>();
		
		this.superVTable = superVTable;
		
		if (decl == null)
			return;
		
		List<MethodDecl> methodDecls = decl.methods();
		
		this.classDecl = decl;
		
		int i = 4;
		
		LinkedList<VTable> superClasses = new LinkedList<>();
		
		superClasses.add(superVTable);
		
		VTable baseClass = superVTable;
		
		while (baseClass.superVTable != null) {
			baseClass = baseClass.superVTable;
			superClasses.addFirst(baseClass);
		}
		
		for (VTable table: superClasses) {	//this will add the functions from Object on up to super.
			map.putAll(table.map);
		}
		
		for (VTable table: superClasses) {	//this will add the functions from Object on up to super.
			offsetMap.putAll(table.offsetMap);
		}
		
		i = map.size() * 4 + 4;
		
		for (MethodDecl m: methodDecls) {
			String l = "";
			l = classDecl.name+"_"+m.name;
			if (!map.containsKey(m.name)) {
				map.put(m.name, new Entry(l, i));
				offsetMap.put(i, l);
				i += 4;
			} else {
				map.put(m.name, new Entry(l, map.get(m.name).offset));
				offsetMap.put(map.get(m.name).offset, l);
			}
		}
		
		size = map.size()*4 + 4;	//4 for the pointer to the super table.
	}
	
	/**
	 * when making the function to get the label.
	 * @param funcName
	 * @return
	 */
	public String getLabel(String funcName) {
		return map.get(funcName).l;
	}
	
	/**
	 * when calling a function. To get the offset from the beginning of the VTable.
	 * @param funcName
	 * @return
	 */
	public int getOffset(String funcName) {
		return map.get(funcName).offset;
	}
	
	public void emit (AstCodeGenerator gen) {
		if (classDecl != null)
			gen.emit.emitRaw("\t\t.int vtable_" + classDecl.superClass);
		else
			gen.emit.emitRaw("\t\t.int Object");
		
		for (java.util.Map.Entry<Integer, String> e : offsetMap.entrySet()) {
			gen.emit.emitRaw("\t\t.int " + e.getValue().toString());
		}
	}
}
