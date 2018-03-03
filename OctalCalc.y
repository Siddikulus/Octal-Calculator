%{
#include<ctype.h>
#include<stdio.h>
#include<stdlib.h>
#include<math.h>
#define PI 3.14159265
#define YYSTYPE double
%}
%token NUM
%left '+' '-' 
%left '*' '/' 
%right UMINUS
%%

S : S E '\n' { printf("Answer: %g \nEnter:\n", $2); }
| S '\n'
|
| error '\n' { yyerror("Error: Enter once more…\n" );yyerrok; }
;
E : E '+' E { $$ = $1 + $3; }
| E'-'E { $$=$1-$3; }
| E'*'E { $$=$1*$3; }
| E'/'E { $$=$1/$3; }
| '('E')' { $$=$2; }
| '-'E %prec UMINUS { $$= -$2; }
| NUM
;
%%

#include "lex.yy.c"
#include "-lm"
#include<math.h>

int main()
{
printf("Enter the expression: ");
yyparse();
}

int yyerror (char const* s)
{
printf ("%s \n", s);
exit (1);
}

