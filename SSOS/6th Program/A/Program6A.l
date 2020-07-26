    // Write a LEX program to eliminate comment lines in
    // a C program and copy the resulting  program into a separate file. 
%{  
#include<stdio.h> 
int com = 0;  
%}  
%% 
"//".* {com++;}  
"/*"([^*]|\*+[^*/])*\*+"/" { com++;}  
.|\n { fprintf(yyout,"%s",yytext);}  
%%  
 
void main(int argc, char *argv[])  
{          
    yyin = fopen(argv[1], "r");  
    yyout = fopen(argv[2], "w");  
    yylex();  
    printf("No of comment lines = %d \n", com);         
}  

// dhruvawara@dbuntu:~/6th-SEM-LAB/SSOS/6th Program/A$ cat > comin.c
// //welcome to BIT 
// #include<stdio.h> 
// /*   Main begins 
// */ void main() 
// { 
// // declaration 
// int a,b,c;  //  integer types 
// a= b+c; 
// /* ************* 
// ********nmm,,*/ 
// } 
// ^Z
// [3]+  Stopped                 cat > comin.c
// dhruvawara@dbuntu:~/6th-SEM-LAB/SSOS/6th Program/A$ lex Program6A.l
// dhruvawara@dbuntu:~/6th-SEM-LAB/SSOS/6th Program/A$ cc lex.yy.c -ll -o Program6A.out
// dhruvawara@dbuntu:~/6th-SEM-LAB/SSOS/6th Program/A$ ./Program6A.out comin.c comout.c
// No of comment lines = 5 
// dhruvawara@dbuntu:~/6th-SEM-LAB/SSOS/6th Program/A$ cat comout.c

// #include<stdio.h> 
//  void main() 
// { 

// int a,b,c;  
// a= b+c; 
 
// } 