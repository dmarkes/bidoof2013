#include <stdio.h>
#include <string.h>
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

// /**
//  * Preenche uma estrutura conffileline_t com o conteúdo da linha
//  * recebida como argumento. stype será empty se a linha estiver vazia
//  * ou for de comentário e error se a linha não respeitar a sintaxe do
//  * ficheiro de configuração. Caso contrário ou uma das estruturas
//  * diskconf_t ou conf_t será preenchida com os valores lidos na linha.
//  * No caso de conf_t, apenas o nome dos discos será preenchido (não o
//  * número de setores. Utiliza a função chop para simplificar a avaliação
//  */ 
// void parseconfline(char* line,conffileline_t* confline){

// }

// /**
//  * Recebe a lista de argumentos e copia para conffile o nome do
//  * ficheiro de configuração.
//  * Retorna 1 se foi utilizado o nome de ficheiro por omissão ou 2 se
//  * existia o parâmetro -f e por isso foi usado o nome
//  * especificado. Retorna 0 se existe um parâmetro -f mas é inválido
//  * (último argumento) 
//  */
// int get_conf_name(char* argv[], char* conffile){

// }

// /**
//  * Copia a configuração src para dest
//  */
// void copy_conf(conf_t* dest,conf_t* src){

// }

