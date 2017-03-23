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


# TODO - a finir
# # ______________________________________________________________________________
# success_param(){
# # ______________________________________________________________________________
#   if [ $? -ne $1 ]; then
#     echo >&2 "Pas le bon nombre d'arguments"
#     exit 1
#   fi
# }





# ##############################################################################
# RQ
# ##############################################################################
# echo $(echoyellow "")
# echo $(echogreen  "")
# echo $(echored    "")
# echo $(echocyan   "")
# echo $(echoblue   "")
# echo $(echopurple "")
test_tput(){
  # tput sgr0
  tput rev
  # tput setb 0 ; echo "0"
  # tput setb 1 ; echo "1"
  # tput setb 2 ; echo "2"
  # tput setb 3 ; echo "3"
  # tput setb 4 ; echo "4"
  # tput setb 5 ; echo "5"
  # tput setb 6 ; echo "6"
  # tput setb 7 ; echo "7"
  echo "8"
  echo "9"
  echo "10"
}
# test_tput
# 1
# On host_src (LOCA), run this command as the user that runs scp/ssh/rsync
# ssh-keygen -t rsa
# Copy the contents of id_rsa.pub to ~/.ssh/authorized_keys


# # ______________________________________________________________________________
# dump_rec(){
# # ______________________________________________________________________________
#   start "A.1 DUMP_REC START ."
#
#   echo $(echoyellow   "ENV")                $(rechoyellow   "REC/PROD")
#   echo $(echoyellow   "IP")                 $(rechoyellow   "${DB_IP_REC}")
#   echo $(echoyellow   "DB")                 $(rechoyellow   "${DB_REC}")
#   echo $(echoyellow   "DB_USER")            $(rechoyellow   "${DB_USER_REC}")
#   echo $(echoblue     "LOCAL_DUMP_FILE")    $(rechoblue     "${LOCAL_DUMP_FILE_GZ_REC}")
#
#   loading "A.1" "5_min"
#
#   if ! pg_dump -p ${DB_PORT} -h ${DB_IP_REC} -U ${DB_USER_REC} -O ${DB_REC} | gzip > ${LOCAL_DUMP_FILE_GZ_REC}.in_progress; then
#     echo $(echored    "${DB_REC} [KO] [KO] .") 1>&2           # echo $(echored    "[KO] Failed to backup database schema of $DB_REC") 1>&2
#   else
#     mv ${LOCAL_DUMP_FILE_GZ_REC}.in_progress ${LOCAL_DUMP_FILE_GZ_REC}
#     echo $(echogreen  "${DB_REC} [OK] [OK] .")                # echo $(echogreen  "[OK] Success to backup database schema of $DB_REC")
#   fi
#
#   end "A.1 DUMP_REC END ."
# }
