#le fichier est :





#-------------------------------------------------------------------------------
# TEST LIQUIBASE
#-------------------------------------------------------------------------------
LANCER LIQUIBASE  # AVEC PROFIL :   apply-db-migration     +       atnv2-local
                  # AVEC MVN : clean + install
LANCER TU
LANCE APP


# ------------------------------------------------------------------------------
# Profil lancer ATN
# ------------------------------------------------------------------------------
atnv2-LOCAL + gwt-dev + (localhost ?) + resources-dev

################################################################################
# VERIF FONCTIONNEL
################################################################################
# 1 - verif : WS ok = faire un getCataloque
# 2 - verif : le complexe est dispo ( Autre ref > list cpx > regarder ETAT RESEAU (doit etre disponible pour le cpx))
# 3 - verif : gestion des DCPS > liste des DCP > verifid en BASE booleen a TRUE pour CATALOGUE smart et globecast
# -----> je traduis les DCP doivent etre dans le catalogue smart et globecast (a faire tous les matins)


 #
 # transporteur actif  >> Mise à disposition sur clef USB
 #


 # // WIKI : TODO
 # - procedure de test des ftp
 # - procedure de test des WS
 # - procedure de test des fonctionnalites de base

 # ------------------------------------------------------------------------------
 # PROBLEMES ATN A CORRIGER
 # ------------------------------------------------------------------------------
 # PB : Le DCP 2360 n'est pas valide.Le DCP 2360 n'est pas valide.
 # SOL : Il faut que tu mettes le complexe sur les 2 transporteurs


 # ------------------------------------------------------------------------------
 # ALL SETTINGS
 # ------------------------------------------------------------------------------
 # [DEBUG] Reading global settings from /var/lib/jenkins/tools/hudson.tasks.Maven_MavenInstallation/3.0.4/conf/settings.xml
 # [DEBUG] Reading user settings from /var/lib/jenkins/.m2/settings-atnv2.xml
 # [DEBUG] Using local repository at /var/lib/jenkins/.m2/repository
 # [DEBUG] Using manager EnhancedLocalRepositoryManager with priority 10 for /var/lib/jenkins/.m2/repository
 # ------------------------------------------------------------------------------


 # Echec du rapatriement du fichier de log. Passage au fichier suivant


 # ------------------------------------------------------------------------------
 # CAS A DEBUG
 # ------------------------------------------------------------------------------
 # SI TU AS UN PROBLEME SUR LE FTP, voila il arrive pas a se connecter a cause PWD
 # 2015-12-10 15:55:25,300 -import_QuartzSchedulerThread - ERROR - [] - c.g.a.m.u.ClientFtp - 252 - Le router smartjog ne peut pas s'identifier au client FTP. L'upload n'a pu avoir lieu2015-12-10 15:55:25,300 -import_QuartzSchedulerThread - ERROR - [] - c.g.a.m.u.ClientFtp - 252 - Le router smartjog ne peut pas s'identifier au client FTP. L'upload n'a pu avoir lieu
 # ------------------------------------------------------------------------------

/home/axel/com/medicis/imdv-intranet/src/main/webapp/WEB-INF/hibernate.cfg.xml

#-------------------------------------------------------------------------------

######################################################################

# GIT MRE EXCLUDED FILES
######################################################################

# A IGNORER (dans global ?)
modifié:         imdv-intranet/src/main/webapp/META-INF/context.xml
modifié:         imdv-intranet/src/main/webapp/WEB-INF/classes/application.properties
modifié:         imdv-intranet/src/main/webapp/WEB-INF/classes/log4j.properties
modifié:         imdv-intranet/src/main/webapp/welcome.html



# FONCTIONNEMENT COMMIT
- tu commits avec FIXES (ca fera passer le status a RESOLU)
- puis tu click sur le SHA et tu vas dans le depot (ca met un peu de temps a rafraichir et c est OK)

#----------------------------
# Besoin de supprimer des commits
#----------------------------
git rebase -i HEAD~4        # il va te proposer d editer un fichier et tu vas pouvoir supprimer les lignes que tu souhaites supprimer
git push -f origin hotfixes # il te faudra le -f

#----------------------------
#
#----------------------------
git fetch --tag
git tag IMDV-2.19.18

#
wget http://redmine.mre.pub/projects/medicis-recap/repository

#
git://gitorious.mre.pub/medicis/medicis.git
1bb372fe3049332e88d1ac62561532764f76294d
echo 1bb372fe3049332e88d1ac62561532764f76294d >> .git/refs/heads/hotfixes


#!/bin/bash

#-------------------------------------------------------------------------------
# - RECETTE OK ?
#-------------------------------------------------------------------------------

#-------------------------------------------------------------------------------

################################################################################
# ERROR INSTABLE JENKINS
################################################################################
# si instable, il faut rechercher cela
# [ERROR] There are test failures.

# ------------------------------------------------------------------------------
 (+) globecast = FTP
 (-) smartjob = via WS
# ------------------------------------------------------------------------------

################################################################################
# APPLICATION ATN
################################################################################

# ------------------------------------------------------------------------------
# differents types de JOB
# ------------------------------------------------------------------------------
- TYPE 1 - job spring (quartz qui va appeler)
- TYPE 2 - job jenkins
- TYPE 3 - job talend (lib externe, sur sonatype, DL par mvn)

# ------------------------------------------------------------------------------
# job
# ------------------------------------------------------------------------------
 job : backend > webapp > webinf > applicationContext.xml
  - job
  - cron
  - update cron (schoeduler change ET import cron et router)

  cron : si pas dans un groupe alors jamais lance
  en groupe : oblige rajouter mais pas parallele

# ------------------------------------------------------------------------------
# ATN - TALEND
# ------------------------------------------------------------------------------
JOB embarque              : B_MedicisPddImporter
JOB jenkins               : A_MedicisUpdateRef      >    (attention ctxt) jenkins SCHOEDULER > /opt/atnv2/talend/A_MedicisUpdateRefs/All_MedicisUpdateRefrentiels/All_MedicisUpdateRefrentiels_run.sh
JENKINS DEV MVN SETTINGS  : /var/lib/jenkins/.m2/settings.xml

# ------------------------------------------------------------------------------
# CHANGER SETTING et CHANGER en base
# ------------------------------------------------------------------------------
copy.usb.xml.path : /mnt/archives/GROUPS/COMMUNS/ATNV2/USB/Recette/

# ------------------------------------------------------------------------------
# TALEND
# ------------------------------------------------------------------------------
FALSE : ca va vers cette sortie
TRUE : ce qui a ete rejette par inner join ==> je creer un film
config compo custom

# --------------------------------------------
# DEFINITIONS
# --------------------------------------------
- envoie multicast (je crois que ca part directement vers les cinemas)


 # ------------------------------------------------------------------------------
 # APRES MEP - DEPLOY
 # ------------------------------------------------------------------------------
 # http://xwiki.mre.pub/bin/view/Portail+Appli+Mediavision/Adresses+des+Applications#HI.2-ATN
 # > 1.2 - Date de livraison	 	01/12/2015	11/10/2015
 #
 # et journal : http://xwiki.mre.pub/bin/edit/Portail+Appli+Mediavision/Journal+de+Production+ATN+2015
