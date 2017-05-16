package cd.backend.codegen;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import cd.ir.Ast.ClassDecl;


public class VTableManager {
	
	private Map<String, VTable> map;
	
	private AstCodeGenerator gen;
	
	public VTableManager(List<? extends ClassDecl> list, AstCodeGenerator gen) {
		
		map = new HashMap<>();
		
		this.gen = gen;
		
		map.put("Object", new VTable());
		
		map.put("int_array", new VTable(map.get("Object"), null));
		
		map.put("boolean_array", new VTable(map.get("Object"), null));
				
		boolean needAnotherIteration = true;
		
		while (needAnotherIteration) {
			
			needAnotherIteration = false;
			
			for (ClassDecl decl : list) {
				if (map.containsKey(decl.superClass)) {
					if (!map.containsKey(decl.name)) {
						map.put(decl.name, new VTable(map.get(decl.superClass), decl));
						map.put(decl.name + "_array", new VTable(map.get("Object"), null));
					}
				} else {
					needAnotherIteration = true;
				}
					
			}
		}
	}
	
	public VTable get(String className) {
		return map.get(className);
	}
	
	public String getLabel(String className) {
		return "vtable_" + className;
	}
	
	public void emit() {
		for (java.util.Map.Entry<String, VTable> e:map.entrySet()) {
			gen.emit.emitLabel("\tvtable_" + e.getKey());
			
			if (e.getKey().equals("Object")) {
				gen.emit.emitRaw("\t\t.int " + "0");	//null pointer.
				continue;
			}
			
			e.getValue().emit(gen);
		}
	}
}
