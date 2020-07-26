%{ 
    #include<stdio.h> 
    #include<stdlib.h> 
%} 
%token A B 
%% 
input:s'\n' {printf("Successful Grammar\n");exit(0);}  
s: A s1 B| B  
s1: ; | A s1 
%% 
main() 
{ 
    printf("Enter A String\n"); yyparse(); 
} 
int yyerror() 
{ 
    printf("Error \n"); 
    exit(0); 
} 


// dhruvawara@dbuntu:~/6th-SEM-LAB/SSOS/2nd Program$ lex Program2.l
// dhruvawara@dbuntu:~/6th-SEM-LAB/SSOS/2nd Program$ yacc -d Program2.y
// dhruvawara@dbuntu:~/6th-SEM-LAB/SSOS/2nd Program$ cc lex.yy.c y.tab.c -ll -o Program2.out
// dhruvawara@dbuntu:~/6th-SEM-LAB/SSOS/2nd Program$ ./Program2.out
// Enter A String
// abbaba
// Error 
// dhruvawara@dbuntu:~/6th-SEM-LAB/SSOS/2nd Program$ ./Program2.out
// Enter A String
// aaaaab
// Successful Grammar
// dhruvawara@dbuntu:~/6th-SEM-LAB/SSOS/2nd Program$ ./Program2.out
// Enter A String
// ab
// Successful Grammar