#!/bin/sh

################################################################################################################################
# Script de sauvegarde et de compression d'une base PostgreSQL locale.
#
# ATTENTION : ce script de sauvegarde ne fonctionne que sur le serveur PostgreSQL lui-même : on suppose qu'il existe
# un utilisateur "postgres" qui dispose du droit d'effectuer un dump sans avoir à fournir de mot de passe.
################################################################################################################################

# Paramètres
############

# Répertoire de sauvegarde.
BACKUP_DIR=$1
# Base de données à sauvegarder.
PGDATABASE=$2

if [ "$#" -ne 2 ]
then
  echo >&2 "Le programme attend 2 arguments: dossier de sauvegarde et nom de la base."
  exit 1
fi

# Exécution
###########

DATE=$(date +"%Y-%m-%d_%H-%M-%S")

SAVE_FILE=${BACKUP_DIR}/${PGDATABASE}_${DATE}.sql.gz

echo "Sauvegarde de la base de données"

# La commande gzip est plus efficace en temps que l'option '-Z 6' de pg_dump
# La redirection vers le fichier de sauvegarde peut être effectuée en dehors de la commande "su",
# afin d'écrire dans un répertoire n'appartenant pas nécessairement à l'utilisateur postgres.
su - postgres -c "pg_dump -O ${PGDATABASE} |gzip > ${SAVE_FILE}"

if [ $? -ne 0 ]; then
  echo >&2 "Echec de la sauvegarde de la base"
  exit 1
fi
