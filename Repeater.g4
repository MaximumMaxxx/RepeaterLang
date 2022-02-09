grammar Repeater;

/* 
 * Parser Rules
*/

statment: command+ ;

command: (execute | say);

execute: 'execute' executePart* (runCommand);

executePart: (as | align | anchored | at | facing);

align: 'align' MULTIAXIS;
as: 'as' target;
anchored: 'anchored' ANCHORPOINT;
at: 'at' target|coordinate;
facing: 'facing' facingTarget;

say: 'say' literal;

runCommand: 'run' command;

facingTarget: ('entity' target | coordinate);
literal        : ('"' STRING* '"') | STRING+;
target         : (STRING | '@'('a'|'e'|'p'|'r'|'s'));
singlecordinate: ('~' | INT | DECIMAL) ' '?;
coordinate     : (singlecordinate singlecordinate singlecordinate);

/*
 * Lexer Rules
*/

INT            : '-'? DIGIT+;
DECIMAL        : '-'? DIGIT+ '.' DIGIT+;
MULTIAXIS      : AXIS+;
AXIS           : ('x'|'y'|'z');
ANCHORPOINT    : ('eyes'|'feet');
WHITESPACE     : ' ' -> skip;
DIGIT          : [0-9];
STRING         : ([0-9]|[a-z]|[A-Z]|'_')+;