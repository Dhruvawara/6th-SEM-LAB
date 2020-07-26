	// Write a LEX program to recognize valid arithmetic expression. 
	// Identifiers in the expression could be only integers and 
	// operators could be + and *. Count the identifiers & operators 
	// present and print them separately. 
 
%{ 
 	int a[] = {0,0,0,0}, i, valid = 1, opnd = 0; 
%} 
%x OPER 
%% 
[0-9]+ { BEGIN OPER; opnd++;} 
<OPER>"+" { if(valid) { valid = 0; i = 0;} else ext();} 
<OPER>"-" { if(valid) { valid = 0; i = 1;} else ext();} 
<OPER>"*" { if(valid) { valid = 0; i = 2;} else ext();} 
<OPER>"/" { if(valid) { valid = 0; i = 3;} else ext();} 
<OPER>[a-zA-Z0-9]+ { opnd++;  
 	 	 	 	 		if(valid==0){  
 	 	 	 	 	 	 	valid=1; 
							a[i]++; 
 	 	 	 	 	 	}  
 	 	 	 	 	 	else  
 	 	 	 	 	 	 	ext(); 
 	 	 	 	 	} 
<OPER>"\n" { if(valid==0)  
 	 	 	 	ext();   
 	 	 	  else  
 	 	 	 	return 0; 
 	 	 	} 
.\n ext(); 
%% 
ext() {   
 	printf(" Invalid Expression \n");  
 	exit(0);  
} 
main() { 
 	printf(" Type the arithmetic Expression \n");  	
	yylex(); 
 	printf(" Valid Arithmetic Expression \n");  	
	printf(" No. of Operands/Identifiers : %d \n ",opnd);  	
	printf(" No. of Additions : %d \n No. of Subtractions : %d \n",a[0],a[1]);  	
	printf(" No. of Multiplications : %d \n No. of Divisions : %d \n",a[2],a[3]); 
} 


	// dhruvawara@dbuntu:~/6th-SEM-LAB/SSOS/1st Program/A$ lex Program1A.l
	// dhruvawara@dbuntu:~/6th-SEM-LAB/SSOS/1st Program/A$ cc lex.yy.c -ll -o Program1A.out
	// dhruvawara@dbuntu:~/6th-SEM-LAB/SSOS/1st Program/A$ ./Program1A.out
	// Type the arithmetic Expression 
	// 2+3*4
	// Valid Arithmetic Expression 
	// No. of Operands/Identifiers : 3 
	// No. of Additions : 1 
	// No. of Subtractions : 0 
	// No. of Multiplications : 1 
	// No. of Divisions : 0 
	// dhruvawara@dbuntu:~/6th-SEM-LAB/SSOS/1st Program/A$ ./Program1A.out
	// Type the arithmetic Expression 
	// (2+3)()
	// ()() Valid Arithmetic Expression 
	// No. of Operands/Identifiers : 2 
	// No. of Additions : 1 
	// No. of Subtractions : 0 
	// No. of Multiplications : 0 
	// No. of Divisions : 0 
	// dhruvawara@dbuntu:~/6th-SEM-LAB/SSOS/1st Program/A$ ./Program1A.out
	// Type the arithmetic Expression 
	// ((2+5)*(2-5))*3
	// (()()) Valid Arithmetic Expression 
	// No. of Operands/Identifiers : 5 
	// No. of Additions : 1 
	// No. of Subtractions : 1 
	// No. of Multiplications : 2 
	// No. of Divisions : 0 
	// dhruvawara@dbuntu:~/6th-SEM-LAB/SSOS/1st Program/A$ ./Program1A.out
	// Type the arithmetic Expression 
	// 2+
	// Invalid Expression 