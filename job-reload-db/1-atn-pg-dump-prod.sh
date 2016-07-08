#!/bin/sh

# ------------------------------------------------------------------------------
# OBJECTIF :
# ------------------------------------------------------------------------------
echo 'START'
# ------------------------------------------------------------------------------

# ------------------------------------------------------------------------------
# ctx : GLOBAL
# ------------------------------------------------------------------------------
export ATN_BDD_SRC="atnv2_production"
export ATN_BDD_DEST="atnv2_preprod"
# ------------------------------------------------------------------------------
# ctx : DUMP
# ------------------------------------------------------------------------------
remote_connect (){
  psql -d atnv2_preprod -U atnv2_preprod -h 10.196.165.17
}

dump_prod (){
  # rct
  PGDATABASE='atnv2_preprod'
  BACKUP_DIR="/var/lib/pgsql/9.4/backups/"
  DATE=$(date +"%Y-%m-%d_%H-%M-%S")
  SAVE_FILE=${BACKUP_DIR}/${PGDATABASE}_${DATE}.sql.gz # SAVE_FILE=/var/lib/pgsql/backups/atnv2_production_2016-04-11_18-07-11.sql.gz

  pg_dump -p 5432 -h 10.196.165.17 -U atnv2_preprod -d atnv2_preprod -O ${PGDATABASE} | gzip > ${SAVE_FILE}

  # prod
  # PGDATABASE='atnv2_production'
  # BACKUP_DIR="/var/lib/pgsql/backups"
  # DATE=$(date +"%Y-%m-%d_%H-%M-%S")
  # SAVE_FILE=${BACKUP_DIR}/${PGDATABASE}_${DATE}.sql.gz # SAVE_FILE=/var/lib/pgsql/backups/atnv2_production_2016-04-11_18-07-11.sql.gz
  # pg_dump -p 5432 -h 10.196.164.46 -U someuser -O ${PGDATABASE} | gzip > ${SAVE_FILE}


  # pg_dump –U user –W basededonnée > atnv2_production_2015-11-02_23-30-01.sql
}
# dump_prod()


# ------------------------------------------------------------------------------
# ctx : COPIE
# ------------------------------------------------------------------------------
export SRC_DIR="/mnt/apps/BackupMV/2_datas/9_ATNV2/POSTGRESQL/"
export DIST_DIR="/mnt/ARCHIVES/APPS/ArchivageMV/1_MEDICIS/6_Dump_Chargement/${MEDICIS_BDD_DEST}/"





# ------------------------------------------------------------------------------
# ctx : RESTORE
# ------------------------------------------------------------------------------

# Restore: $ psql -U {user-name} -d {desintation_db}-f {dumpfilename.sql}



if [ $? -ne 0 ]; then
  echo >&2 "Echec !!!"
  exit 1
fi
