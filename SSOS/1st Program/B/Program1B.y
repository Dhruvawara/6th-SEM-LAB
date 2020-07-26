%{ 
#include<stdio.h> 
int valid=1; 
%} 
%token NUM 
%left '+' '-' 
%left '*' '/' 
%% 
Stmt:expr{if(valid){
                printf("Result=%d\n",$$);} 
 	 	    } 
expr:expr'+'expr {$$=$1+$3;}     
    |expr'-'expr {$$=$1-$3;} 
    |expr'*'expr {$$=$1*$3;} 
    |expr'/'expr {if($3==0){ 
 	 	 	            valid=0;printf("Divide by zero error\n");
                    }else 
                        $$=$1/$3;} 
    |'('expr')' {$$=$2;} 
    |NUM {$$=$1;} 
    ; 
%% 
 
main() 
{ 
 	printf("Enter arithmetic exression:\n");  	
    yyparse();  	
    if( valid == 1 ) 
 	 	printf("Expression is valid\n"); 
} 
 
int yyerror() 
{ 
 	printf("Invalid expression\n");  	exit(0); 
} 	 


// dhruva@ubuntu:~/6th-SEM-LAB/SSOS/1st Program/B$ yacc -d Program1B.y
// dhruva@ubuntu:~/6th-SEM-LAB/SSOS/1st Program/B$ cc lex.yy.c y.tab.c -ll -o Program1B.out
// dhruva@ubuntu:~/6th-SEM-LAB/SSOS/1st Program/B$ ./Program1B.out
// dhruvawara@dbuntu:~/6th-SEM-LAB/SSOS/1st Program/B$ ./Program1B.out
// Enter arithmetic exression:
// 2+3*4
// Result=14
// Expression is valid
// dhruvawara@dbuntu:~/6th-SEM-LAB/SSOS/1st Program/B$ ./Program1B.out
// Enter arithmetic exression:
// 2+3/0
// Divide by zero error
// dhruvawara@dbuntu:~/6th-SEM-LAB/SSOS/1st Program/B$ ./Program1B.out
// Enter arithmetic exression:
// (2*8)/2
// Result=8
// Expression is valid