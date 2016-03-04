#!/bin/sh

################################################################################################################################
# Script de purge des anciens fichiers de sauvegarde.
#
# On suppose que les fichiers à purger ont un pattern, et qu'ils sont triés par ordre lexicographique, du plus ancien
# au plus récent (ce qui est le cas quand le nommage des fichiers contient la date au format "yyyyMMdd" ou équivalent).
#
# ATTENTION : en fonction de la manière dont les fichiers sont nommés, l'ordre de tri peut être inversé entre les nouveaux
# et les anciens.
################################################################################################################################

# Paramètres
############

# Répertoire dans lequel les fichiers doivent être purgés.
PURGE_DIR=$1
# Pattern des fichiers à purger.
PATTERN=$2
# Nombre de fichiers à conserver.
KEEP_NB=$3

if [ "$#" -ne 3 ]
then
  echo >&2 "Le programme attend 3 arguments: dossier, pattern, et nombre de fichiers à conserver."
  exit 1
fi

if [ -z "$PURGE_DIR" ] || [ "$PURGE_DIR" = "/" ]
then
  echo >&2 "Le répertoire de purge ne peut être vide ou la racine"
  exit 1
fi

# Exécution
###########
echo "${KEEP_NB} fichiers de ${PURGE_DIR}/${PATTERN} sont conservés"

sleep 3

KEEP_NB=$(( ${KEEP_NB} + 1 ))

if [ -d ${PURGE_DIR} ]
then
  FILES_TO_PURGE=$(ls ${PURGE_DIR}/${PATTERN} |sort -r |tail -n +${KEEP_NB})
  for FILE_TO_PURGE in ${FILES_TO_PURGE}
  do
    rm -f ${FILE_TO_PURGE}
    echo "${FILE_TO_PURGE} supprimé"
  done
else
  echo >&2 "Le répertoire ${PURGE_DIR} n'existe pas."
  exit 1
fi
