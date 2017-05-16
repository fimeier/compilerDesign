package cd.backend.codegen;

import java.util.HashMap;
import java.util.Map;

import cd.ir.Ast.ClassDecl;
import cd.ir.Ast.VarDecl;

public class ObjectShape {
	private String vtable_addr;
	private Map<String, Integer> map;
	
	public ObjectShape() {
		map = new HashMap<>();
	}
	
	public ObjectShape(String addr, VTable table, ObjectShape superObjShape) {
		
		ClassDecl classDecl = table.classDecl;
		vtable_addr = addr;
		map = new HashMap<>();
		map.putAll(superObjShape.map);
		int i = 4*(map.size()+1);
		for (VarDecl varDecl : classDecl.fields()) {
			if (!map.containsKey(varDecl.name)) {
				map.put(varDecl.name, i);
				i += 4;
			} 
		}
	}
	
	public int sizeInByte() {
		return 4 +  map.size()*4;
	}
	
	public int sizeInN() {
		return 1 +  map.size();
	}
	
	public String getAddr() {
		return this.vtable_addr;
	}
	
	public int getOffset(String name) {
		return map.get(name);
	}
}


