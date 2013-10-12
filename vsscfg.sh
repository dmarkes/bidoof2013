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

fname=config.vss
disk=0
did=0
dtamanho=0
conf=0
cnome=0
cid1=0
cid2=0
cfname=0

###########FUNCOES NECESSÁRIAS A EXECUCAO DO SCRIPT##########

validate(){
checkDuplicates
checkDeclarations
checkDiskSectors
checkDiskImages
}

addDisk(){
echo "disk $did $dtamanho" >> $fname
}

addConf(){
echo "raidvss $cnome $cid1 $cid2 $cfname" >> $fname
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
		-f) if [ "$2" != "-d" ] && [ "$2" != "-c" ] && [ "$2" != "-v" ] && [ -n "$2" ]
			then fname=$2 && shift 2
			else shift
			fi;;
		-d) if [ "$2" != "-c" ] && [ "$2" != "-v" ] && [ "$2" != "-f" ] && [ -n "$2" ]
			then disk=1 && did=$2 && dtamanho=$3 && shift 3
			else disk=1 && echo "Insira ID do disco:" && read did && echo "Insira tamanho do disco:" && read dtamanho && shift
			fi;;
		-c) if [ "$2" != "-f" ] && [ "$2" != "-d" ] && [ "$2" != "-v" ] && [ -n "$2" ]
			then conf=1 && cnome=$2 && cid1=$3 && cid2=$4 && cfname=$5 && shift 5
			else conf=1 && echo "Insira nome da configuracao:" && read cnome && echo "Disk ID 1:" && read cid1 && echo "Disk ID 2:" && read cid2 && echo "Nome do ficheiro de imagem:" && read cfname && shift
			fi;;
		-v) validate;;
		esac
	done
fi

if [ $disk -eq 1 ]
	then addDisk
fi

if [ $conf -eq 1 ]
	then addConf
fi

if [ $conf -eq 0 ] && [ $disk -eq 0 ]
	then cat $fname 
fi