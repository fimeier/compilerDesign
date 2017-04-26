grammar Javali_example; // parser grammar, parses streams of tokens

@header {
	// Java header
	package cd.frontend.parser;
}


// parser rules:

// starting rule matching EOF
start : exp EOF ;

exp : exp '*' exp # A
	| exp '+' exp # A
	| ID #B
	;
	
// left recursion example:
list : ID (',' ID)*;

list2 : list2 ',' ID
	| ID ;


//list3 : ID | longlist3 ;
//longlist3 : list3 ',' ID;


// lexer rules
ID : [a-zA-Z] [a-zA-Z0-9]* ;
WS : (' '|'\n'|'\r'|'\t') -> skip;