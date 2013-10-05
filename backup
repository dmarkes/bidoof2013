#!/bin/bash
#
# SO 2013 - FASE 1 
#
# GRUPO so007
# 39295 Diogo Marques
#
# backup

if [ ! -d "backups" ]
	then 
		mkdir backups
		tar -czvf backups/backup_`date +%m%d%H%M`.tar.gz *
	else
		tar -czvf backups/backup_`date +%m%d%H%M`.tar.gz * --exclude backups
fi