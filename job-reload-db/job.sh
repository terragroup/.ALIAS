#!/bin/bash
#
# voir tout en mode debug
# set -o verbose
#
# ##############################################################################
# OBJECTIF
# - RE-CHARGEMENT - dump + reload
# - ATOMIQUE      - 0 ou 1
# ##############################################################################
#
source ./rainbow.sh
# source ./progressbar.sh
#
# ctx : UTIL + TOOL
#
# ______________________________________________________________________________
remote_connect(){
# ______________________________________________________________________________
   psql -d ${DB_PROD} -U ${DB_USER_PROD} -h ${DB_IP_PROD}
}
# ______________________________________________________________________________
main_start(){
# ______________________________________________________________________________
  echo -e ".\n.\n.\n.\n"
  echo $(rechocyan "\n . . .")
  echo $(rechocyan "START . . .")
  echo -e ".\n"
}
# ______________________________________________________________________________
main_end(){
# ______________________________________________________________________________
  echo -e ".\n"
  echo $(rechocyan "END . . .")
  echo $(rechocyan "\n . . .")
  echo -e ".\n.\n.\n.\n"
}
# ______________________________________________________________________________
start(){
# ______________________________________________________________________________
  echo -e ".\n"
  echo $(rechopurple  "$1")
}
# ______________________________________________________________________________
end(){
# ______________________________________________________________________________
  echo $(rechopurple  "$1")
  echo -e ".\n"
}
# ______________________________________________________________________________
loading(){
# ______________________________________________________________________________
  echo $(rechogreen   "$1 LOADING $2 .")
  echo $(rechogreen   "$3 .")
  # progress 100
  # progress 20 "Phase 1      "
  # progress 40 "Phase 2      "
  # progress 60 "Processing..."
  # progress 80 "Processing..."
  # progress 90 "Processing..."
  # progress 100 "Done        "
}
# TODO - a finir
# # ______________________________________________________________________________
# success_param(){
# # ______________________________________________________________________________
#   if [ $? -ne $1 ]; then
#     echo >&2 "Pas le bon nombre d'arguments"
#     exit 1
#   fi
# }
# ______________________________________________________________________________
param_main(){
# ______________________________________________________________________________
  if [ "$#" -ne 0 ]
  then
    echo >&2 "Le programme attend 0 arguments: x, x, x, x"
    exit 1
  fi
}
# ______________________________________________________________________________
success(){
# ______________________________________________________________________________
  echo $(echogreen  ". [OK] [OK] .")
}
# ______________________________________________________________________________
fail(){
# ______________________________________________________________________________
  echo $(echored    ". [KO] [KO] .") 1>&2
  exit 1
}


#
# ctx : GLOBAL
#
DATE=$(date +"%Y-%m-%d_%H-%M-%S")

SSH_USER="postgres"
SSH_USER_ROOT="root"
#
DB_IP_REC="10.196.165.17"
DB_IP_PROD="10.196.164.46"
#
DB_PORT="5432"
#
DB_REC="atnv2_preprod"
DB_PROD="atnv2_production"
#
DB_USER_REC="atnv2_preprod"
DB_USER_PROD="atnv2_prod"
#
LOCAL_DUMP_DIR="./tmp"
DUMP_FILE_REC=${DB_REC}_${DATE}.sql
DUMP_FILE_GZ_REC=${DUMP_FILE_REC}.gz
#
# DUMP_FILE_PROD=${DB_PROD}_${DATE}.sql
DUMP_FILE_PROD="atnv2_production_2016-07-08_15-09-41.sql"
DUMP_FILE_GZ_PROD=${DUMP_FILE_PROD}.gz
#
DIST_BACKUP_DUMP_DIR_REC="/var/lib/pgsql/9.4/backups"      # REC
DIST_BACKUP_DIR_PROD="/var/lib/pgsql/backups"         # PROD
#
RELOAD_LOCAL_DUMP_FILE_FROM_PROD_TO_REC=${LOCAL_DUMP_DIR}/${DUMP_FILE_REC}
RELOAD_DIST_DUMP_FILE_FROM_PROD_TO_REC=${DIST_BACKUP_DUMP_DIR_REC}/${DUMP_FILE_REC}

# c le fichier dumped, en gz, en local
RELOAD_LOCAL_DUMP_FILE_GZ_FROM_PROD_TO_REC=${LOCAL_DUMP_DIR}/${DUMP_FILE_GZ_PROD}
# RELOAD_DIST_DUMP_FILE_GZ_FROM_PROD_TO_REC=${DIST_BACKUP_DUMP_DIR_REC}/${DUMP_FILE_GZ_REC}


#
# NAS_BACKUP_DIR="/mnt/ARCHIVES/APPS/ArchivageMV/1_MEDICIS/6_Dump_Chargement/${MEDICIS_DB_DEST}/"
# NAS_BACKUP_DIR="/mnt/apps/BackupMV/2_datas/9_ATNV2/POSTGRESQL/"

LEVEL=0

#
# ctx : DUMP
#
# . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . .
# TODO - le mdp est de connexion a PG_DB est dans .pgpass (pour ne pas avoir a mettre le pwd)
# . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . .
# ______________________________________________________________________________
dump_prod(){
# ______________________________________________________________________________
  start "A.1 DUMP_PROD START ."

  echo $(echoyellow   "ENV")                $(rechoyellow   "PROD")
  echo $(echoyellow   "IP")                 $(rechoyellow   "${DB_IP_PROD}")
  echo $(echoyellow   "DB")                 $(rechoyellow   "${DB_PROD}")
  echo $(echoyellow   "DB_USER")            $(rechoyellow   "${DB_USER_PROD}")
  echo $(echoblue     "LOCAL_DUMP_FILE")    $(rechoblue     "${RELOAD_LOCAL_DUMP_FILE_GZ_FROM_PROD_TO_REC}")

  loading "A.1" "10_min" "pg_dump -p ${DB_PORT} -h ${DB_IP_PROD} -U ${DB_USER_PROD} -O ${DB_PROD} | gzip > ${RELOAD_LOCAL_DUMP_FILE_GZ_FROM_PROD_TO_REC}.in_progress"

  # if ! pg_dump -Fp -s
  if pg_dump -p ${DB_PORT} -h ${DB_IP_PROD} -U ${DB_USER_PROD} -O ${DB_PROD} | gzip > ${RELOAD_LOCAL_DUMP_FILE_GZ_FROM_PROD_TO_REC}.in_progress; then
    mv ${RELOAD_LOCAL_DUMP_FILE_GZ_FROM_PROD_TO_REC}.in_progress ${RELOAD_LOCAL_DUMP_FILE_GZ_FROM_PROD_TO_REC}
    success                      # echo $(echogreen  "[OK] Success to backup database schema of ")
  else
    fail                         # echo $(echored    "[KO] Failed to backup database schema of $DB_PROD") 1>&2
  fi

  end "A.1 DUMP_PROD END ."
}

#
# ctx : COPIE
# . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . .
# TODO - il faut creer la connexion ssh pour que les 2 host communiquent (authorized_key)
# . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . .
#
# ______________________________________________________________________________
modify_dump(){
# ______________________________________________________________________________

  start 'A.2 MODIFY START .'

  gzip -d ${RELOAD_LOCAL_DUMP_FILE_GZ_FROM_PROD_TO_REC}

  # 1 - remplacer le nom "atnv2_prod" par atnv2_preprod
  # 3_min
  sed -i.bak -e 's/atnv2_prod/atnv2_preprod/g' ${RELOAD_LOCAL_DUMP_FILE_FROM_PROD_TO_REC}

  # 2 - supprimer les 'refresh des vues materialisees' [car cela peut prendre 1h de  durant la restauration] :
  # 3_min
  sed -i '/REFRESH MATERIALIZED VIEW/d' ${RELOAD_LOCAL_DUMP_FILE_FROM_PROD_TO_REC}

  gzip -d ${RELOAD_LOCAL_DUMP_FILE_FROM_PROD_TO_REC}

  end 'A.2 COPY END .'
}
# ______________________________________________________________________________
scp_from_local_to_rec(){
# ______________________________________________________________________________
# src = LOCAL
# dst = REMOTE
# ______________________________________________________________________________
  start 'A.3 COPY START .'

  echo $(echoyellow   "DB_IP_REC")          $(rechoyellow   "${DB_IP_REC}")
  echo $(echoblue     "SSH_USER")           $(rechoblue     "${SSH_USER}")
  echo $(echoblue     "SRC")                $(rechoblue     "${RELOAD_LOCAL_DUMP_FILE_GZ_FROM_PROD_TO_REC}")
  echo $(echoblue     "DST")                $(rechoblue     "${RELOAD_DIST_DUMP_FILE_GZ_FROM_PROD_TO_REC}")

  loading "A.2" "?_min" "scp ${RELOAD_LOCAL_DUMP_FILE_GZ_FROM_PROD_TO_REC} ${SSH_USER_ROOT}@${DB_IP_REC}:${RELOAD_LOCAL_DUMP_FILE_GZ_FROM_PROD_TO_REC}"

  if scp ${RELOAD_LOCAL_DUMP_FILE_GZ_FROM_PROD_TO_REC} ${SSH_USER_ROOT}@${DB_IP_REC}:${RELOAD_LOCAL_DUMP_FILE_GZ_FROM_PROD_TO_REC}; then
    success
  else
    fail
  fi

  end 'A.3 COPY END .'
}



# ctx : RESTORE
# . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . .
#
# . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . .
# ______________________________________________________________________________
reload_from_prod_to_rec(){
# ______________________________________________________________________________
  start 'A.4 RESTORE_REC START .'

  echo $(echoyellow   "ENV")                $(rechoyellow   "REC")
  echo $(echoyellow   "IP")                 $(rechoyellow   "${DB_IP_REC}")
  echo $(echoyellow   "DB")                 $(rechoyellow   "${DB_REC}")
  echo $(echoyellow   "DB_USER")            $(rechoyellow   "${DB_USER_REC}")
  echo $(echoblue     "DIST_DUMP_FILE")     $(rechoblue     "${RELOAD_LOCAL_DUMP_FILE_GZ_FROM_PROD_TO_REC}")

  # psql -U atnv2_preprod atnv2_preprod  < <(zcat XXXXX.sql.gz)
  if psql -p ${DB_PORT} -h ${DB_IP_REC} -U ${DB_USER_REC} ${DB_REC}  < ${RELOAD_LOCAL_DUMP_FILE_GZ_FROM_PROD_TO_REC}; then
    success
  else
    fail
  fi

  end 'A.4 RESTORE_REC END .'

  # ----------------------------------------------------------------------------
  # PASSER LE SCRIPT D ANONYMISATION !!!
  # REPERTOIRE DU SCRIPT : /mnt/groups/INFO/MDV/00_EXPLOITATION/4_ATN_v2/1_Interventions sur les environnements/Script anonymisation
  # psql -f thefile.sql targetdatabase
  # psql -f /mnt/groups/INFO/MDV/00_EXPLOITATION/4_ATN_v2/1_Interventions\ sur\ les\ environnements/Script anonymisation/Script\ anonymisation\ ATN\ v2\ pré-prod\ .txt atnv2_preprod
  # psql -f anonymisation.sql atnv2_preprod
}


#
# MAIN
# ------------------------------------------------------------------------------
# ------------------------------------------------------------------------------
# ------------------------------------------------------------------------------
main_start
param_main
# ------------------------------------------------------------------------------


# dump_rec
# dump_prod

# scp_from_local_to_rec

# modify_dump

reload_from_prod_to_rec

# ------------------------------------------------------------------------------
main_end
# ------------------------------------------------------------------------------
# ------------------------------------------------------------------------------
# ------------------------------------------------------------------------------





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
