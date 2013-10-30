# SO 2013 - FASE 2 
#
# GRUPO so007
# 39295 Diogo Marques
# 40376 Fábio Videira
# 39268 Gonçalo Graça
#
# makefile

BASE_DIR = .
SRC_DIR = src
INC_DIR = include
OBJ_DIR = obj
CC = gcc
CFLAGS=-Wall -I $(INC_DIR)

all: disk controller

$(BASE_DIR)/disk: $(OBJ_DIR)/disk.o $(OBJ_DIR)/diskutils.o $(OBJ_DIR)/conffile.o $(OBJ_DIR)/conffileutils.o $(OBJ_DIR)/ipc.o $(OBJ_DIR)/log.o $(OBJ_DIR)/request.o
	$(CC) $(OBJ_DIR)/disk.o $(OBJ_DIR)/diskutils.o $(OBJ_DIR)/conffile.o $(OBJ_DIR)/conffileutils.o $(OBJ_DIR)/ipc.o $(OBJ_DIR)/log.o $(OBJ_DIR)/request.o -o disk -lrt

$(BASE_DIR)/controller: $(OBJ_DIR)/controller.o $(OBJ_DIR)/request.o $(OBJ_DIR)/conffileutils.o $(OBJ_DIR)/conffile.o $(OBJ_DIR)/ipc.o 
	$(CC) $(OBJ_DIR)/controller.o $(OBJ_DIR)/request.o $(OBJ_DIR)/conffileutils.o $(OBJ_DIR)/conffile.o $(OBJ_DIR)/ipc.o -o controller -lrt

$(OBJ_DIR)/request.o: $(SRC_DIR)/request.c $(INC_DIR)/request.h
	$(CC) $(CFLAGS) -c $(SRC_DIR)/request.c -o $(OBJ_DIR)/request.o
        
        
$(OBJ_DIR)/diskutils.o: $(SRC_DIR)/diskutils.c $(INC_DIR)/diskutils.h $(INC_DIR)/ipc.h $(INC_DIR)/disk.h
	$(CC) $(CFLAGS) -c $(SRC_DIR)/diskutils.c -o $(OBJ_DIR)/diskutils.o

$(OBJ_DIR)/conffileutils.o: $(SRC_DIR)/conffileutils.c $(INC_DIR)/conffileutils.h $(INC_DIR)/raidvss.h 
	$(CC) $(CFLAGS) -c $(SRC_DIR)/conffileutils.c -o $(OBJ_DIR)/conffileutils.o

clean:
	rm -fv $(OBJ_DIR)/*.o $(BASE_DIR)/controller $(BASE_DIR)/disk

restore:
	cp -ruv --preserve=timestamps ~/areas_de_grupo/so000/raidvss/* .
	
backup:
	./backup.sh