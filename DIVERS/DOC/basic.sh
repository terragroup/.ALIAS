#!/bin/bash


# chsh -s /bin/bash  #change default shell to bash (instead of zsh for example)


# savoir les DNS
# nmcli dev list iface eth0 | grep IP4

# cat /etc/issue


################################################################################
# SCP
################################################################################

# (-p = date     -r = recursif)
# GET  = scp FILE DEST_HOST:dossier  > scp error.log  axel@10.196.165.188:/home/axel/error.log
# POST = scp DEST_HOST:dossier FILE

# - je vois dans DEPLOY :
clean process-resources -P ${ENVIRONNEMENT}
# - mais je change avec :
clean package -DskipTests=true -P atnv2_production




 


 # ------------------------------------------------------------------------------
 # ficher DNS (/etc/hosts pour les hosts)
 # --------------------------------------------
  /etc/resolvconf/resolv.conf.d/base
  sudo resolvconf -u (marche pas donc ci desosus)
  sudo ifdown -a and then sudo ifup -a
  nameserver 10.196.164.231

 # ---------------------------
 # mettre a jour
  df -h
  df -k
 # ---------------------------

 # ALT + SUPPR -



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


#------------------------------------------------------------------------------------------------------------------
# IIDEA - port 2676 ?
#------------------------------------------------------------------------------------------------------------------

pour pouvoir me ssh sur ma machine
sudo apt-get install openssh-server

meld pour la diff ?
wc -l     number of line
date (avoir l heure actuelle)   date MMDDHHmmYYYY

alias less='less -r'                           raw control characters
alias whence='type -a'                         where, of a sort
Some shortcuts for different directory listings
alias ls='ls -hF --color=tty'                  classify files in colour

alias dir='ls --color=auto --format=vertical'
alias vdir='ls --color=auto --format=long'


...............................
...............................
...............................
...............................
.............. commentaire ....
...............................
...............................
...............................


-	Regular file.
b	Block special file.
c	Character special file.
d	Directory.
l	Symbolic link.
p	FIFO.
s	Socket.
w	Whiteout.
Interactive operation...
alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'
imprime ecran img
shutter &
EPITA
umask 066
xset b off
alias 'tar=gtar'
alias 'z=clear && ~/zlock.sh && zlock -immed'
alias 'mkdir=mkdir -m 700'
export NNTPSERVER="news.epita.fr"
export MALLOC_OPTIONS="J"
Aliases

Some example alias instructions
If these are enabled they will be used instead of any instructions
they may mask.  For example, alias rm='rm -i' will mask the rm
application.  To override the alias instruction use a \ before, ie
\rm will call the real rm not the alias.
Bash completion
if [ -f /etc/bash_completion ]; then
. /etc/bash_completion
fi
Oh my ZSH
http://www.stevendobbelaere.be/installing-and-configuring-the-oh-my-zsh-shell/
BEST GIT
alias gllf='git log -20 --stat  --oneline --pretty=format:"%Cred%h%Creset %C(yellow)%d%Creset %C(yellow)%s %Cgreen(%cr) %C(bold blue)<%an>%Creset" --abbrev-commit | grep -E "/|$"'
alias gllfa='git log -20 --author="axel" --stat  --oneline --pretty=format:"%Cred%h%Creset %C(yellow)%d%Creset %C(yellow)%s %Cgreen(%cr) %C(bold blue)<%an>%Creset" --abbrev-commit | grep -E "/|$"'
je n ai pas le nom des personnes
alias gli='git log -10 --graph --oneline --decorate --all --name-status --stat'
comme glo, mais pas sur une ligne
alias gla='git log -50 --stat'
alias glax='git log -50 --author="axel" --stat'
alias glaxa='git log --author="axel" --stat'
alias gitlgf='git log --pretty=format:"%Cred%h%Creset -%C(yellow)%d%Creset %s <%ad>" --abbrev-commit --date=relative --name-status
 heir = log --all --graph --decorate --oneline --simplify-by-decoration'
alias xxgxx='echo -e "\n PUSHING \n" && gt && echo -e "\n-----------------\n" && gitp && echo -e "\n-----------------\n" && gp && echo -e "\n-----------------\n" && gtp && echo -e "\n-----------------\n" && gll && echo -e "\n-----------------\n" && aa && echo -e "\n >>> Thanks you :D <<<\n" '
alias gitc='git commit -a && git pull --rebase && git --no-pager lg -5 && echo'
// UID - GID
axel		:x:1000:1000	:axel,		,,:/home/axel:/bin/bash
mysql		:x:115:124	:MySQL Server,	,,:/nonexistent:/bin/false
aregnoult	:x:1001:1001:	:/home/aregnoult

// admin password
gedit /etc/novell_credentials


alias c1='/opt/java/current/bin/java -Dmaven.home=/home/axel/dev/maven-3.1.0 -Dclassworlds.conf=/home/axel/dev/maven-3.1.0/bin/m2.conf -Didea.launcher.port=7542 -Didea.launcher.bin.path=/home/axel/dev/idea-13/bin -Dfile.encoding=UTF-8 -classpath /home/axel/dev/maven-3.1.0/boot/plexus-classworlds-2.4.2.jar:/home/axel/dev/idea-13/lib/idea_rt.jar com.intellij.rt.execution.application.AppMain org.codehaus.classworlds.Launcher -Didea.version=13.1.6 -DskipTests=true install -P localhost,Atnv2_Local,resources-dev,gwt-dev | $AXL'
alias c2='sudo /opt/java/current/bin/java -agentlib:jdwp=transport=dt_socket,address=127.0.0.1:8523,suspend=y,server=n -Djaxb.debug=true -Dmaven.home=/home/axel/dev/maven-3.1.0 -Dclassworlds.conf=/home/axel/dev/maven-3.1.0/bin/m2.conf -Dfile.encoding=UTF-8 -classpath /home/axel/dev/maven-3.1.0/boot/plexus-classworlds-2.4.2.jar:/home/axel/dev/idea-13/lib/idea_rt.jar org.codehaus.classworlds.Launcher -Didea.version=13.1.6 -DskipTests=true jetty:run-exploded -P localhost,Atnv2_Local,resources-dev,gwt-dev | $AXL'

#------------------------------------------------------------------------------
# MAVEN
#------------------------------------------------------------------------------
// back
 -agentlib:jdwp=transport=dt_socket,address=127.0.0.1:45939,suspend=y,server=n
 -Djaxb.debug=true -Dmaven.home=/home/axel/dev/maven-3.1.0
 -Dclassworlds.conf=/home/axel/dev/maven-3.1.0/bin/m2.conf -Dfile.encoding=UTF-8
 -classpath /home/axel/dev/maven-3.1.0/boot/plexus-classworlds-2.4.2.jar:/home/axel/dev/idea-13/lib/idea_rt.jar org.codehaus.classworlds.Launcher
 -Didea.version=13.1.6 -DskipTests=true
  jetty:run-exploded -P localhost,Atnv2_Local,resources-dev,gwt-dev


// front
/opt/java/current/bin/java -Dmaven.home=/home/axel/dev/maven-3.1.0
-Dclassworlds.conf=/home/axel/dev/maven-3.1.0/bin/m2.conf
-Didea.launcher.port=7532 -Didea.launcher.bin.path=/home/axel/dev/idea-13/bin -Dfile.encoding=UTF-8 -classpath /home/axel/dev/maven-3.1.0/boot/plexus-classworlds-2.4.2.jar:/home/axel/dev/idea-13/lib/idea_rt.jar com.intellij.rt.execution.application.AppMain org.codehaus.classworlds.Launcher -Didea.version=13.1.6 -DskipTests=true
org.mortbay.jetty:jetty-maven-plugin:8.1.8.v20121106:run
-P resources-dev,Atnv2_Local,gwt-dev


// SDM
/opt/java/current/bin/java -Xmx1024m -Didea.launcher.port=7533
-Didea.launcher.bin.path=/home/axel/dev/idea-13/bin -Dfile.encoding=UTF-8

-classpath /home/axel/.m2/repository/com/google/gwt/gwt-dev/2.5.1//gwt-dev-2.5.1.jar:/home/axel/.m2/repository/org/fusesource/restygwt/restygwt/1.3.1/restygwt-1.3.1-sources.jar:/home/axel/.m2/repository/com/sencha/gxt/gxt/3.0.6/gxt-3.0.6-sources.jar:/home/axel/.m2/repository/com/google/guava/guava/16.0.1/guava-16.0.1-sources.jar:/home/axel/.m2/repository/com/groupemre/socle/socle-model/1.2.114/socle-model-1.2.114-sources.jar:/home/axel/.m2/repository/com/groupemre/socle/socle-gwt/1.2.114/socle-gwt-1.2.114-sources.jar:/opt/java/current/jre/lib/rt.jar:/opt/java/current/jre/lib/jfr.jar:/opt/java/current/jre/lib/resources.jar:/opt/java/current/jre/lib/jce.jar:/opt/java/current/jre/lib/management-agent.jar:/opt/java/current/jre/lib/javaws.jar:/opt/java/current/jre/lib/deploy.jar:/opt/java/current/jre/lib/charsets.jar:/opt/java/current/jre/lib/jsse.jar:/opt/java/current/jre/lib/plugin.jar:/opt/java/current/jre/lib/jfxswt.jar:/opt/java/current/jre/lib/ext/nashorn.jar:/opt/java/current/jre/lib/ext/jfxrt.jar:/opt/java/current/jre/lib/ext/cldrdata.jar:/opt/java/current/jre/lib/ext/zipfs.jar:/opt/java/current/jre/lib/ext/dnsns.jar:/opt/java/current/jre/lib/ext/sunec.jar:/opt/java/current/jre/lib/ext/jaccess.jar:/opt/java/current/jre/lib/ext/localedata.jar:/opt/java/current/jre/lib/ext/sunjce_provider.jar:/opt/java/current/jre/lib/ext/sunpkcs11.jar:/home/axel/com/atn_v2/frontend/target/test-classes:/home/axel/com/atn_v2/frontend/target/classes:/home/axel/.m2/repository/com/groupemre/socle/socle-gwt/1.2.114/socle-gwt-1.2.114.jar:/home/axel/.m2/repository/com/groupemre/socle/socle-model/1.2.114/socle-model-1.2.114.jar:/home/axel/.m2/repository/org/hibernate/javax/persistence/hibernate-jpa-2.1-api/1.0.0.Final/hibernate-jpa-2.1-api-1.0.0.Final.jar:/home/axel/.m2/repository/org/codehaus/jackson/jackson-mapper-asl/1.9.12/jackson-mapper-asl-1.9.12.jar:/home/axel/.m2/repository/org/codehaus/jackson/jackson-core-asl/1.9.12/jackson-core-asl-1.9.12.jar:/home/axel/.m2/repository/javax/validation/validation-api/1.0.0.GA/validation-api-1.0.0.GA.jar:/home/axel/.m2/repository/org/hibernate/hibernate-validator/4.1.0.Final/hibernate-validator-4.1.0.Final.jar:/home/axel/.m2/repository/org/hibernate/hibernate-jpamodelgen/4.3.4.Final/hibernate-jpamodelgen-4.3.4.Final.jar:/home/axel/.m2/repository/org/jboss/logging/jboss-logging-annotations/1.2.0.Beta1/jboss-logging-annotations-1.2.0.Beta1.jar:/home/axel/.m2/repository/com/google/guava/guava/16.0.1/guava-16.0.1.jar:/home/axel/.m2/repository/com/google/code/findbugs/jsr305/2.0.3/jsr305-2.0.3.jar:/home/axel/.m2/repository/org/slf4j/slf4j-api/1.7.6/slf4j-api-1.7.6.jar:/home/axel/.m2/repository/org/slf4j/jcl-over-slf4j/1.7.6/jcl-over-slf4j-1.7.6.jar:/home/axel/.m2/repository/org/hibernate/hibernate-validator/4.1.0.Final/hibernate-validator-4.1.0.Final-sources.jar:/home/axel/.m2/repository/org/slf4j/slf4j-nop/1.7.6/slf4j-nop-1.7.6.jar:/home/axel/.m2/repository/com/google/guava/guava-gwt/16.0.1/guava-gwt-16.0.1.jar:/home/axel/.m2/repository/com/gwtplatform/gwtp-mvp-client/1.2.1/gwtp-mvp-client-1.2.1.jar:/home/axel/.m2/repository/com/gwtplatform/gwtp-clients-common/1.2.1/gwtp-clients-common-1.2.1.jar:/home/axel/.m2/repository/com/google/inject/guice/3.0/guice-3.0.jar:/home/axel/.m2/repository/javax/inject/javax.inject/1/javax.inject-1.jar:/home/axel/.m2/repository/aopalliance/aopalliance/1.0/aopalliance-1.0.jar:/home/axel/.m2/repository/org/apache/maven/maven-artifact/3.1.1/maven-artifact-3.1.1.jar:/home/axel/.m2/repository/org/codehaus/plexus/plexus-utils/3.0.15/plexus-utils-3.0.15.jar:/home/axel/.m2/repository/com/gwtplatform/gwtp-mvp-shared/1.2.1/gwtp-mvp-shared-1.2.1.jar:/home/axel/.m2/repository/org/apache/velocity/velocity/1.7/velocity-1.7.jar:/home/axel/.m2/repository/commons-collections/commons-collections/3.2.1/commons-collections-3.2.1.jar:/home/axel/.m2/repository/commons-lang/commons-lang/2.6/commons-lang-2.6.jar:/home/axel/.m2/repository/com/google/gwt/inject/gin/2.1.2/gin-2.1.2.jar:/home/axel/.m2/repository/com/google/inject/extensions/guice-assistedinject/3.0/guice-assistedinject-3.0.jar:/home/axel/.m2/repository/com/sencha/gxt/gxt/3.0.6/gxt-3.0.6.jar:/home/axel/.m2/repository/com/allen-sauer/gwt/log/gwt-log/3.3.0/gwt-log-3.3.0.jar:/home/axel/.m2/repository/org/fusesource/restygwt/restygwt/1.3.1/restygwt-1.3.1.jar:/home/axel/.m2/repository/javax/ws/rs/jsr311-api/1.1.1/jsr311-api-1.1.1.jar:/home/axel/com/atn_v2/model/target/classes:/home/axel/.m2/repository/com/google/gwt/gwt-user/2.5.1/gwt-user-2.5.1.jar:/home/axel/.m2/repository/javax/validation/validation-api/1.0.0.GA/validation-api-1.0.0.GA-sources.jar:/home/axel/.m2/repository/org/json/json/20090211/json-20090211.jar:/home/axel/.m2/repository/com/sencha/gxt/gxt-chart/3.0.6/gxt-chart-3.0.6.jar:/home/axel/.m2/repository/junit/junit/4.11/junit-4.11.jar:/home/axel/.m2/repository/org/hamcrest/hamcrest-core/1.3/hamcrest-core-1.3.jar:/home/axel/.m2/repository/org/jukito/jukito/1.4/jukito-1.4.jar:/home/axel/.m2/repository/org/mockito/mockito-core/1.9.5/mockito-core-1.9.5.jar:/home/axel/.m2/repository/org/objenesis/objenesis/1.0/objenesis-1.0.jar:/home/axel/.m2/repository/com/google/gwt/gwt-codeserver/2.5.1/gwt-codeserver-2.5.1.jar:/home/axel/.m2/repository/javax/validation/validation-api/1.1.0.Final/validation-api-1.1.0.Final.jar:/home/axel/.m2/repository/javax/validation/validation-api/1.1.0.Final/validation-api-1.1.0.Final-sources.jar:/home/axel/dev/idea-13/lib/idea_rt.jar com.intellij.rt.execution.application.AppMain com.google.gwt.dev.codeserver.CodeServer -workDir /home/axel/.IntelliJIdea13/system/gwt/atnv2.7fac1bfe/atnv2-frontend.de03362e/superDevMode/work -src /home/axel/com/atn_v2/frontend/target/generated-sources/gwt -src /home/axel/com/atn_v2/frontend/src/main/java -src /home/axel/com/atn_v2/frontend/src/main/resources -src /home/axel/com/atn_v2/model/src/main/java -src /home/axel/com/atn_v2/model/src/main/resources -src /home/axel/com/atn_v2/model/target/generated-sources/annotations
com.groupemre.atnv2.ihm.Atnv2Dev
workDir: /home/axel/.IntelliJIdea13/system/gwt/atnv2.7fac1bfe/atnv2-frontend.de03362e/superDevMode/work


#------------------------------------------------------------------------------
# MEGA SEARCH (http://stackoverflow.com/questions/16956810/finding-all-files-containing-a-text-string-on-linux)
#------------------------------------------------------------------------------
historic = 4096 lignes
cat - \
| ack --flush --passthru --color --color-match=red    "^.*\*ERROR\*.*" \
| ack --flush --passthru --color --color-match=yellow "^.*\*WARN\*.*" \
| ack --flush --passthru --color --color-match=green  "^.*\*INFO\*.*" \
| ack --flush --passthru --color --color-match=white  "^.*\*DEBUG\*.*" \
| ack --flush --passthru --color --color-match=white  "^.*\*TRACE\*.*"


#------------------------------------------------------------------------------
# HIGHLIGHTER HELP
#------------------------------------------------------------------------------
DESCRIPTION:
  * h highlights with color specified keywords when you invoke it via pipe
  * h is just a tiny wrapper around the powerful 'ack' (or 'ack-grep'). you need 'ack' installed to use h. ack website: http://beyondgrep.com/

INSTALL:
  * put something like this in your .bashrc:
    . /path/to/h.sh
  * or just copy and paste the function in your .bashrc

TEST ME:
  * try to invoke:
    echo "abcdefghijklmnopqrstuvxywz" | h   a b c d e f g h i j k l

CONFIGURATION:
  * you can alter the color and style of the highlighted tokens setting values to these 2 environment values following "Perl's Term::ANSIColor" supported syntax
  * ex.
    export H_COLORS_FG="bold black on_rgb520","bold red on_rgb025"
    export H_COLORS_BG="underline bold rgb520","underline bold rgb025"
    echo abcdefghi | h   a b c d

GITHUB
  * https://github.com/paoloantinori/hhighlighter

END
