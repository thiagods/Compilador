%{

%}

PALAVRA [a-zA-Z0-9]+
DIGITO [0-9]+
ID [a-z][a-zA-Z0-9]*
COMPARACAO [==|=!|>=|<=]
ESPACO [\ \t\n]
TEXTO ({ESPACO}|{COMPARACAO}|{ID}|{DIGITO}|{PALAVRA})*
STRING (\ |{COMPARACAO}|{ID}|{DIGITO}|{PALAVRA})*


%%
hipotese														{ printf("Achei um IF");  }
deoutromodo														{ printf("Achei um ELSE");  }
considerando													{ printf("Achei um FOR"); }
sempreque														{ printf("Achei um WHILE"); }
\#																{ printf("Achei um comentario"); }
\#\*{TEXTO}\*\#													{ printf("Achei um bloco de comentario"); }
inteiro															{ printf("Achei um inteiro"); }
real															{ printf("Achei um real"); }
primordial														{ printf("Achei a main"); }
aplicacao														{ printf("Achei uma funcao"); }
sustar 															{ printf("Achei um break"); }
vago															{ printf("Achei um void"); }
0x[0-9A-Fa-f]+													{ printf("Achei um hexa"); }
0b[0?|1{0-1}*]													{ printf("Achei um binario");}
[0-9]+\.[0-9]+													{ printf("Achei um real"); }
\;																{ printf("Achei um ponto e virgula"); }
\"{STRING}\"													{ printf("Achei uma String"); }
{ID}\ ?"\[""\]"													{ printf("Achei um vetor"); }
baldado															{ printf("Achei um NULO"); }
tornar															{ printf("Achei um return"); }

															
.															
<<EOF>>															{ printf("\nFim"); return 0; }
%%

int main(int argc, char *argv[])
{
	FILE *f_in;
	int tipoToken;
	int encontradoIF = 0;

	printf("\n");

	if(argc == 2)
	{
		if(f_in == fopen(argv[1], "r"))
		{
			yyin = f_in;
		}
		else
		{
			perror(argv[0]);
		}
	}
	else
	{
		yyin = stdin;
	}

	while((tipoToken = yylex()) != 0)
	{

	}
	printf("\n\n");
}
