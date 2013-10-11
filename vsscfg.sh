#!/bin/bash
#
# SO 2013 - FASE 1 
#
# GRUPO so007
# 39295 Diogo Marques
# 40376 Fábio Videira
# 39268 Gonçalo Graça
#
# vsscfg.sh

fname=vsscfg.vss
disk=0
did=0
dtamanho=0
conf=0
cnome=0


###########FUNCOES NECESSÁRIAS A EXECUCAO DO SCRIPT##########

validate(){
checkDuplicates
checkDeclarations
checkDiskSectors
checkDiskImages
}

addDisk(){
echo addDisk
}

addConf(){
echo addConf
}

checkDiskSectors(){
echo checkDiskSectorssssssssss
}

checkDiskImages(){
echo checkDiskImages
}

checkDuplicates(){
echo checkDuplicates
}

checkDeclarations(){
echo checkDeclarations
}

#MAIN

if [ $# -gt 0 ]
then
	for i in $*
	do
		case $i in
		-f) shift && fname=$1 && shift;;
		-d) shift && disk=1 && addDisk && shift;;
		-c) shift && conf=1 && addConf && shift;;
		-v) validate;;
		*) echo -e * ;;
		esac
	done
fi



