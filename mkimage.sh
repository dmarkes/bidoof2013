#!/bin/bash
#
# SO 2013 - FASE 1 
#
# GRUPO so007
# 39295 Diogo Marques
# 40376 Fábio Videira
# 39268 Gonçalo Graça
#
# mkimage.sh

if [ $# -eq 1 ] 
	then
		strings /dev/urandom | dd bs=1 count=$1
	else
		echo "O script recebe como unico argumento um numero inteiro"
fi