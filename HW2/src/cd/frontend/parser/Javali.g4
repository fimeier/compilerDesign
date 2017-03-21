grammar Javali; // parser grammar, parses streams of tokens

@header {
	// Java header
	package cd.frontend.parser;
}



// PARSER RULES

//* // TODO: declare appropriate parser rules
//* // NOTE: Remove //* from the beginning of each line.
//* 
unit
 	: classDecl+ EOF
 	;
 	
classDecl
	: 'class' Identifier ('extends' Identifier)? '{' MemberList '}'
	;

MemberList
	: (VarDecl | MethodDecl)*
	;

VarDecl
	: Type Identifier (',' Identifier)* ';'
	;

MethodDecl
	: ( Type | 'void' ) Identifier '('  FormalParamList? ')'
	'{' VarDecl? Stmt? '}'
	;

Type
	: PrimitiveType | ReferenceType
	;

PrimitiveType
	: 'boolean'
	| 'int'
	;

ReferenceType
	: Identifier | ArrayType
	;
ArrayType
	: Identifier '[' ']' | PrimitiveType '[' ']'
	;
	
FormalParamList
	: Type Identifier (',' Type Identifier)*
	;

Stmt
	: AssignmentStmt | MethodCallStmt | IfStmt | WhileStmt | ReturnStmt | WriteStmt
	;

AssignmentStmt
	: IdentAccess '=' ( Expr | NewExpr | ReadExpr ) ';'
	;
ReadExpr
	: 'read' '(' ')'
	;

//*IdentAccess
//*	: Identifier | 'this' | IdentAccess '.' Identifier 
//*	| IdentAccess '[' Expr ']' | MethodCallExpr
//*	;
IdentAccess
	: Identifier | 'this' | IdentAccess '.' Identifier 
	| IdentAccess '[' Expr ']'
	| (
		Identifier '(' ActualParamList? ')'
		| IdentAccess '.' Identifier '(' [ ActualParamList ] ')'
	)
	;
MethodCallExpr
	: Identifier '(' ActualParamList? ')'
	| IdentAccess '.' Identifier '(' [ ActualParamList ] ')'
	;

Expr
	: Literal
	| IdentAccess
	| '(' Expr ')'
	| ('+' | '-' | '!') Expr
	| '(' ReferenceType ')' Expr
	| Expr ('*' | '/' | '%') Expr
	| Expr ('+' | '-') Expr
	| Expr ('<' | '<=' | '>'| '>=') Expr
	| Expr ('==' | '!=') Expr
	| Expr '&&' Expr
	| Expr '||' Expr	
	;

ActualParamList
	: Expr (',' Expr)*
	;


Literal
	: 'null' | Boolean | Integer;
Integer
	: Hex | Decimal
	;
Hex
	: ('0x'| '0X') HexDigit+
	;
HexDigit
	: Digit | 'a'..'f' | 'A'..'F'
	;


Decimal
	: '0'
	| '1'..'9' Digit* 
	;



NewExpr
	: 'new'
	( Identifier '(' ')' 
		| Identifier '[' Expr ']'
		| PrimitiveType '[' Expr ']'
	)
	;
MethodCallStmt	
	: MethodCallExpr ';'
	;
IfStmt	
	: 'if' '(' Expr ')' StmtBlock ('else' StmtBlock)?
	;
StmtBlock
	: '{' Stmt* '}'
	;

WhileStmt	
	: 'while' '(' Expr ')' StmtBlock
	;
ReturnStmt	
	: 'return' Expr? ';'
	;
WriteStmt	
	: (
		'write' '(' Expr ')'
		|
		'writeln' '(' ')'
		) ';'
	;    


// LEXER RULES
// TODO: provide appropriate lexer rules for numbers and boolean literals



// Java(li) identifiers:
Identifier 
	:	Letter (Letter|Digit)*
	;

fragment
Letter
	:	'A'..'Z'
	|	'a'..'z'
	;

fragment
Digit
	:	'0'..'9'
	;

fragment
Boolean
	:	'false'
	|	'true'
	;


// comments and white space does not produce tokens:
COMMENT
	:	'/*' .*? '*/' -> skip
	;

LINE_COMMENT
	:	'//' ~('\n'|'\r')* -> skip
	;

WS
	:	(' '|'\r'|'\t'|'\n') -> skip
	;
