#include<stdio.h>
#include<string.h>

#include "conffileutils.h"
#include "raidvss.h"

/**
 * Simplifica a análise da linha. Retorna um apontador para o primeiro
 * caracter de s que não seja um espaço ou tab. Termina a string no
 * caracter '#' (se existir) ou em '\n'
 */
char* chop(char* s){

	int i=0;
	int startAt=0;

	while (s[startAt]==' ')
		startAt++;

	while(s[i]!='\0'){
		if(s[i]=='#' || s[i]=='\n')
			s[i]='\0';
		i++;
	}

	return s+startAt;
}

/**
 * Preenche uma estrutura conffileline_t com o conteúdo da linha
 * recebida como argumento. stype será empty se a linha estiver vazia
 * ou for de comentário e error se a linha não respeitar a sintaxe do
 * ficheiro de configuração. Caso contrário ou uma das estruturas
 * diskconf_t ou conf_t será preenchida com os valores lidos na linha.
 * No caso de conf_t, apenas o nome dos discos será preenchido (não o
 * número de setores. Utiliza a função chop para simplificar a avaliação
 */ 
void parseconfline(char* line,conffileline_t* confline){
	char opt[255];
	int sectors=0;
	char arg1[255];
	char arg2[255];
	char arg3[255];
	char arg4[255];

	if(sscanf(chop(line),"%s",opt)==-1)
		confline->stype=emptyl;
	else if(strcmp(opt,"disc")==0)
		if(sscanf(chop(line),"%s %s %d",opt,arg1,&sectors)==3){
			confline->stype=diskl;
			strcpy(confline->data.disk.name,arg1);
			confline->data.disk.sectors=sectors;
		}
		else
			confline->stype=errorf;
	else if(strcmp(opt,"raidvss")==0){
		if(sscanf(chop(line),"%s %s %s %s %s",opt,arg1,arg2,arg3,arg4)==5){
			confline->stype=confl;
			strcpy(confline->data.conf.name,arg1);
			strcpy(confline->data.conf.disk[0].name,arg2);
			strcpy(confline->data.conf.disk[1].name,arg3);
			strcpy(confline->data.conf.imagefile,arg4);
		}
		else
			confline->stype=errorf;
		}
	else
		confline->stype=errorf;
	}

/**
 * Recebe a lista de argumentos e copia para conffile o nome do
 * ficheiro de configuração.
 * Retorna 1 se foi utilizado o nome de ficheiro por omissão ou 2 se
 * existia o parâmetro -f e por isso foi usado o nome
 * especificado. Retorna 0 se existe um parâmetro -f mas é inválido
 * (último argumento) 
 */
int get_conf_name(char* argv[], char* conffile){
	int i=0;

	while(argv[i]!=NULL){
		if(strcmp(argv[i],"-f")==0 && argv[i+1]!=NULL){
			strcpy(conffile,argv[i+1]);
			return 2;
		}
		else if (strcmp(argv[i],"-f")==0 && argv[i+1]==NULL)
			return 0;
		i++;
	}
	return 1;
}

// /**
//  * Copia a configuração src para dest
//  */
// void copy_conf(conf_t* dest,conf_t* src){

// }

