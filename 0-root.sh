#!/bin/bash

################################################################################
# Axel REGNOULT - BASHRC - 1er nov
#
#
#
################################################################################
function wwar()
{
    RED=`tput setaf 1`
    echo "${RED}"
    echo $1
    echo "${NOCOLOR}"
}

function ook()
{
    GREEN=`tput setaf 2`
    echo "${GREEN}"
    echo $1
    echo "${NOCOLOR}"
}

RED=`tput setaf 1`
GREEN=`tput setaf 2`
JAUNE=`tput setaf 3`
BLEU=`tput setaf 4`
VIOLET=`tput setaf 5`
CYAN=`tput setaf 6`
NOIR=`tput setaf 7`
NOCOLOR=`tput sgr0`

echo "${JAUNE}"
echo "source 0-root (lecture du fichier en cours...)"
echo ' ____START__    _'
echo '/  __//  _ \  / \'
echo '| |  _| / \|  | |'
echo '| |_//| \_/|  \_/'
echo '\____\\____/  (_)'
ook "WARN: ne source PAS .zshrc"
# source /Users/axel/.zshrc

# echo "${NOCOLOR}"
################################################################################
# 1 - export() - VAR ENV
################################################################################
echo ' 1 - export - VAR ENV'
echo '   - EXPORTS VAR: OS'
export LANGUAGE=en_US.UTF-8
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
export LC_TYPE=en_US.UTF-8export LANGUAGE=en_US.UTF-8
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
export LC_TYPE=en_US.UTF-8
# ------------------------------------------------------------------------------
export HISTCONTROL="ignoredups"       # Don't put duplicate lines in the history.
# export PAGER="most"
export EDITOR="atom"                  # export EDITOR='emacs'
# ------------------------------------------------------------------------------
echo '   - EXPORTS VAR: DEV'
ook "WARN : VAR TOMCAT, JAVA ... NOT ACTUALISED"
export ACK_HOME="/opt/ack"  # 'echo $PATH' or  'echo $ENV'

export JAVA_HOME="/opt/java/current"  # 'echo $PATH' or  'echo $ENV'
export M2_HOME="/opt/maven/current"
export CATALINA_HOME="/opt/tomcat/current"
# GRADLE_HOME ?

export MYSQL_HOME="/usr/local/mysql"
export GCLOUD_HOME="/usr/local/gcloud"

export MAVEN_OPTS="-Djaxb.debug=true"

echo '   - EXPORTS VAR: AXEL'
# MAC
export AXL_HOME="/Users/axel"
export AXL_HOME_ALIAS="$AXL_HOME/.ALIAS"
export AXL_HOME_LOG="$AXL_HOME/axel/log"
# PATH
PATH=$PATH:$ACK_HOME:$JAVA_HOME/bin:$CATALINA_HOME/bin:$M2_HOME/bin:$GCLOUD_HOME/bin:$MYSQL_HOME/bin

################################################################################
# 2 - DEPENDENCES
################################################################################
echo ' 2 - DEPENDANCES (files .sh)'
echo '   - DEP: .h.sh'            &&      . "$AXL_HOME_ALIAS/bin/.h.sh"
################################################################################
# DIVERS
################################################################################
# bind    "set completion-ignore-case on"
stty    -ixon                                           # disable flow control
# shopt   -s histappend                                   # Make bash append rather than overwrite the history on disk
################################################################################
# 3 IMPORT SOURCE
################################################################################
echo ' 3 - SOURCES (axel config UNIX ZSH)'
echo "source 1-alias"         && . "$AXL_HOME_ALIAS/1_alias.sh"
echo
echo "source 2-ls"            && . "$AXL_HOME_ALIAS/2_ls.sh"
echo "source 2-ssh"           && . "$AXL_HOME_ALIAS/2_ssh.sh"
echo "source 2-search"        && . "$AXL_HOME_ALIAS/2_search.sh"
echo "source 2-network"       && . "$AXL_HOME_ALIAS/2_network.sh"
echo
echo "source 3-git"           && . "$AXL_HOME_ALIAS/3_git.sh"
echo "source 3-mvn"           && . "$AXL_HOME_ALIAS/3_mvn.sh"
echo "source 3-log"           && . "$AXL_HOME_ALIAS/3_log.sh"
echo
echo "source 4-pgsql"         && . "$AXL_HOME_ALIAS/4_pgsql.sh"
echo "source 4-mysql"         && . "$AXL_HOME_ALIAS/4_mysql.sh"
echo "source 4-server"        && . "$AXL_HOME_ALIAS/4_server.sh"
echo "source 4-wordpress"     && . "$AXL_HOME_ALIAS/4_wp.sh"
echo
echo "source 5-mac"           && . "$AXL_HOME_ALIAS/5_mac.sh"
# echo "${NOCOLOR}"
# echo "source 0-prompt"        && . "$AXL_HOME_ALIAS/0-prompt.sh"
# echo "source 2-basic-mre"     && . "$AXL_HOME_ALIAS/basic-mre.sh"
echo "${JAUNE}  _________________ ${NOCOLOR}"
