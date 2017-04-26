grammar Javali; // parser grammar, parses streams of tokens

@header {
	// Java header
	package cd.frontend.parser;
}

//*		x? = [..] == 0..1 
//* 	x* = {..} = 0..n
//* 	x+ = a {a} = 1..n

// PARSER RULES

unit
 	: classDecl+ EOF
 	;
 	
classDecl
	: 'class' Identifier ('extends' Identifier)? '{' memberList '}'
	;

memberList
	: (memberListBody)*
	;
	
memberListBody
	:	varDecl #varD 
	|  	methodDecl #methodD
	;

varDecl
	: type Identifier (',' Identifier)* ';'
	;

methodDecl
	: ( type | 'void' ) Identifier '('  formalParamList? ')'
	'{' varDecl* stmt* '}'
	;
	
formalParamList
	: type Identifier (',' type Identifier)*
	;
	
stmt
	: assignmentStmt | methodCallStmt | ifStmt | whileStmt | returnStmt | writeStmt
	;
	
stmtBlock
	: '{' stmt* '}'
	;
	
assignmentStmt
	: identAccess '=' ( expr | newExpr | readExpr ) ';'
	;
	
writeStmt	
	: 'write' '(' expr ')' ';' #WRITE
	| 'writeln' '(' ')' ';' #WRITELN
	; 
	
ifStmt	
	: 'if' '(' expr ')' stmtBlock ('else' stmtBlock)?
	;

whileStmt	
	: 'while' '(' expr ')' stmtBlock
	;
	
returnStmt	
	: 'return' expr? ';'
	;
	
readExpr
	: 'read' '(' ')'
	;

type
	: primitiveType | referenceType
	;

primitiveType
	: 'boolean'|'int'
	;

referenceType
	: Identifier | arrayType
	;
	
arrayType
	: Identifier '[' ']' | primitiveType '[' ']'
	;

methodCallStmt	
	: (identAccess '.')? methodCallExpression ';'
	;

methodCallExpression
	: Identifier '(' (expr (',' expr)*)? ')'
	;

identAccess 
	: Identifier #ACCESSID
	| 'this'    #ACCESSTHIS
	| identAccess '.' Identifier #ACCESSDOTID
    | identAccess '[' expr ']'  #ACCECSS_BR_EXPR
    | methodCallExpression #ACCESS_METHODCALL
	| identAccess '.' methodCallExpression #ACCESS_METHODCALL_SEQ
    ;

expr
	: literal #LITERAL 
	| identAccess #IDENTACCESS 
	| '(' expr ')' #EXPR
	| (PLUS= '+' |MINUS= '-' |NOT= '!') expr #SIGNEXPR
	| '(' referenceType ')' expr #CASTEXPR
	| expr (PLUS='*' |DIV= '/' |MOD= '%') expr #BINOPSTRONG
	| expr ('+' | '-') expr #BINOPWEAK
	| expr (LT='<' | LTE='<=' |GT= '>'|GTE= '>=') expr #ORDERPEXPR
	| expr (EQ='==' |NEQ= '!=') expr #EQEXPR
	| expr '&&' expr #ANDEXPR
	| expr '||' expr #OREXPR
	;


newExpr
	: 'new' newBody
	;
	
newBody
	: Identifier '(' ')'  		#CONSTRCT_OBJECT
	| Identifier '[' expr ']' 	#ARRAY_OBJECT
	| primitiveType '[' expr ']' #PRIMITIVE_ARRAY_OBJECT
	;

	
literal
	: 'null' #LIT_NULL
	| bool #LIT_BOOL
	| integer #LIT_INT
	;

bool
	:	'false'
	|	'true'
	;
	
integer
	: Hex | Decimal
	;
	
// LEXER RULES

Hex
	: ('0x'| '0X') HexDigit+
	;
	
fragment
HexDigit
	: Digit | 'a'..'f' | 'A'..'F'
	;

Decimal
	: '0'
	| '1'..'9' Digit* 
	;
   
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
