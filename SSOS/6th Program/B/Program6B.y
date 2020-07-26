%{ 
#include <stdio.h>  
#include <stdlib.h> 
int id = 0, key = 0, op = 0; 
%} 
 
%token ID KEY OP  
%% 
input: ID input { id++;} 
| KEY input { key++;} 
| OP input {op++;} 
| ID { id++; } 
| KEY { key++; } 
| OP { op++;} 
; 
%% 
 
extern FILE *yyin; 
 
void main(int argc ,char** argv)  
{ 
 	yyin = fopen(argv[1], "r"); 
 	yyparse(); 
 	printf("Keywords = %d\nIdentifiers = %d\noperators = %d\n", key, id, op); 
} 
 
void yyerror() 
{ 
 	printf("Not valid"); 
} 


// dhruvawara@dbuntu:~/6th-SEM-LAB/SSOS/6th Program/B$ cat > 6Bin.c
// void main() {
//         int a, b, c;
//         p = q + r;
//         m = k + t;
// }
// ^Z
// [1]+  Stopped                 cat > 6Bin.c
// dhruvawara@dbuntu:~/6th-SEM-LAB/SSOS/6th Program/B$ lex Program6B.l
// dhruvawara@dbuntu:~/6th-SEM-LAB/SSOS/6th Program/B$ yacc -d Program6B.y
// dhruvawara@dbuntu:~/6th-SEM-LAB/SSOS/6th Program/B$ cc lex.yy.c y.tab.c -ll -o Program6B.c 
// dhruvawara@dbuntu:~/6th-SEM-LAB/SSOS/6th Program/B$ ./Program6B.c 6Bin.c
// Keyword is void
// Keyword is main

// Keyword is int
// Identifier is a
// Identifier is b
// Identifier is c

// Identifier is p
// Operator is =
// Identifier is q
// Operator is +
// Identifier is r

// Identifier is m
// Operator is =
// Identifier is k
// Operator is +
// Identifier is t


// Keywords = 3
// Identifiers = 9
// operators = 4