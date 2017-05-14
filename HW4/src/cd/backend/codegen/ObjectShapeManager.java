package cd.backend.codegen;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import cd.ir.Ast.ClassDecl;

public class ObjectShapeManager {

	private Map<String, ObjectShape> map;
	
	public ObjectShapeManager(List<? extends ClassDecl> list, VTableManager manager) {
		
		map = new HashMap<>();
		map.put("Object", new ObjectShape());
		boolean needAnotherIteration = true;
		
		while (needAnotherIteration) {
			needAnotherIteration = false;
			
			for (ClassDecl decl : list) {
				if (map.containsKey(decl.superClass)) {
					if (!map.containsKey(decl.name)) {
						map.put(decl.name, new ObjectShape(manager.getLabel(decl.name), 
							manager.get(decl.name), map.get(decl.superClass)));
					}
				} else {
					needAnotherIteration = true;
				}
			}
		}
	}
	
	public ObjectShape get(String className) {
		return map.get(className);
	}
	
}
