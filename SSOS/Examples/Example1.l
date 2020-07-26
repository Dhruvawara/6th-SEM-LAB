%{

%}

%%
\t ;
is |
am |
are |
were |
was |
be |
being |
been |
do |
does |
did |
will |
would |
should |
can |
could |
has |
have |
had |
go {printf("%s: is a Verb\n",yytext);}
[a-zA-Z]+ {printf("%s: is a not Verb\n",yytext);}
.|\n {ECHO;}
%%

main()
{
    yylex();
}

// lex Example1.l
// cc lex.yy.c -ll -o Example1.out
// ./Example1.out