#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <ctype.h>
#include <locale.h>

	int i;
	int j;
	
int testar( char matriz[6][6], char letra ){
	
	int b=0;
	
	for( i = 1 ; i <= 6 ; i++){
		for ( j = 1 ; j <= 6 ; j++){
			if(matriz[i][j]==letra){
				b++;
				if(matriz[i][2]!=letra||matriz[i][3]!=letra||matriz[i][4]!=letra||matriz[i][5]!=letra){
					break;
				}
			}
		}
		if(b>=5){
			return 1;
		}
		b=0;
	}
	
	int c=0;
	
	for( i = 1 ; i <= 6 ; i++){
		for ( j = 1 ; j <= 6 ; j++){
			if(matriz[j][i]==letra){
				c++;
				if(matriz[2][i]!=letra||matriz[3][i]!=letra||matriz[4][i]!=letra||matriz[5][i]!=letra){
					break;
				}
			}
		}
		if(c>=5){
			return 1;
		}
		c=0;
	}
	
	return 0;
}

void transforma3x3( char matriz[6][6], char aux1[3][3], char aux2[3][3], char aux3[3][3], char aux4[3][3]){
	
	for ( i = 1 ; i <= 3 ; i++ ){
		
		for( j = 1 ; j <= 6 ; j++ ){
			
			if(j<=3)
				aux1[i][j]=matriz[i][j];
			else
			if(j>=4)
				aux2[i][j-3]=matriz[i][j];
		}
	}
	
	for ( i = 4 ; i <= 6 ; i++ ){
		
		for( j = 1 ; j <= 6 ; j++ ){
			
			if(j<=3)
				aux3[i-3][j]=matriz[i][j];
			else
			if(j>=4)
				aux4[i-3][j-3]=matriz[i][j];
		}
	}
}

void transforma6x6( char matriz[6][6], char aux1[3][3], char aux2[3][3], char aux3[3][3], char aux4[3][3] ){
	
	for ( i = 1 ; i <= 6 ; i++ ){
		
		for( j = 1 ; j <= 6 ; j++ ){
			
			if(i<=3 && j<=3)
				matriz[i][j]=aux1[i][j];
			else
				if(i<=3 && j<=6)
					matriz[i][j]=aux2[i][j-3];
			if(i>=4 && j<=3)
				matriz[i][j]=aux3[i-3][j];
			else
				if(i>=4 && j<=6)
					matriz[i][j]=aux4[i-3][j-3];
		}
	}
}

void giradireita( char matriz[3][3] ){
	
	char aux[3][3];
	
	aux[1][3]=matriz[1][1];
	aux[2][3]=matriz[1][2];
	aux[3][3]=matriz[1][3];
	aux[1][2]=matriz[2][1];
	aux[2][2]=matriz[2][2];
	aux[3][2]=matriz[2][3];
	aux[1][1]=matriz[3][1];
	aux[2][1]=matriz[3][2];
	aux[3][1]=matriz[3][3];
	
	for ( i = 1 ; i <= 3 ; i++ ){
		for( j = 1 ; j <= 3 ; j++ ){
			matriz[i][j]=aux[i][j];
		}
	}
}

void giraesquerda( char matriz[3][3] ){
	
	char aux[3][3];
	
	aux[3][1]=matriz[1][1];
	aux[2][1]=matriz[1][2];
	aux[1][1]=matriz[1][3];
	aux[3][2]=matriz[2][1];
	aux[2][2]=matriz[2][2];
	aux[1][2]=matriz[2][3];
	aux[3][3]=matriz[3][1];
	aux[2][3]=matriz[3][2];
	aux[1][3]=matriz[3][3];	
	
	for ( i = 1 ; i <= 3 ; i++ ){
		for( j = 1 ; j <= 3 ; j++ ){
			matriz[i][j]=aux[i][j];
		}
	}
}

void imprimirtoda( char matriz1[3][3] ,char matriz2[3][3], char matriz3[3][3], char matriz4[3][3] ){
	
	int k;
	
	for( i = 1 ; i <= 3 ; i++ ){
		for ( j = 1 ; j <= 3 ; j++ ){
			printf("[%c]",matriz1[i][j]);
			if(j==3)
				printf("|");
		}
		for ( k = 1 ; k <= 3 ; k++ ){
			printf("[%c]",matriz2[i][k]);
			if( k==3)
				printf("\n");
		}
	}
	printf("---------+---------\n");
	for( i = 1 ; i <= 3 ; i++ ){
		for ( j = 1 ; j <= 3 ; j++ ){
			printf("[%c]",matriz3[i][j]);
			if(j==3)
				printf("|");
		}
		for ( k = 1 ; k <= 3 ; k++ ){
			printf("[%c]",matriz4[i][k]);
			if( k==3)
				printf("\n");
		}
	}
	printf("\n");
	getch();
}

void jogador( char matriz[6][6], char nome[20], char letra ){
	
	int resultado=0;
	int linha;
	int coluna;
	int quadran;
	char lado;
	
	char matriz1[3][3];
	char matriz2[3][3];
	char matriz3[3][3];
	char matriz4[3][3];
	
	for ( i = 1 ; i <= 3 ; i++ ){
		for( j = 1 ; j <= 3; j++ ){
			matriz1[i][j]=' ';
			matriz2[i][j]=' ';
			matriz3[i][j]=' ';
			matriz4[i][j]=' ';
		}
	}
	
	char l[1];
	char c[1];
	
	printf("É a vez de %s\n",nome);
	printf("Qual a posição ?\n");
	
	do{
	fflush(stdin);
	printf("Linha:");
	gets(l);
	linha=atoi(l);

	printf("Coluna:");
	gets(c);
	coluna=atoi(c);
	
	while(linha<1 || linha>6){
		printf("Linha Inválida\nInserir novamente a linha\n");
		gets(l);
		linha=atoi(l);
	}
	
	while(coluna<1 || coluna>6){
		printf("Coluna Inválida\nInserir novamente a coluna\n");
		gets(c);
		coluna=atoi(c);
	}
	
	if(matriz[linha][coluna]!=' '){
		printf("Posição já esta ocupada, favor inserir outra.\n");
	}
	}
	while(matriz[linha][coluna]!=' ');
	
	matriz[linha][coluna]=letra;
	
	transforma3x3(matriz,matriz1,matriz2,matriz3,matriz4);
	
	char q[1];
	
	printf("\nEscolha um quadrante para virar ou 5 para sair do jogo:\n 1 - Primeiro\n 2 - Segundo\n 3 - Terceiro\n 4 - Quarto\n");
	fflush(stdin);
	gets(q);
	quadran=atoi(q);
	
	while(quadran<1||quadran>5){
		fflush(stdin);
		printf("\nQuadrante Inválido\nFavor inserir novamente.\n");
		gets(q);
		quadran=atoi(q);
	}
	
	if(quadran==5){
		printf("\nObrigado por jogar.\n");
		exit(0);
	}
	
	printf("\nEscolha para qual lado rotacionar:\nD - Direita\nE - Esquerda\n");
	scanf(" %c",&lado);
	
	lado=toupper(lado);
	
	while(lado!='D' && lado!='E'){
		printf("Lado Inválido\nFavor inserir novamente.\n");
		scanf(" %c",&lado);
		lado=toupper(lado);
	}
	
	
	if (lado=='D'){
		switch (quadran){
			case 01: giradireita(matriz1);break;
			case 02: giradireita(matriz2);break;
			case 03: giradireita(matriz3);break;
			case 04: giradireita(matriz4);break;
		}
	}
	else{
		if(lado=='E'){
			switch (quadran){
				case 01: giraesquerda(matriz1);break;
				case 02: giraesquerda(matriz2);break;
				case 03: giraesquerda(matriz3);break;
				case 04: giraesquerda(matriz4);break;
			}
		}
	}
	
	system("cls");
	
	imprimirtoda(matriz1,matriz2,matriz3,matriz4);
	transforma6x6(matriz,matriz1,matriz2,matriz3,matriz4);
	
}

void main (){
	
	system("color fc");
	setlocale(LC_ALL, "Portuguese");
	printf("     Seja bem-vindo ao JOGO DE 5 EM LINHA\n");
	printf("OBJETIVO: É formar uma sequência de cinco ( O ou X ).\n");
	printf("COMO JOGAR: O jogo é composto por um tabuleiro de 6x6,\n");
	printf("sendo 4 de 3x3 como vocês podem ver a seguir:\n\n");
	printf("            1  2  3  |  4  5  6  \n         1 [ ][ ][ ] | [ ][ ][ ]\n         2 [ ][ ][ ] | [ ][ ][ ]\n         3 [ ][ ][ ] | [ ][ ][ ]\n");
	printf("           ----------+----------\n");
	printf("         4 [ ][ ][ ] | [ ][ ][ ]\n         5 [ ][ ][ ] | [ ][ ][ ]\n         6 [ ][ ][ ] | [ ][ ][ ]\n\n");
	printf("Dessa forma, você escolherá a posição(LINHA COLUNA), e logo\n");
	printf("depois escolherá o quadrante (1-4), e também para qual lado deseja.\n");
	printf("rotacionar o quadrante escolhido.");
	
	getch();
	system("cls");
	
	char primeiro[255];
	char segundo[255];
	
	printf("Qual o nome do Primeiro jogador?\n");
	gets(primeiro);
	printf("Qual o nome do Segundo jogador?\n");
	gets(segundo);
	
	system("cls");
	
	char j1='O';
	char j2='X';
	char tabuleiro[6][6];
	
	for ( i = 1 ; i <= 6 ; i++ ){
		for( j = 1 ; j <= 6 ; j++ ){
			tabuleiro[i][j]=' ';
		}
	}
	
	int g=0;
	int resultado=0;
	
	
	
	while(g<18){
		
	jogador(tabuleiro,primeiro,j1);
	resultado=testar(tabuleiro,j1);
	if(resultado==1){
		printf("\nParabéns %s, você foi o ganhador õ/\n",primeiro);
		break;
	}
	jogador(tabuleiro,segundo,j2);
	resultado=testar(tabuleiro,j2);
	if(resultado==1){
		printf("\nParabéns %s, você foi o ganhador õ/\n",segundo);
		break;
	}
	g++;
	
	}
	
	if(g>=18){
		printf("\nParabéns ao dois jogadores, os dois foram vencedores õ/\n");
		system("pause");
	}
	
	system("pause");
	
}
