# SO 2013 - FASE 1 
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
TEST_DIR = tests
CC = gcc
CFLAGS=-Wall –I$(INC_DIR)

all: disk controller

$(BASE_DIR)/disk: $(OBJ_DIR)/disk.o $(OBJ_DIR)/diskutils.o $(OBJ_DIR)/conffile.o $(OBJ_DIR)/conffileutils.o $(OBJ_DIR)/ipc.o $(OBJ_DIR)/log.o $(OBJ_DIR)/request.o
	$(CC) $(OBJ_DIR)/disk.o $(OBJ_DIR)/diskutils.o $(OBJ_DIR)/conffile.o $(OBJ_DIR)/conffileutils.o $(OBJ_DIR)/ipc.o $(OBJ_DIR)/log.o $(OBJ_DIR)/request.o -o disk -lrt

$(BASE_DIR)/controller: $(OBJ_DIR)/controller.o $(OBJ_DIR)/request.o $(OBJ_DIR)/conffileutils.o $(OBJ_DIR)/conffile.o $(OBJ_DIR)/ipc.o 
	$(CC) $(OBJ_DIR)/controller.o $(OBJ_DIR)/request.o $(OBJ_DIR)/conffileutils.o $(OBJ_DIR)/conffile.o $(OBJ_DIR)/ipc.o -o controller -lrt

$(OBJ_DIR)/ipc.o: $(SRC_DIR)/ipc.c $(INC_DIR)/ipc.h
        $(CC) $(CFLAGS) -c $(SRC_DIR)/ipc.c

$(OBJ_DIR)/request.o: $(SRC_DIR)/request.c $(INC_DIR)/request.h
        $(CC) $(CFLAGS) -c $(SRC_DIR)/request.c
        
$(OBJ_DIR)/log.o: $(SRC_DIR)/log.c $(INC_DIR)/log.h $(INC_DIR)/raidvss.h $(INC_DIR)/diskutils.h $(INC_DIR)/disk.h
        $(CC) $(CFLAGS) -c $(SRC_DIR)/log.c
        
$(OBJ_DIR)/diskutils.o: $(SRC_DIR)/diskutils.c $(INC_DIR)/diskutils.h $(INC_DIR)/ipc.h $(INC_DIR)/disk.h
        $(CC) $(CFLAGS) -c $(SRC_DIR)/diskutils.c

$(OBJ_DIR)/conffile.o: $(SRC_DIR)/conffile.c $(INC_DIR)/conffile.h $(INC_DIR)/raidvss.h $(INC_DIR)/conffileutils.h
        $(CC) $(CFLAGS) -c $(SRC_DIR)/conffile.c

$(OBJ_DIR)/conffileutils.o: $(SRC_DIR)/conffileutils.c $(INC_DIR)/conffileutils.h $(INC_DIR)/raidvss.h 
        $(CC) $(CFLAGS) -c $(SRC_DIR)/conffileutils.c

$(OBJ_DIR)/disk.o: $(SRC_DIR)/disk.c $(INC_DIR)/raidvss.h $(INC_DIR)/diskutils.h $(INC_DIR)/conffile.h $(INC_DIR)/conffileutils.h $(INC_DIR)/ipc.h $(INC_DIR)/disk.h $(INC_DIR)/log.h
        $(CC) $(CFLAGS) -c $(SRC_DIR)/disk.c
        
$(OBJ_DIR)/controller.o: $(SRC_DIR)/controller.c $(INC_DIR)/raidvss.h $(INC_DIR)/request.h $(INC_DIR)/conffileutils.h $(INC_DIR)/conffile.h $(INC_DIR)/ipc.h
        $(CC) $(CFLAGS) -c $(SRC_DIR)/controller.c

clean:
	rm -fv $(OBJ_DIR)/*.o $(BASE_DIR)/controller $(BASE_DIR)/disk

restore:
	cp -ruv --preserve=timestamps ~/areas_de_grupo/so000/raidvss/* .
	
backup:
	./backup.sh