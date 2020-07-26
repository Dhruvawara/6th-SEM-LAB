    // Develop, Implement and Execute a program using YACC tool to 
    // recognize all strings ending with b preceded by n a’s using 
    // the grammar a(power)n b (note: input n value). 
%{ 
    #include "y.tab.h" 
%} 
%% 
a {return A;} 
b {return B;} 
[\n] return '\n'; 
%% 
