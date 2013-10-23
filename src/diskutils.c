#include<stdio.h>
#include<stdlib.h>
#include<string.h>

#include "diskutils.h"
#include "ipc.h"
#include "disk.h"


/**
 * Escolhe o próximo pedido a tratar pelo disco na politica LOOK
 * Invocado por select_request
 * Retorna o indice do pedido selecionado
 */
int select_request_LOOK(request_t* pool,int out){

}

/**
 * Escolhe o próximo pedido a tratar pelo disco na politica FCFS
 * Invocado por select_request
 * Retorna o indice do pedido selecionado
 */
int select_request_FCFS(request_t* pool,int out){

}

/**
 * Copia o sector corrente (dado pela variável global csector) do
 * disco (representado por disk) para o argumento sect.
 * Se o sector corrente exceder a dimensão do disco, retorna 0 e
 * posiciona o disco no sector 0. Caso contrário retorna 1
 */
int disk_read_sector(secdata_t* sect,void* disk){

}

/**
 * Copia para sect o sector solicitado em request. Invoca em sequência
 * as funções disk_seek e disk_read_sector para o fazer.
 * Retorna 0 em caso de erro e 1 caso contrário.
 */
int move_and_read(request_t* request,secdata_t* sect,void* disk){

}

/**
 * Imprime informação de utilização para o stderr
 */
void print_help(char* progname){

}

/**
 * Imprime o conteúdo do sector para o stdout no formato <nº do sector>:<conteúdo>
 */
void put_sector(sector_t sector,secdata_t* secdata){
	
}

