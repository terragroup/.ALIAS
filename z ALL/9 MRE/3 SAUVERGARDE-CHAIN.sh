################################################################################################################################
# Configuration de la sauvegarde de la base
################################################################################################################################
DB_DATABASE="example"
# DB_USERNAME="admin"
# DB_PASSWORD="admin"
LOCAL_BACKUP_DIR="/var/lib/pgsql/9.2/backups"
DIST_BACKUP_DIR="/mnt/APPS/backup"
##########################################
BACKUP_DIR=${LOCAL_BACKUP_DIR}              # Répertoire de sauvegarde.
PGDATABASE=${DB_DATABASE}                   # Base de données à sauvegarder.
DATE=$(date +"%Y-%m-%d_%H-%M-%S")
SAVE_FILE=${BACKUP_DIR}/${PGDATABASE}_${DATE}.sql.gz
##########################################
PURGE_DIR=${LOCAL_BACKUP_DIR}               # Répertoire dans lequel les fichiers doivent être purgés.
PATTERN=${DB_DATABASE}\*                    # Pattern des fichiers à purger.
KEEP_NB=${LOCAL_KEEP_NB}                    # Nombre de fichiers à conserver.
##########################################
LOCAL_KEEP_NB=10
DIST_KEEP_NB=20


################################################################################################################################
# STEP 1 - mre_pgdump.sh ${LOCAL_BACKUP_DIR} ${DB_DATABASE}
################################################################################################################################
# 2 Script de sauvegarde et de compression d'une base PostgreSQL locale.
# ATTENTION : ce script de sauvegarde ne fonctionne que sur le serveur PostgreSQL lui-même : on suppose qu'il existe
# un utilisateur "postgres" qui dispose du droit d'effectuer un dump sans avoir à fournir de mot de passe.
################################################################################################################################

echo "Sauvegarde de la base de données"


# //////////////// comment se connecter a distance pour exec le script  ? //////////////////


# La commande gzip est plus efficace en temps que l'option '-Z 6' de pg_dump
# La redirection vers le fichier de sauvegarde peut être effectuée en dehors de la commande "su",
# afin d'écrire dans un répertoire n'appartenant pas nécessairement à l'utilisateur postgres.
su - postgres -c "pg_dump -O ${PGDATABASE} |gzip > ${SAVE_FILE}"

if [ $? -ne 0 ]; then
  echo >&2 "Echec de la sauvegarde de la base"
  exit 1
fi



################################################################################################################################
# STEP 2 - mre_purge_lexico.sh ${LOCAL_BACKUP_DIR} ${DB_DATABASE}\* ${LOCAL_KEEP_NB}
################################################################################################################################
# 2 Script de purge des anciens fichiers de sauvegarde.
#
# On suppose que les fichiers à purger ont un pattern, et qu'ils sont triés par ordre lexicographique, du plus ancien
# au plus récent (ce qui est le cas quand le nommage des fichiers contient la date au format "yyyyMMdd" ou équivalent).
#
# ATTENTION : en fonction de la manière dont les fichiers sont nommés, l'ordre de tri peut être inversé entre les nouveaux
# et les anciens.
################################################################################################################################

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


################################################################################################################################
# STEP 3
################################################################################################################################
if [ -d ${DIST_BACKUP_DIR} ]
then
  rsync -av ${LOCAL_BACKUP_DIR}/${DB_DATABASE}* ${DIST_BACKUP_DIR}
  mre_purge_lexico.sh ${DIST_BACKUP_DIR} ${DB_DATABASE}\* ${DIST_KEEP_NB}
fi


################################################################################################################################
# bonus EXEMPLE
################################################################################################################################
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
