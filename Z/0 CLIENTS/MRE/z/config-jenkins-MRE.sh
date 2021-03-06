#-------------------------------------------------------------------------------
# jenkins
#-------------------------------------------------------------------------------
//axel: faire en local plutot que jenkins pour deploy ?

#-------------------------------------------------------------------------------
# BUILD
#-------------------------------------------------------------------------------
Executing Maven:  -B -f /var/lib/jenkins/workspace/atnv2-release/pom.xml -s /var/lib/jenkins/.m2/settings-atnv2.xml clean verify -PAtnv2-TU

#-------------------------------------------------------------------------------
# RELEASE
#-------------------------------------------------------------------------------
# Récupération du tag à déployer.
git checkout refs/tags/${VERSION}
# Mise à jour de la version pour la production
mvn versions:set -DnewVersion=${VERSION}-PROD
clean deploy -DskipTests=true -Psimba2_release_production

#-------------------------------------------------------------------------------
# DEPLOY
#-------------------------------------------------------------------------------
# Récupération du tag à déployer.
git checkout refs/tags/${VERSION}
# Utilisation de la version de production
mvn versions:set -DnewVersion=${VERSION}-PROD
# Application des évolutions de la base de données.
cd liquibase
mvn clean compile --settings ${HOME}/.m2/settings-simba2.xml -P ${ENVIRONNEMENT},apply-db-migration -DskipTests=true

#-------------------------------------------------------------------------------
# Déploiement du backend
cd backend
mvn org.apache.maven.plugins:maven-antrun-plugin:run --settings ${HOME}/.m2/settings-simba2.xml -P ${ENVIRONNEMENT}

# Déploiement du frontend
cd ../frontend
mvn org.apache.maven.plugins:maven-antrun-plugin:run --settings ${HOME}/.m2/settings-simba2.xml -P ${ENVIRONNEMENT}
#-------------------------------------------------------------------------------
