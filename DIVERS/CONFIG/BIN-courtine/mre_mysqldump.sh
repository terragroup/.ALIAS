#!/bin/sh

################################################################################################################################
# Script de sauvegarde et de compression d'une base de données MySQL locale.
#
# Exemple : /var/mysql/backup mre_mysqldump.sh nom_base nom_utilisateur mdp_utilisateur
################################################################################################################################

# Paramètres
############

# Répertoire de sauvegarde local.
BACKUP_DIR=$1
# Nom de la base de données à sauvegarder.
DB_NAME=$2
# Nom de l'utilisateur pour la connexion à la base.
DB_USER=$3
# Mot de passe pour la connexion à la base.
DB_PASSWORD=$4

if [ "$#" -ne 4 ]
then
  echo >&2 "Le programme attend 4 arguments: dossier, de sauvegarde, nom de la base, utilisateur et mot de passe."
  exit 1
fi

# Exécution
###########

DATE=$(date +"%Y-%m-%d_%H-%M-%S")

SAVE_FILE=${BACKUP_DIR}/${DB_NAME}_${DATE}.sql.gz

echo "Sauvegarde de la base de données"

mysqldump -u ${DB_USER} -p${DB_PASSWORD} -R ${DB_NAME} |gzip > ${SAVE_FILE}

if [ $? -ne 0 ]; then
  echo >&2 "Echec de la sauvegarde de la base"
  exit 1
fi
