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

DB_DATABASE="example"
# DB_USERNAME="admin"
# DB_PASSWORD="admin"

LOCAL_BACKUP_DIR="/var/lib/pgsql/9.2/backups"

LOCAL_KEEP_NB=10

DIST_BACKUP_DIR="/mnt/APPS/backup"

DIST_KEEP_NB=20

# Exécution
###########

mre_pgdump.sh ${LOCAL_BACKUP_DIR} ${DB_DATABASE}

mre_purge_lexico.sh ${LOCAL_BACKUP_DIR} ${DB_DATABASE}\* ${LOCAL_KEEP_NB}

if [ -d ${DIST_BACKUP_DIR} ]
then
  rsync -av ${LOCAL_BACKUP_DIR}/${DB_DATABASE}* ${DIST_BACKUP_DIR}
  mre_purge_lexico.sh ${DIST_BACKUP_DIR} ${DB_DATABASE}\* ${DIST_KEEP_NB}
fi

# Configuration de la sauvegarde distante d'un répertoire
#########################################################

DATE=$(date +"%Y-%m-%d_%H-%M-%S")

DIR_TO_BACKUP="/var/files"

FILE_DIST_BACKUP_DIR="/mnt/APPS/backup"

FILE_DIST_BACKUP_PREFIX="appli_files"

FILE_DIST_BACKUP_NB=10

BACKUP_FILE=${FILE_DIST_BACKUP_DIR}/${FILE_DIST_BACKUP_PREFIX}_${DATE}.tar.gz

# Exécution
###########

if [ -d ${FILE_DIST_BACKUP_DIR} ]
then
  tar -czf ${BACKUP_FILE} ${DIR_TO_BACKUP}
  mre_purge_lexico.sh ${FILE_DIST_BACKUP_DIR} ${FILE_DIST_BACKUP_PREFIX}\* ${FILE_DIST_BACKUP_NB}
fi
