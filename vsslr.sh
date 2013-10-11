#!/bin/bash
#
# SO 2013 - FASE 1 
#
# GRUPO so007
# 39295 Diogo Marques
# 40376 Fábio Videira
# 39268 Gonçalo Graça
#
# vsslr.sh

age=$1
logdir=.

########Obtem argumento da directoria se existir#######
if [ $# -gt 1 ]
	then logdir=$2
fi
#######################################################


for i in `find $logdir -name *.log.gz`
do
	if [ `echo $i | awk -F. '{print $(NF-2)}'` -ge $age ]
	then	
		rm $i
	fi
done

for i in `find $logdir -name *.log.gz`
do 
	mv $i `echo $i | awk 'BEGIN {OFS="."; FS="."} ;{$(NF-2)=$(NF-2)+1; print $0}'`
done

for i in `find $logdir -name *.log`
do
	gzip $i
	mv $i.gz `echo $i.gz | sed s/.log.gz/.0.log.gz/g`
done