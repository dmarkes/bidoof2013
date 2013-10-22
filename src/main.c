#include <stdio.h>
#include "request.h"

int main(){
	request_t a;
	sector_t z=100;
	fill_request(&a,z);

	printf("%d\n",a.sector);

	if(a.status==empty)
		printf("empty\n");
	else
		printf("notempty\n");



}