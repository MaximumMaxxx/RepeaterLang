grammar Repeater;

/* 
 * Parser Rules
*/

statment: command+ ;

command: execute | say;

execute: executePart* (runCommand);

executePart: (as | align | anchored | at | facing);

align: 'align' AXIS;
as: 'as' TARGET;
anchored: 'anchored' ANCHORPOINT;
at: 'at' TARGET;
facing: 'facing' facingTarget;

say: 'say' STRING;

runCommand: 'run' command;

facingTarget: ('entity' TARGET | COORDINATE);

/*
 * Lexer Rules
*/

DIGIT          : [0-9];
INT            : '-'? DIGIT+;
DECIMAL        : '-'? DIGIT+ '.' DIGIT+;

STRING         : [0-9a-zA-Z]+;
AXIS           : ('x'|'y'|'z')+;
TARGET         : (STRING+ | '@'('a'|'e'|'p'|'r'|'s'));
ANCHORPOINT    : ('eyes'|'feet');
SINGLECORDINATE: ('~' | INT | DECIMAL);
COORDINATE     : (SINGLECORDINATE SINGLECORDINATE SINGLECORDINATE);

WHITESPACE     : ' ' -> skip;