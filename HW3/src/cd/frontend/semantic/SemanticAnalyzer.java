package cd.frontend.semantic;

import java.util.List;

import cd.Main;
import cd.ToDoException;
import cd.frontend.semantic.SymbolTable.*;
import cd.ir.Ast.ClassDecl;

public class SemanticAnalyzer {
	
	public final Main main;
	private GlobalTable globalTable;
	private TableCreator tableCreator;
	
	public SemanticAnalyzer(Main main) {
		this.main = main;
		this.globalTable = new GlobalTable();
		this.tableCreator = new TableCreator(this);
	}
	
	public void check(List<ClassDecl> classDecls) throws SemanticFailure {
		{	
			for (ClassDecl cd : classDecls){
				tableCreator.gen(cd);
			}
		}
	}

}
