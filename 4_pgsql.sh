#!/bin/bash


# Restore: $ psql -U {user-name} -d {desintation_db}-f {dumpfilename.sql}
# Backup:  $ pg_dump -U {user-name} {source_db} -f {dumpfilename.sql}



# ******************************************************************************
# ******************************************************************************
# ******************************************************************************

################################################################################
# SCP
################################################################################
function encours(){
    # 1 se mettre sur la rec
    recbdd

    # 2 reccuperer le fichier (pwd innovation)
    # scp atnv2_production_2016-01-21_23-30-01.sql.gz $PROD_DB_DOMAIN:/var/lib/pgsql/backups/ > atnv2_production_2016-01-21_23-30-01.sql.gz .
    scp root@prodatnv2bdd.mre.pub:/var/lib/pgsql/backups/atnv2_production_2016-01-21_23-30-01.sql.gz > atnv2_production_2016-01-21_23-30-01.sql.gz .

    # 3 detar
    gunzip atnv2_production_2016-01-21_23-30-01.sql.gz

    # Créer une archive ( compresser ) :
    # tar cvzf archive.tar.gz dossieroufichier
    # Décompresser ( Dézipper ) une archive :
    # tar xvzf archive.tar.gz
    # Décompresser un .tar :
    # tar xvf archive.tar

    # gunzip (ca supprime l archive)

    # avoir la size human readable
    #  ls -lah
}

# ******************************************************************************
# ******************************************************************************
# ******************************************************************************

# connecter (tester)
# psql -d atn -U atn -h localhost

# ------------------------------------------------------------------------------
# tunnel en FAST-FORWARD : (il faut mettre les 2 )
# ------------------------------------------------------------------------------
function fast_forward(){
  # 1 - ouvrir le tunnel > (pwd: innovation)
  ssh -L 9000:localhost:5432  root@prodatnv2bdd.mre.pub
  # 2 - s y connecter > (pwd : atnv2_prod)
  psql -d atnv2_production -U atnv2_prod -p 9000 -h localhost
  # 3 - puis tu te connecte sur le 9000 avec DBEAVER
}


################################################################################
################################################################################
################################################################################
################################################################################
# BACKUP / DUMP / SAUVEGARDE (5 min)
################################################################################
################################################################################
################################################################################
# savegarde prod ATN a 2 endroits:
# - NAS (interne) :  /mnt/apps/BackupMV/2_datas/9_ATNV2/POSTGRESQL (cf. mail Charles)
# - Clurk (externe) :
# - local (interne): /var/lib/pgsql/backups/atnv2_production_2015-11-03_12-02-20.sql.gz
# ------------------------------------------------------------------------------


################################################################################
# 1/2 - DUMP (backup)
################################################################################
# ICI, simplement
# su - postgres -c "pFg_dump -O atnv2_production | gzip > /var/lib/pgsql/backups/atnv2_production_2016-06-28_18-04-00.sql.gz"
function dump_prod(){
  PGDATABASE='atnv2_production'
  BACKUP_DIR="/var/lib/pgsql/backups"
  DATE=$(date +"%Y-%m-%d_%H-%M-%S")
  SAVE_FILE=${BACKUP_DIR}/${PGDATABASE}_${DATE}.sql.gz  # ~/dump-atn-preprod-

  # SAVE_FILE=/var/lib/pgsql/backups/atnv2_production_2016-04-11_18-07-11.sql.gz

  echo 'su - postgres -c "pg_dump -O ${PGDATABASE} | gzip > ${SAVE_FILE}"'
  # GO
  su - postgres -c "pg_dump -O ${PGDATABASE} | gzip > ${SAVE_FILE}"

  # su - postgres -c "pg_dump -O atnv2_production | gzip > /var/lib/pgsql/backups/atnv2_production_2016-04-11_18-07-11.sql.gz"

  # ou NON ZIPPE
  # pg_dump –U user –W basededonnée > atnv2_production_2015-11-02_23-30-01.sql
}

#function dump_preprod(){
#  PGDATABASE='atnv2_preprod'  #
#  BACKUP_DIR="/var/lib/pgsql/backups"
#  DATE=$(date +"%Y-%m-%d_%H-%M-%S")
#  SAVE_FILE=${BACKUP_DIR}/dump-atn-preprod-${PGDATABASE}_${DATE}.sql.gz
#  echo 'su - postgres -c "pg_dump -O ${PGDATABASE} | gzip > ${SAVE_FILE}"'
#  su - postgres -c "pg_dump -O ${PGDATABASE} | gzip > ${SAVE_FILE}"
#}

# -O --no-owner
# Do not output commands to set ownership of objects to match the original database. By default, pg_dump issues ALTER OWNER or SET SESSION AUTHORIZATION statements to set ownership of created database objects. These statements will fail when the script is run unless it is started by a superuser (or the same user that owns all of the objects in the script). To make a script that can be restored by any user, but will give that user ownership of all the objects, specify -O.
# This option is only meaningful for the plain-text format. For the archive formats, you can specify the option when you call pg_restore.









################################################################################
# 2/2 - RESTORE (25 min sans refrsh view)
################################################################################

# ca drop les user, mais ca les restaures aussi
function restore_prod(){
  psql -c "DROP DATABASE atnv2_prodMuction";
  psql -c "CREATE DATABASE atnv2_production WITH owner atnv2_prod";
  psql -c "CREATE EXTENSION unaccent";
  psql -U atnv2_prod atnv2_production  < <(zcat /var/lib/pgsql/backups/atnv2_production_XXXXXXXXXXXXX.sql.gz)
}

# user/pwd : atnv2_preprod / atnv2_preprod
function restore_preprod(){
  # 1 - Commencer par : adapter_dump_pour_autre_bdd()
  su - postgres  # ()
  psql
  \c atnv2_preprod;
  # arreter toutes les sessions PGSQL
  # je commente car bug lorsque je source ce fichier
  # SELECT pg_terminate_backend( pid ) FROM pg_stat_activity WHERE pid <> pg_backend_pid( )  AND datname = current_database();
  CTRL+D
  psql -c "DROP DATABASE atnv2_preprod";
  psql
  CREATE DATABASE atnv2_preprod WITH owner atnv2_preprod;
  \c atnv2_preprod;
  CREATE EXTENSION unaccent;
  CTRL+D
  psql -U atnv2_preprod atnv2_preprod  < atnv2_production_2015-11-02_23-30-01.sql
  # ----------------------------------------------------------------------------
  # PASSER LE SCRIPT D ANONYMISATION !!!
  # REPERTOIRE DU SCRIPT : /mnt/groups/INFO/MDV/00_EXPLOITATION/4_ATN_v2/1_Interventions sur les environnements/Script anonymisation
  # psql -f thefile.sql targetdatabase
  # psql -f /mnt/groups/INFO/MDV/00_EXPLOITATION/4_ATN_v2/1_Interventions\ sur\ les\ environnements/Script anonymisation/Script\ anonymisation\ ATN\ v2\ pré-prod\ .txt atnv2_preprod
  psql -f anonymisation.sql atnv2_preprod

  # ----------------------------------------------------------------------------
}

# db/login/pwd : atn/atn/atn
function restore_local(){
    # 1 - Commencer par : adapter_dump_pour_autre_bdd()
    su - postgres
    psql
    DROP DATABASE atnv2_preprod;
    CREATE DATABASE atn WITH owner atn;
    \c atn;
    CREATE EXTENSION unaccent;
    CTRL+D
    # LOCAL : attention oblige mettte  -h
    psql -h localhost -U atn  < /home/axel/EN_COURS/BACKUP-BDD-PROD/atnv2_production_XXXXXXX
    # --------------------------------------------------------------------------
    # PASSER LE SCRIPT D ANONYMISATION !!!
    # REPERTOIRE DU SCRIPT : /mnt/groups/INFO/MDV/00_EXPLOITATION/4_ATN_v2/1_Interventions sur les environnements/Script anonymisation
    psql -f /home/axel/alias/X-anonym-atn-rec.sql atn
    # --------------------------------------------------------------------------
}

# ----------------------------------------------------------------------------
# APRES le DUMP, il faut faire des changements : Attention : il faut remplcer le nom "atnv2_prod" par XXX
# ----------------------------------------------------------------------------
function adapter_dump_pour_autre_bdd(){
  echo "todo"
  # 1 - replacer les valeurs des NOMS DE BASES DE DONNEES:
  # (pre-prod)
  # sed -i.bak -e 's/atnv2_prod/atnv2_preprod/g' XXX.sql
  #
  # (local)
  # sed -i.bak -e 's/atnv2_prod/atn/g' XXX.sql

  # 2 - supprimer le REFRESH des view car trop long, et renome un .bak :
  # sed -i '/REFRESH MATERIALIZED VIEW/d' XXX.sql

  # 3 - verif
  # cl xxx.sql
}

################################################################################
# AUTRES
################################################################################
function connect(){
  sudo su - postgres   # sudo -u postgres -i (recommended)
}

function remoteConnect(){
  # REC_DB_DOMAIN="10.196.165.17"
  psql -d atnv2_preprod -U bo_alim -h 10.196.165.17

  # psql -d atnv2_production -U atnv2_prod -h 10.196.164.46
}

function manage_role(){
  CREATE ROLE bo_alim;
  GRANT CONNECT ON DATABASE atnv2_production TO qlk;
  GRANT USAGE ON SCHEMA public TO qlk;
  GRANT SELECT ON ALL TABLES IN SCHEMA public TO qlk;
  GRANT SELECT ON ALL SEQUENCES IN SCHEMA public TO qlk;
}
