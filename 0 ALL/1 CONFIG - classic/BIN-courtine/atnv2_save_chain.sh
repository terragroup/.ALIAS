#!/bin/sh

################################################################################################################################
# Chaîne de traitement assurant la sauvegarde d'une base de données :
# - Sauvegarde locale de la base.
# - Purge des anciennes sauvegardes.
# - Synchronisation des sauvegardes sur un répertoire distant (point de montage réseau).
# - Purge des anciennes sauvegardes sur le répertoire distant
#
# Sauvegarde additionnelle d'un répertoire de données (configuration, etc.)
################################################################################################################################

# Configuration de la sauvegarde de la base
###########################################

DB_DATABASE="atnv2_production"

LOCAL_BACKUP_DIR="/var/lib/pgsql/backups"

LOCAL_KEEP_NB=30

DIST_BACKUP_DIR="/mnt/APPS/BackupMV/2_datas/9_ATNV2/POSTGRESQL"

DIST_KEEP_NB=30

# Exécution
###########

PATH=/root/bin:$PATH

mre_pgdump.sh ${LOCAL_BACKUP_DIR} ${DB_DATABASE}

mre_purge_lexico.sh ${LOCAL_BACKUP_DIR} ${DB_DATABASE}\* ${LOCAL_KEEP_NB}

if [ -d ${DIST_BACKUP_DIR} ]
then
  rsync -av --size-only ${LOCAL_BACKUP_DIR}/${DB_DATABASE}* ${DIST_BACKUP_DIR}
  mre_purge_lexico.sh ${DIST_BACKUP_DIR} ${DB_DATABASE}\* ${DIST_KEEP_NB}
fi

