#!/bin/bash



# REGLE lorsque tu utilises H (comme grep, fait attention a l ordre des elements, car le premier match annule les autres)

# detail sur les logs:
# c.g.a.s.r = com.groupemre.atnv2.services.router;

################################################################################
# Comment marche H ?
# var="  '  |   |   |  '     '  |   |   |  '    "
################################################################################
#- sessions connectes a tomcat ?
#- sessions connectes a postgres ?

# USER INFO UNIX  >  id axel

# savoir faire GIT = chercher une string dedans ? (dans le lig ?)

sudo dpkg --install atom-amd64.deb
change date  >>>> date -s '2016-01-29 12:16:00'
chown postgres:postgres /tmp/fichier




################################################################################
# COMMENTAIRE
################################################################################

# INSTALL PACKAGE - sudo dpkg -i DEB_PACKAGE
# alias ddate='date +%Y-%m-%d'
# x_DATE=`date +%Y-%m-%d`

# /home/axel/com/atn_v2

# ATTENTION : mettre le fichier HOST a jour si besoin

# MON IP = 10.196.165.188

# - job nexus (job crone dans appli)    ex: B_MedicisPddImporter
# - job jenkins (le reste)              ex: A_Medicis_update_refs : voir le directory

# ctrl + q = quitter de vi



################################################################################
# RELEASE APPLICATIF
################################################################################
#
# difference release ET version applcatifdifference release ET version applcatif
# versions appli avec version releases DCOM
# 8.5.1 - version appliaction
# num version sur appli qui match avec release globale= pas de sens
#
# il vaut mieux tag 8.4.b, 8.4.b
# correller appli avec release globale (sait ce que l on va livrer)
#
# num de version dans le TAG



# meld - outil de merge unix
# dig ?
# jobs = pour les voir en 1er ou arriere plan




# scp -rp <=> pour les directories

################################################################################
# TODO - ne meme pas avoir a DL, tu pourrais t y connecter a distance et le ouvrir ?
################################################################################
# TODO - jenkins ?
################################################################################
# /var/lib/jenkins/.m2/settings.xml
################################################################################
#  SECTION NGINX - BUG repetitif a corriger (cf, FABRICE)
################################################################################
#  + Y A T IL TJS PB UPDATE REFERENTIEL ?
################################################################################
# TODO - CONFLICT JENKINS ?
# TODO - changer l url a chaque fois :
#          vi /etc/nginx/conf.d/default.conf  ===>   root   /var/atnv2/gwt/atnv2;
#
# PROD -   # fichier nginx.conf POINTE sur : root   /var/atn/gwt/atnv2;
# REC  -   # fichier nginx.conf POINTE sur : root   /var/atn/frontend/atnv2;
# -----------------------------------------------------------------------------
# BUG ACTUEL                       le fichier met   /var/atn/frontend/atnv2;
#                                      au lieu de   /var/atnv2/gwt/atnv2;
# -----------------------------------------------------------------------------



################################################################################
# MVN
################################################################################
# maven    : -U (force le DL)
# install  : + compile source, + execute unit tests, + create a JAR, + install the JAR in a local repository
# HERVE    : toujours faire un clean install, car MAVEN recreer les properties etc...
# MVN_SEPARATOR_CYCLE=" .*---.*"
# 'Hibernate|where|from|select|group by|from|left outer join'  \
# 'Results :' \
# 'Failures: 0, Errors: 0, Skipped: 0' \
# .*\[Atn\ V2\].*
# 'Scanning for projects...' \
# '\Reactor Summary:' \



################################################################################
# OTHERS
################################################################################
# PROD        - RED
#             bind "set completion-ignore-case on"; TT_HOST="$(tput setb 4)"; TT_USER="$(tput setb 4)"; T="$(tput setaf 1)"; RED="$(tput setaf 1)"; GREEN="$(tput setaf 2)"; YELLOW="$(tput setaf 3)"; END="$(tput sgr0)";  alias rroot="cd /root"; alias cdcd="cd .."; alias grep='grep -HEin --color=always'; alias l='ls -CF --group-directories-first '; alias oopt='cd /opt ';alias eetc='cd /etc ';alias mmnt='cd /mnt ';alias vvar='cd /var ';alias uusr='cd /usr '; PS1='\n\n\n$GREEN$(dirname $(pwd))$END$RED \W $END\[\033[01;33m\]$END          $(echo $?) |$YELLOW \A $END| \d | $TT_HOST \H $END | $TT_USER \u $END\n  '
# REC         - BLUE
#             bind "set completion-ignore-case on"; TT_HOST="$(tput setb 1)"; TT_USER="$(tput setb 4)"; T="$(tput setaf 1)"; RED="$(tput setaf 1)"; GREEN="$(tput setaf 2)"; YELLOW="$(tput setaf 3)"; END="$(tput sgr0)";  alias rroot="cd /root"; alias cdcd="cd .."; alias grep='grep -HEin --color=always'; alias l='ls -CF --group-directories-first '; alias oopt='cd /opt ';alias eetc='cd /etc ';alias mmnt='cd /mnt ';alias vvar='cd /var ';alias uusr='cd /usr '; PS1='\n\n\n$GREEN$(dirname $(pwd))$END$RED \W $END\[\033[01;33m\]$END          $(echo $?) |$YELLOW \A $END| \d | $TT_HOST \H $END | $TT_USER \u $END\n  '
# JENKINS     - purple
#             bind "set completion-ignore-case on"; TT_HOST="$(tput setb 5)"; TT_USER="$(tput setb 5)"; T="$(tput setaf 1)"; RED="$(tput setaf 1)"; GREEN="$(tput setaf 2)"; YELLOW="$(tput setaf 3)"; END="$(tput sgr0)";  alias rroot="cd /root"; alias cdcd="cd .."; alias grep='grep -HEin --color=always'; alias l='ls -CF --group-directories-first '; alias oopt='cd /opt ';alias eetc='cd /etc ';alias mmnt='cd /mnt ';alias vvar='cd /var ';alias uusr='cd /usr '; PS1='\n\n\n$GREEN$(dirname $(pwd))$END$RED \W $END\[\033[01;33m\]$END          $(echo $?) |$YELLOW \A $END| \d | $TT_HOST \H $END | $TT_USER \u $END\n  '
################################################################################
# TODO -
# color HOST : prod, rec, local
# color HOST 2 : WEB, BDD, jenkins
# color USER : root, atnv2, postgres
################################################################################
