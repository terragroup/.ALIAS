#!/bin/bash
echo ' ____START__    _'
echo '/  __//  _ \  / \'
echo '| |  _| / \|  | |'
echo '| |_//| \_/|  \_/'
echo '\____\\____/  (_)'
################################################################################
# Axel REGNOULT - BASHRC - 1er nov
################################################################################
export LANGUAGE=en_US.UTF-8
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
export LC_TYPE=en_US.UTF-8export LANGUAGE=en_US.UTF-8
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
export LC_TYPE=en_US.UTF-8
################################################################################
# VAR
################################################################################
#-------------------------------------------------------------------------------
# PERSO
#-------------------------------------------------------------------------------
AXL_HOME="/home/ax"
AXL_HOME_LOG="/home/axel/LOG"
#-------------------------------------------------------------------------------
# DOMAIN
#-------------------------------------------------------------------------------
PROD_DB_DOMAIN="prodatnv2bdd.mre.pub"
PROD_WWW_DOMAIN="prodatnv2web.mre.pub"

REC_DB_DOMAIN="10.196.165.17"
REC_WWW_DOMAIN="10.196.164.15"

J_DEV_DOMAIN="devschedulerweb.mre.pub"          # 10.196.164.237
J_PROD_DOMAIN="prodschedulerweb.mre.pub"        # 10.196.165.118
J_CONT_DOMAIN="jenkins.mre.pub"                 # ANCIEN = useless, ne pas utiliser
J_CONT_DOMAIN_2="prodjenkinsweb.mdv.pub"        # NEW (avec new nom de domaine)

# production        PRODATNV2GBLC.mre.pub        10.196.164.48           # adminmv / innovation
# pré-production    preprodatnv2gblc.mre.pub     10.196.165.224          # root / innovation
#-------------------------------------------------------------------------------
# LOG
#-------------------------------------------------------------------------------
# PROD_LOG_TOMCAT="/var/atnv2/tomcat/logs"  # only tomcat (catalina....host-manager, access...)
PROD_LOG_TOMCAT="/var/log/atnv2/tomcat"  # only tomcat (catalina....host-manager, access...)
REC_LOG_TOMCAT="/var/atn/backend"         # atnv2.log (OK)  > n existe pas sur PROD
REC_LOG_TOMCAT_CATALINA="/var/log/atnv2/tomcat"

PROD_LOG_PGSQL="/var/log/pgsql/9.4"
REC_LOG_PGSQL="/var/lib/pgsql/9.4/data/pg_log"

PROD_LOG_NGINX="/var/log/atnv2/nginx"
REC_LOG_NGINX="/var/log/atnv2/nginx"
################################################################################
# DEPENDENCIES
################################################################################
. "$AXL_HOME/alias/bin/.h.sh"
. "$AXL_HOME/alias/bin/.git-prompt.sh"
# log
alias cl="$AXL_HOME/alias/bin/.lnav"    # reader de log : attention : dependence BINAIRE
alias llog="cd $AXL_HOME/LOG"

################################################################################
# IMPORT SOURCE
################################################################################
echo "source 1-ls" && . "$AXL_HOME/alias/1-ls.sh"
echo "source 1-ssh" && . "$AXL_HOME/alias/1-ssh.sh"
echo "source 2-git" && . "$AXL_HOME/alias/2-git.sh"
echo "source 2-mvn" && . "$AXL_HOME/alias/2-mvn.sh"
echo "source 2-search" && . "$AXL_HOME/alias/2-search.sh"
echo "source 3-pgsql" && . "$AXL_HOME/alias/3-pgsql.sh"
echo "source 4-log" && . "$AXL_HOME/alias/4-log.sh"
echo "source 5-server" && . "$AXL_HOME/alias/5-server.sh"
echo "source 7-network" && . "$AXL_HOME/alias/7-network.sh"
echo "source 8-mysql" && . "$AXL_HOME/alias/8-mysql.sh"
################################################################################
# ENV
################################################################################
bind "set completion-ignore-case on"
stty -ixon                            # disable flow control
shopt -s histappend                   # Make bash append rather than overwrite the history on disk

export HISTCONTROL="ignoredups"       # Don't put duplicate lines in the history.
export PAGER="most"
export EDITOR="atom"                  # export EDITOR='emacs'

# GRADLE_HOME ?
export JAVA_HOME="/opt/java/current"  # 'echo $PATH' or  'echo $ENV'
export M2_HOME="/opt/maven/current"
export MAVEN_OPTS="-Djaxb.debug=true"
export CATALINA_HOME="/opt/tomcat/current"
PATH=$JAVA_HOME/bin:bin:$M2_HOME/bin:$CATALINA_HOME/bin:$PATH:/opt/ack
################################################################################
# UNIX
################################################################################
echo "-- BEGIN bash --"
alias cat='pygmentize -g '
alias cdcd="cd .."; alias rroot='cd /root'; alias oopt='cd /opt ';alias eetc='cd /etc ';alias mmnt='cd /mnt ';alias vvar='cd /var ';alias uusr='cd /usr ';
# TODO - ce grep peut etre TROP restrictif
alias grepc='grep --color=always';
alias grep='grep -Ei --color=always';
alias grepa='grep -HEin --color=always';

alias detar='tar -xvzf '
alias dezip='unzip'     # gunzip

alias rmf='rm -rf'

# directory
alias google='/opt/google/chrome/google-chrome &'
alias oopen='gnome-open .'
alias distance='remmina &'
alias vi='/usr/bin/vim'

# fast location
alias dl="cd $AXL_HOME/DL"
alias aatn="cd $AXL_HOME/com/atnv2"

# fast file
alias rs='atom ~/.m2/settings.xml'
alias rc='atom ~/alias/'
alias sb='. $AXL_HOME/alias/0-basic.sh'   # alias sb='source ~/.bashrc'

# type function pour avoir la declaration
alias ffun='compgen -A function  | grep -v '^[_]' | h -ni log dump fast_forward '

################################################################################
# PS1
# ------------------------------------------------------------------------------
# COLOR UNIX (setaf, setab)
# 1 - blue
# 2 - green
# 3 - blue
# 4 - red
# 5 - purple
# export H_COLORS_FG="bold black on_rgb520","bold red on_rgb025" #     export H_COLORS_BG="underline bold rgb520","underline bold rgb025"
# TODO : ici - conditions : en fonction du user (axel, root, autre, postgres) ==> tu generes le PS1
################################################################################
PURPLE="$(tput setb 5)"; TT_USER="$(tput setb 2) $(tput setaf 0)"; RED="$(tput setaf 1)";
RED_BLACK="$(tput setb 4) $(tput setaf 7)";
WHITE_RED="$(tput setb 7) $(tput setaf 0)";
GREEN="$(tput setaf 2)"; YELLOW="$(tput setaf 3)"; END="$(tput sgr0)"
# multi-line
JAUNE_GIT="\[\033[01;33m\]"
JAUNE_GIT_2="$(tput setb 6) $(tput setaf 0)"
PS1='\n\n\n\n\n $JAUNE_GIT_2 $(__git_ps1)                                                                                                                                               \
$END\n $RED_BLACK$(dirname $(pwd))/ $END$WHITE_RED \W  $END           $GREEN \A $END  \d  ($(echo $?))  $TT_USER \u $END @ $TT_USER \H $END \n\n\n\n '

# 1-line
#PURPLE="$(tput setb 5)"; TT_USER="$(tput setb 2)"; RED="$(tput setaf 1)"; GREEN="$(tput setaf 2)"; YELLOW="$(tput setaf 3)"; END="$(tput sgr0)"
#PS1='\n\n\n$GREEN$(dirname $(pwd))$END$RED \W $END\[\033[01;33m\]$(__git_ps1) $END        $(echo $?) |$GREEN \T $END| \d | \H | $TT_USER \u $END\n  '
################################################################################
# divers function
################################################################################
function mkcd() {
    `mkdir -m 700 "$1"`
    ret=`echo $?`
    if [ $ret -ne 0 ]; then
        `cd "$1"`
    else
        `cd "$1"`
    fi
}
# copie des settings de workspace exlipse
function cp_ws() {
    echo $1 '=>' $2 ;
    mkdir -p "$2/.metadata/.plugins/org.eclipse.core.runtime/"
    # ignorer en cas d'erreur
    mv "$2/.metadata/.plugins/org.eclipse.core.runtime/.settings" "$2/.metadata/.plugins/org.eclipse.core.runtime/.settings.old"
    cp -R "$1/.metadata/.plugins/org.eclipse.core.runtime/.settings" "$2/.metadata/.plugins/org.eclipse.core.runtime/.settings"
}
echo ' ____END____    _'
echo '/  __//  _ \  / \'
echo '| |  _| / \|  | |'
echo '| |_//| \_/|  \_/'
echo '\____\\____/  (_)'
################################################################################
# DIVERS
################################################################################
alias idea='/home/axel/dev/idea-13/bin/./idea.sh &'
# VM options are loaded from the IDE_HOME\bin\<product>[bits][.exe].vmoptions file.
# cat /home/axel/dev/idea-13 /home/axel/dev/idea-13/bin/idea64.vmoptions
alias mywget="wget http://redmine.mre.pub/projects/medicis-recap/repository"
alias df='df -h'
alias du='du -h'
################################################################################
# END
################################################################################

## extra home
alias aapm='sudo apm install'
alias tt='atom .'
# alias aapm='sudo apm install'
alias leo='cd /home/ax/com/leo'

# INSTALL PACKAGE - sudo dpkg -i DEB_PACKAGE
