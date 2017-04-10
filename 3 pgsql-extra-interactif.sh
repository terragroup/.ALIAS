#!/bin/bash

# ------------------------------------------------------------------------------
# PSQL TIP
# ------------------------------------------------------------------------------
# \l       :   liste les DATABASE
# \l+      :   list all USERS that can access the database
# \du      :   liste les USERS (ROLE)

# \d+ TABLE : proprietes de la table

# \c atn   :   CONNECT a la database

# \dn+     :   lists SCHEMA permissions

# \dt      :   show all TABLE
# \dp      :   lists TABLE/view permissions

# \q       :   quit

# EXECUTER UNE COMMANDE                   : psql -c "command"

# TODO - donner le user axel pour qu'il ait le droit d'executer sur la db
alias gobd='su postgres && psql -f /home/axel/alias/PGSQL/JDD.sql atn'

# ----------------------------------------------------------------------------
# RESTORE 1
# ----------------------------------------------------------------------------
# SUPER = deconnect all users sauf moi (attention, il faut se connect a la base avant : \c )
psql -c "SELECT pg_terminate_backend( pid ) FROM pg_stat_activity WHERE pid <> pg_backend_pid( )     AND datname = current_database( )";
psql -c "DROP DATABASE atnv2_preprod";
psql -c "CREATE DATABASE atnv2_preprod WITH owner atnv2_preprod";
psql -c "CREATE EXTENSION unaccent";
# creer ces users (ou role)
# CREATE ROLE qlk;           # bo_alim
psql -U atnv2_preprod atnv2_preprod  < <(zcat XXXXX.sql.gz)                     # psql -U atnv2_preprod atnv2_preprod  < atnv2_production_2015-11-02_23-30-01.sql

# 3 (divers) - 1 GO : split -b 1000000k -d -a 4 atnv2_production_2015-11-02_23-30-01.sql  foo.

# USELESS ci dessous
# sed -i.bak -e 's/atnv2_prod/atn/g' /home/axel/EN_COURS/z-last_backup_bdd_prod/atnv2_production_2015-11-02_23-30-01.sql
# ack-grep --print0 -irl 'atnv2_prod' /home/axel/EN_COURS/z-last_backup_bdd_prod/atnv2_production_2015-11-02_23-30-01.sql
# ack-grep --print0 -irl 'atnv2_prod' /home/axel/EN_COURS/z-last_backup_bdd_prod/atnv2_production_2015-11-02_23-30-01.sql | xargs -0 -L1 sed  -i 's/atnv2_prod/atn/g'
# ack-grep --print0 -irl 'atnv2_prod' | xargs -0 -L1 sed  -i 's/atnv2_prod/atn/g'

################################################################################
# script anonymisation
################################################################################
# -- REPERTOIRE DU SCRIPT : /mnt/groups/INFO/MDV/00_EXPLOITATION/4_ATN_v2/1_Interventions sur les environnements/Script anonymisation

# -- CHANGER A LA MAIN : copy.usb.xml.path -> /home/axel/LOCAL/LOCAL-USB

################################################################################
# POSTGRES : status : # sudo service postgresql status  OR  # sudo /etc/rc.d/init.d/postgresql start #(If the database has not already been initialized with initdb, this will be performed by the script)
# SQL      : status : # sudo service mysql status       OR  # sudo /etc/init.d/mysql status
################################################################################

# ------------------------------------------------------------------------------
# 2.2.32 - PB VUES, supprimer cela
# ------------------------------------------------------------------------------
drop view view_compte_rendu_diffusion_crd;
drop table view_analyse_fait_diffusion_afd CASCADE;   (view_analyse_fait_diffusion_complexe_afc)

# ------------------------------------------------------------------------------
# HBA
# ------------------------------------------------------------------------------
# 2 - /pg_data/pg_hba.conf
# add Read only (mask : /23)   /Write et Read (mask: /32)
#
# 1 - POUR PRENDRE EN COMPTE HBA sans redemarrer le server
function reloadConfWithoutRestartServer(){
  su - postgres
  psql
  SELECT pg_reload_conf();
  # done
}

################################################################################
# PSQL - notions
################################################################################
CREATE TABLE data(a int4, b int4);
INSERT INTO data VALUES(12, 23);
CREATE VIEW view_data AS SELECT a*2 AS c, b*2 AS d FROM data;
# ------------------------------------------------------------------------------
# STEP 1
CREATE USER bo_alim WITH PASSWORD 'b0';
CREATE USER qlk WITH PASSWORD 'qlk01';

# STEP 2
GRANT CONNECT ON DATABASE atnv2_production TO bo_alim;
GRANT SELECT ON ALL TABLES IN SCHEMA public TO bo_alim;

# limit 100 # fetch les  100 premiers
SELECT * from ANNONCEUR_ANN limit 1;
INSERT INTO ANNONCEUR_ANN (ann_id,ann_libelle) VALUES (666666666,'AXEL');

CREATE USER bo_alim PASSWORD 'b0'
CREATE DATABASE atn WITH owner atn

# ------------------------------------------------------------------------------
# ++ LIKE ++ >> SEARCH : dans tout le schema, voir les colonnes (proprietes) qui ont un nom du type 'XXX'
# ------------------------------------------------------------------------------
SELECT table_name, column_name FROM information_schema.columns
WHERE table_schema = 'public'
AND table_catalog='atn'
AND column_name like '%gate%';
--AND table_name   = 'dcp_id';

# ------------------------------------------------------------------------------
# POSTGRES : SEARCH : trouver toutes les tables qui referencent une colonne
# ------------------------------------------------------------------------------
select (select r.relname from pg_class r where r.oid = c.conrelid) as table,
(select array_agg(attname) from pg_attribute where attrelid = c.conrelid and ARRAY[attnum] <@ c.conkey) as col,
(select r.relname from pg_class r where r.oid = c.confrelid) as ftable
from pg_constraint c
where c.confrelid = (select oid from pg_class where relname = 'dcp_dcp')
and c.confkey @> (select array_agg(attnum) from pg_attribute where attname = 'dcp_id' and attrelid = c.confrelid);

# ------------------------------------------------------------------------------
# SEARCH : dans tout le schema, donne moi toute les valeurs qui contiennent
# ------------------------------------------------------------------------------
# todooooooooooooooooooooooo

# ------------------------------------------------------------------------------
# autre
# ------------------------------------------------------------------------------
# changer de version de postgres et desinstaller l ancienne
dpkg -l | grep postgres  &&  # sudo apt-get --purge remove xxx
#
#
# Pour supprimer une base de données : dropdb base (dropdb 'atn_01')
#
psql -c "CREATE EXTENSION unaccent" atn
pg_database_scripts:
 - "CREATE EXTENSION IF NOT EXISTS unaccent;"
 - "CREATE EXTENSION IF NOT EXISTS tablefunc;"
 - "CREATE EXTENSION IF NOT EXISTS fuzzystrmatch;"

###############################################################################
# OTHER POSTGRES
###############################################################################
# -- SEARCH : donne moi tous les schemas
select schema_name from information_schema.schemata;

# -- size database
SELECT pg_database_size(current_database());

# -- size table
select pg_relation_size('variableconfig_con');

# -- who is connected to database
SELECT datname,usename,client_addr,client_port FROM pg_stat_activity;

# -- know if user is connected to database
SELECT datname FROM pg_stat_activity WHERE usename = 'devuser'
SELECT * FROM pg_catalog.pg_views;            # Renvoie la liste des vues.
SELECT * FROM pg_catalog.pg_matviews;         # Renvoie la liste des vues matérialisées.

################################################################################
# A TRIER
################################################################################
# TOOL : DBEAVER et pgadmin3  et  mysql_workbench
# ssh cvuillecard@10.196.165.31 # ssh axel@10.196.165.121
# http://bash.cyberciti.biz/guide/Setting_shell_options#How_do_I_setup_environment_variables.3F
# http://bash.cyberciti.biz/guide/Main_Page

# ------------------------------------------------------------------------------
# CONF
# ------------------------------------------------------------------------------
# /usr/pgsql-9.4
# /var/log/pgsql/9.4  (ok prod ET ko rec)

# /usr/pgsql-9.4/bin/postgres "-D" "/var/lib/pgsql/9.4/data"

# POSTGRES : conf du port d ecoute : LOCAL
# /etc/postgresql/9.4/main/postgresql.conf

# ------------------------------------------------------------------------------
# LOG
# ------------------------------------------------------------------------------
sudo gedit /var/log/mysql/error.log &

# ALTER ROLE bo_alim LOGIN;

# CHANGER LE PWD
# ALTER role bo_alim with password 'b0';

# rolename=xxxx -- privileges granted to a role
#         =xxxx -- privileges granted to PUBLIC

#             r -- SELECT ("read")
#             w -- UPDATE ("write")
#             a -- INSERT ("append")
#             d -- DELETE
#             D -- TRUNCATE
#             x -- REFERENCES
#             t -- TRIGGER
#             X -- EXECUTE
#             U -- USAGE
#             C -- CREATE
#             c -- CONNECT
#             T -- TEMPORARY
#       arwdDxt -- ALL PRIVILEGES (for tables, varies for other objects)
#             * -- grant option for preceding privilege

#         /yyyy -- role that granted this privilege

# INFO > CREATE USER is equivalent to CREATE ROLE except that CREATE USER gives the LOGIN permission to the user/role.
# savoir avec qui on est connecte         : SELECT SESSION_USER, CURRENT_USER;
# savoir si user a besoin d un password   : select * from pg_shadow;
# change de user sql  ROLE = USER         : set role 'bo_alim';
# Pour supprimer un utilisateur           : dropuser login

sudo apt-get install ack-grep

UPDATE databasechangeloglock SET locked='false';

sudo service postgresql restart

# psql -h mreatn01.mre.pub -p 5432 -U atn_01 -W atn_01 atn_01
# psql -h <host> -p <port> -U <username> -W <password> <database>

alias postgres='sudo su - postgres'

-- OK pour l integration
/etc/init.d/postgresql-9.4 restart

# ---------------------------------
# CHARLES RESTAURATION BACKUP
# ---------------------------------
# envoie la sauvegarde en distant
scp fdfdf.gw root@popo.fdfd /tmp

backup sur app/backupMV/... (medicis/data...)

drop DATABASE bdd
arrete server bdd

creer database
relance bdd
restaure

# rename table
ALTER TABLE complexe_cpx ALTER COLUMN cpx_codehost RENAME TO cpx_temp;
#
UPDATE complexe_cpx SET cpx_codehost = lpad(('' || cpx_temp), 5, '0');
#
ALTER TABLE complexe_cpx DROP COLUMN cpx_temp;
#

# ------------------------------------------------------------------------------
A - ajouter le pwd
# POUR QU IL SE CONNECTE AUTOMATIQUEMENT
# ------------------------------------------------------------------------------
A.1 - FICHIER : .pgpass
# hostname:port:database:username:password
10.196.165.17:5432:atnv2_preprod:atnv2_preprod:atnv2_preprod
