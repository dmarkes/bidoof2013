#include <stdio.h>
#include "request.h"

main(){
	sector_t b=300;
	sector_t z=23;
	sector_t b2=599;
	sector_t g=2;
	request_t* pool1;
	fill_request(pool1,b);
	fill_request(pool1+1,z);
	request_t* pool2;
	fill_request(pool2,g);




	printf("%d\n",(*pool1).sector);
	printf("%d\n",(*(pool1+1)).sector);
	printf("%d\n",(*pool2).sector);


	// if((pool+1)->status==empty)
	// 	printf("empty\n");
	// if((pool+1)->status==waiting)
	// 	printf("waiting\n");
}