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
OBJ_DIR = objs
TEST_DIR = tests
CC = gcc
CFLAGS= 



clean:
	rm -fv $(OBJ_DIR)/*.o 

restore:
	cp -rnv --preserve=timestamps ~/areas_de_grupo/so000/raidvss/* .
	
backup:
	./backup.sh