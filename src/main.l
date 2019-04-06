%{
#include <stdlib.h>
void yyerror(char *);


#include "y.tab.h"

%}

CHAVEE 		[{]
CHAVED		[}]
COLCHE		[[]
COLCHD		[]]
VIRGULA 	[,]
DOISPNT		[:]


NUMERO 	([-]?[0-9]+)|([-]?[0-9]+[.][0-9]+)
PALAVRA  [a-zA-Z]+
STRING	["][a-zA-Z0-9]["]

%%

{NUMERO}	{
			return NUMERO;			
			}

{STRING}	{
			return STRING;	
			}

{CHAVEE}	{
			return CHAVEE;
			}

{CHAVED}	{
			return CHAVED;
			}
{COLCHE}	{
			return COLCHE;
			}

{COLCHD}	{
			return COLCHD;
			}		

{VIRGULA}	{
			return VIRGULA;
			}		

{DOISPNT}	{
			return DOISPNT;
			}

[ \t\r]+	{}
.     {yyerror("Token nao reconhecido!\n");}


%%

int yywrap(){
  return 1;
}
