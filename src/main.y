%{
#include <stdio.h>
#include <stdlib.h>
	int flag=0;
void yyerror(char *c);
int yylex(void);
%}


%token INT NUMERO STRING CHAVEE CHAVED COLCHE COLCHD VIRGULA DOISPNT


%%
PROGRAMA: 
		PROGRAMA VALUE {flag = 2;}
		|
		;

VALUE:
	| STRING				{	}
	| NUMERO			 	{	}
	| OBJECT				{	}
	| ARRAY 				{	}
	| VALUE VIRGULA VALUE	{   }
	;

ARRAY:
	| COLCHE VALUE COLCHD {	}
	;


S2V:
	| STRING DOISPNT VALUE	{	}
	| S2V VIRGULA S2V		{	}
	;


OBJECT:
	| CHAVEE CHAVED		{	}
	| CHAVEE S2V CHAVED	{	}
	;


%%

void yyerror(char *s) { 
	flag=1;
}

int main() {

  yyparse();

  if(flag==1)
  	printf("INVALIDO\n");
  	if(flag==2)
  	printf("VALIDO\n");
  
    return 0;

}
