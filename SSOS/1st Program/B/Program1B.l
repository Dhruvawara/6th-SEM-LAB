	// Write YACC program to evaluate arithmetic expression involving operators: +, -, *, and /
%{ 
#include "y.tab.h" 
#include <stdlib.h> 
extern int yylval; 
%} 
 
%% 
[0-9]+ {yylval=atoi(yytext); 
 	    return NUM;} 
\n {return 0;} 
. {return yytext[0];} 
%% 


	// dhruva@ubuntu:~/6th-SEM-LAB/SSOS/1st Program/B$ lex Program1B.l