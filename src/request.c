#include <stdlib.h>
#include <string.h>

#include "request.h"

/**
 * Copia um pedido da origem para o destino 
 */
void copy_request(request_t* origem,request_t* destino){
	*destino=*origem;
}

/**
 * Limpa um pedido 
 */
void clean_request(request_t* req){
	req->status=empty;
}

/**
 * Inicializa e preenche a estrutura pedido 
 */
void fill_request(request_t* req,sector_t sector){
	req->status=waiting;
	req->sector=sector;
}