#include <stdio.h>
#include "request.h"

main(){
	sector_t b=3;
	sector_t z=100;
	request_t pool1;
	request_t copy;
	fill_request(&pool1,b);

	printf("%d\n",pool1.sector);
	copy_request(&pool1,&copy);
	printf("%d\n",copy.sector);
	fill_request(&pool1,z);
	printf("%d\n",pool1.sector);
	printf("%d\n",copy.sector);


	// if((pool+1)->status==empty)
	// 	printf("empty\n");
	// if((pool+1)->status==waiting)
	// 	printf("waiting\n");
}