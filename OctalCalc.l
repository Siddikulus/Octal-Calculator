%{
#include<stdlib.h>
#include<stdio.h>
#include<string.h>
#include<math.h>
%}
DIGIT [0-9A-F]+
%option noyywrap

%%
[ ]
{DIGIT}  {
	   long  decimal = 0;
           int i = 0;
    	 while (yytext != 0)
    	 {
          	decimal =  decimal +(yytext % 10)* pow(8,i++)
        	yytext = yytext / 10;
    	 }
          yylval = decimal;
	  return NUM;		
          }
\n|. {return yytext[0];}






