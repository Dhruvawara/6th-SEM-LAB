// Design, develop and implement a C/Java program to generate 
// the machine code using Triples for the statement A = -B * (C +D)
// whose intermediate code in threeaddress form: 
//      T1 = -B  
//      T2 = C + D  
//      T3 = T1 + T2   	 	
//      A = T3
#include <stdio.h>
#include <stdlib.h>  
#include<ctype.h> 
char op[2],arg1[5],arg2[5],result[5];
void main()
{
    FILE *fp1, *fp2;
    fp1 = fopen("input.txt", "r");
    fp2 = fopen("output.txt", "w");
    while (!feof(fp1))
    {
        fscanf(fp1, "%s%s%s%s", result, arg1, op, arg2);
        if (strcmp(op, "+") == 0)
        {
            fprintf(fp2, "\nMOV R0,%s", arg1);
            fprintf(fp2, "\nADD R0,%s", arg2);
            fprintf(fp2, "\nMOV %s,R0", result);
        }
        if (strcmp(op, "*") == 0)
        {
            fprintf(fp2, "\nMOV R0,%s", arg1);
            fprintf(fp2, "\nMUL R0,%s", arg2);
            fprintf(fp2, "\nMOV %s,R0", result);
        }
        if (strcmp(op, "-") == 0)
        {
            fprintf(fp2, "\nMOV R0,%s", arg1);
            fprintf(fp2, "\nSUB R0,%s", arg2);
            fprintf(fp2, "\nMOV %s,R0", result);
        }
        if (strcmp(op, "/") == 0)
        {
            fprintf(fp2, "\nMOV R0,%s", arg1);
            fprintf(fp2, "\nDIV R0,%s", arg2);
            fprintf(fp2, "\nMOV %s,R0", result);
        }
        if (strcmp(op, "=") == 0)
        {
            fprintf(fp2, "\nMOV R0,%s", arg1);
            fprintf(fp2, "\nMOV %s,R0\n", result);
        }
    }
    fclose(fp1);
    fclose(fp2);
}

// dhruvawara@dbuntu:~/6th-SEM-LAB/SSOS/5th Program$ cat > input.txt
// T1 -B = ? 
// T2 C + D            
// T3 T1 * T2            
// A T3 = ? 
// ^Z
// [6]+  Stopped                 cat > input.txt
// dhruvawara@dbuntu:~/6th-SEM-LAB/SSOS/5th Program$ cc Program5.c -o Program5.out            ^~~~~~
// dhruvawara@dbuntu:~/6th-SEM-LAB/SSOS/5th Program$ ./Program5.out
// dhruvawara@dbuntu:~/6th-SEM-LAB/SSOS/5th Program$ cat output.txt

// MOV R0,-B
// MOV T1,R0

// MOV R0,C
// ADD R0,D
// MOV T2,R0
// MOV R0,T1
// MUL R0,T2
// MOV T3,R0
// MOV R0,T3
// MOV A,R0

// MOV R0,T3
// MOV A,R0
