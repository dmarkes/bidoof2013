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
validate=0
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
checkDuplicateNames
checkDuplicates
checkDeclarations
checkDiskSectors
checkDiskImages
}

addDisk(){
echo "disc $did $dtamanho" >> $fname
}

addConf(){
echo "raidvss $cnome $cid1 $cid2 $cfname" >> $fname
}

checkDuplicateNames(){
ORIGIFS=$IFS
IFS=`echo -en "\n\b"`
for i in `cat $fname | awk -F" " '{print $2}'`
do
	if [ `cat $fname | awk -F" " '{print $2}' | grep $i | wc -l` -gt 1 ]
		then echo "Discos ou configuracoes com o mesmo nome: $i"
	fi
done

IFS=$ORIGIFS
}

checkDiskSectors(){

ORIGIFS=$IFS
IFS=`echo -en "\n\b"`

for i in `cat $fname | grep raidvss`
do
	d1=`echo $i | awk -F" " '{print $3}'`
	d2=`echo $i | awk -F" " '{print $4}'`
	if [ `cat $fname | grep "disc $d1" | awk -F" " '{print $3}'` -ne `cat $fname | grep "disc $d2" | awk -F" " '{print $3}'` ]
		then
			echo "Discos sem o mesmo numero de sectores na configuracao : $i"
	fi
done

IFS=$ORIGIFS
}

checkDiskImages(){
ORIGIFS=$IFS
IFS=`echo -en "\n\b"`
for i in `cat config.vss | grep raidvss`
do
	filedisc=`echo $i | awk -F" " '{print $5}'`
	d1=`echo $i | awk -F" " '{print $3}'`
	d2=`echo $i | awk -F" " '{print $4}'`
	if [ -f $filedisc ]
	then
		if [ `cat config.vss | grep "disc $d1" | awk -F" " '{print $3}'` -ne `du -b $filedisc | awk -F" " '{print $1}'` ] || [ `cat config.vss | grep "disc $d2" | awk -F" " '{print $3}'` -ne `du -b $filedisc | awk -F" " '{print $1}'` ]
			then
				echo "Imagem nao tem o mesmo numero de sectores: $i"
		fi
	else echo "Imagem nao existe: $i"
	fi
done
IFS=$ORIGIFS
}

checkDuplicates(){
ORIGIFS=$IFS
IFS=`echo -en "\n\b"`

for i in `cat $fname | grep raidvss`
do
	d1=`echo $i | awk -F" " '{print $3}'`
	d2=`echo $i | awk -F" " '{print $4}'`
	if [ $d1 = $d2 ]
		then
			echo "Discos duplicados na configuracao: $i"
	fi
done

IFS=$ORIGIFS
}

checkDeclarations(){
ORIGIFS=$IFS
IFS=`echo -en "\n\b"`

for i in `cat $fname | grep raidvss`
do
	d1=`echo $i | awk -F" " '{print $3}'`
	d2=`echo $i | awk -F" " '{print $4}'`
	if [ -z `cat $fname | grep "disc $d1"` ] || [ -z `cat $fname | grep "disc $d2"` ]
		then
			echo "Configuracao com discos nao declarados: $i"
	fi
done

IFS=$ORIGIFS
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
		-v) validate && validate=1;;
		esac
	done
fi

if [ $disk -eq 1 ]
	then addDisk
fi

if [ $conf -eq 1 ]
	then addConf
fi

if [ $conf -eq 0 ] && [ $disk -eq 0 ] && [ $validate -eq 0 ]
	then cat $fname 
fi