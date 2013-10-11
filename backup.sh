#!/bin/bash
#
# SO 2013 - FASE 1 
#
# GRUPO so007
# 39295 Diogo Marques
# 40376 Fábio Videira
# 39268 Gonçalo Graça
#
# backup

if [ ! -d "backups" ]
	then 
		mkdir backups
		tar -czvf backups/backup_`date +%m%d%H%M`.tar.gz *
	else
		tar -czvf backups/backup_`date +%m%d%H%M`.tar.gz * --exclude backups
fi