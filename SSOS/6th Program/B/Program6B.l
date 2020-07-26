    // Write YACC program to recognize valid identifier, 
    // operators and keywords in the given text (C program) file. 
 
%{ 
#include <stdio.h> 
#include "y.tab.h" 
%} 
%% 
int|char|bool|float|void|for|do|while|if|else|return|void|main {printf("Keyword is %s\n",yytext);return KEY;} 
[+|-|*|/|=|<|>] {printf("Operator is %s\n",yytext);return OP;} 
[a-zA-Z][_a-zA-Z0-9]* {printf("Identifier is %s\n",yytext);return ID;} 
. ; 
%% 