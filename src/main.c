#include <stdio.h>
#include <string.h>
#include <stdlib.h>

#include "request.h"
#include "conffileutils.h"

int main(){
	char z[] = "  disc  asdsa fds6 434 3 ";
	conffileline_t* test=(conffileline_t*)malloc(sizeof(conffileline_t*));
	parseconfline(z,test);

	// if(test->stype==emptyl)
	// 	printf("erro\n");
	
	printf("%s\n",test->data.disk.name);
	printf("%d\n",test->data.disk.sectors);
	printf("%s\n",test->data.conf.name);
	printf("%s\n",test->data.conf.disk[0].name);
	printf("%s\n",test->data.conf.disk[1].name);
	printf("%s\n",test->data.conf.imagefile);



	if(test->stype==errorf)
		printf("errorf\n");
	if(test->stype==emptyl)
		printf("EMPTYL\n");
	if(test->stype==confl)
		printf("confl\n");
	if(test->stype==diskl)
		printf("diskl\n");

/*
	if(strcmp(opt,"disc")==0)
		if(sscanf(chop(z),"%s %s %d",opt,arg1,&sectors)==3)
			printf("%s %s %d\n",opt,arg1,sectors);
		else
			printf("ERRO\n");
	else if(strcmp(opt,"raidvss")==0){
			if(sscanf(chop(z),"%s %s %s %s %s",opt,arg1,arg2,arg3,arg4)==5)
				printf("%s %s %s %s %s\n",opt,arg1,arg2,arg3,arg4);
			else
				printf("ERRO\n");
		}
	else
		printf("ERRdO\n");*/
	





























/*
	int i=0;

	while(line[i]!='\0' && line[i]!=' '){
		arg[i]=line[i];
		i++;
	}
	arg[i]='\0';

	if(strcmp(arg,"disc")==0){
		line=chop(&line[i]);
		i=0;
		while(line[i]!='\0' && line[i]!=' '){
		arg[i]=line[i];
		i++;
		}
		arg[i]='\0';
		if(arg[0]!='\0')
			printf("%s",arg);
		else
			printf("ERRO\n");
		line=chop(&line[i]);
		i=0;
		while(line[i]!='\0' && line[i]!=' '){
		arg[i]=line[i];
		i++;
		}
		arg[i]='\0';
		if(arg[0]!='\0')
			printf("%s",arg);
		else
			printf("ERRO\n");
	}
	else if (strcmp(arg,"raidvss")==0){
		line=chop(&line[i]);
		i=0;
		while(line[i]!='\0' && line[i]!=' '){
		arg[i]=line[i];
		i++;
		}
		arg[i]='\0';
		if(arg[0]!='\0')
			printf("%s",arg);
		else
			printf("ERRO\n");
		line=chop(&line[i]);
		i=0;
		while(line[i]!='\0' && line[i]!=' '){
		arg[i]=line[i];
		i++;
		}
		arg[i]='\0';
		if(arg[0]!='\0')
			printf("%s",arg);
		else
			printf("ERRO\n");
		line=chop(&line[i]);
		i=0;
		while(line[i]!='\0' && line[i]!=' '){
		arg[i]=line[i];
		i++;
		}
		arg[i]='\0';
		if(arg[0]!='\0')
			printf("%s",arg);
		else
			printf("ERRO\n");
		line=chop(&line[i]);
		i=0;
		while(line[i]!='\0' && line[i]!=' '){
		arg[i]=line[i];
		i++;
		}
		arg[i]='\0';
		if(arg[0]!='\0')
			printf("%s",arg);
		else
			printf("ERRO\n");
	}
	else 
		printf("ERRO");
*/












	
/*	if(strcmp(parsed,"disc")==0){
		parsed=strtok(NULL," ");
		if(parsed!=NULL){
			printf("%s\n",parsed);
			parsed=strtok(NULL," ");
			if(parsed!=NULL)
				printf("%d\n",atoi(parsed));
			else
				printf("ERRO\n");
		}
		else
			printf("ERRO\n");
	}
	else if(strcmp(parsed,"raidvss")==0){
		parsed=strtok(NULL," ");
		
	}
	else
		printf("ERRO\n");
*/


	// if((pool+1)->status==empty)
	// 	printf("empty\n");
	// if((pool+1)->status==waiting)
	// 	printf("waiting\n");

	return 0;
}