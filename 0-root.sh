#!/bin/bash

################################################################################
# Axel REGNOULT - BASHRC - 1er nov
#
#
#
################################################################################

RED=`tput setaf 1`
GREEN=`tput setaf 2`
JAUNE=`tput setaf 3`
BLEU=`tput setaf 4`
VIOLET=`tput setaf 5`
CYAN=`tput setaf 6`
NOIR=`tput setaf 7`
NOCOLOR=`tput sgr0`

echo "${JAUNE}"
echo ' ____START__    _'
echo '/  __//  _ \  / \'
echo '| |  _| / \|  | |'
echo '| |_//| \_/|  \_/'
echo '\____\\____/  (_)'
echo "source 0-root (lecture du fichier en cours...)"
echo "  - attention : ne relance pas .zshrc"
# echo "${NOCOLOR}"
################################################################################
# 1 - export() - VAR ENV
################################################################################
# echo "${BLEU}"
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
export ACK_HOME="/opt/ack"  # 'echo $PATH' or  'echo $ENV'

export JAVA_HOME="/opt/java/current"  # 'echo $PATH' or  'echo $ENV'
export M2_HOME="/opt/maven/current"
export CATALINA_HOME="/opt/tomcat/current"

export MYSQL_HOME="/usr/local/mysql"
export GCLOUD_HOME="/usr/local/gcloud"

export MAVEN_OPTS="-Djaxb.debug=true"
                                    # GRADLE_HOME ?

echo '   - EXPORTS VAR: AXEL'
# MAC
export AXL_HOME="/Users/axel"
export AXL_HOME_ALIAS="$AXL_HOME/.ALIAS"
export AXL_HOME_LOG="$AXL_HOME/axel/log"
# WORK : MRE
# AXL_HOME="/home/axel"
# AXL_HOME_LOG="$AXL_HOME/LOG"
# AXL_HOME_ALIAS="$AXL_HOME/com/.ALIAS"
PATH=$PATH:$ACK_HOME:$JAVA_HOME/bin:$CATALINA_HOME/bin:$M2_HOME/bin:$GCLOUD_HOME/bin:$MYSQL_HOME/bin

################################################################################
# 2 - DEPENDENCES
################################################################################
# echo "${CYAN}"
echo ' 2 - DEPENDANCES (files .sh)'
echo '   - DEP: .h.sh'
.       "$AXL_HOME_ALIAS/bin/.h.sh"
echo '   - DEP: .git-prompt'
.       "$AXL_HOME_ALIAS/bin/.git-prompt.sh"
# echo "${NOCOLOR}"
################################################################################
# DIVERS
################################################################################
# bind    "set completion-ignore-case on"
stty    -ixon                                           # disable flow control
# shopt   -s histappend                                   # Make bash append rather than overwrite the history on disk
################################################################################
# 3 IMPORT SOURCE
################################################################################
# echo "${BLEU}"
echo ' 3 - SOURCES (axel config UNIX ZSH)'
# ------------------------------------------------------------------------------
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
echo
# echo "${NOCOLOR}"
# echo "source 0-prompt"        && . "$AXL_HOME_ALIAS/0-prompt.sh"
# echo "source 2-basic-mre"       && . "$AXL_HOME_ALIAS/basic-mre.sh"
# ------------------------------------------------------------------------------



# ------------------------------------------------------------------------------
# SSH A FAIRE
# ----------------------------------------------------------------------------

# FAIRE L INSTALL AVEC TT LES DEPENDANCES AUTO

# refaire passwd axel
# sudo passwd axel

# change default shell
# chsh -s /bin/zsh


# // TODO :
# 1 - autocomplete comme zsh (navigation)
# 2 - m si 1ere lettre est mauvaise : faire auto-complete //

# https://github.com/robbyrussell/oh-my-zsh //

# changer taille terminal terminator
# ~/.config/terminator/config
#       size = 900, 600


# a chercher :
# - rajouter le PWWD dans sudo directement au lieu de le rataper



# ----------------------------------------------------
# INSTALL PACKAGE
# sudo dpkg -i .deb
# sudo dpkg - --force-depends --install .deb
# ----------------------------------------------------



# alias     ls='ls -lh --group-directories-first   | awk '"'"'{print $1, $9}'"'"'  | h -ni $LS_ALL | h -ni $LS_NUM  | h -ni LS_NUM_TIRET  '

# desinstaller le programme SCREEN - quel est la cmd uninstall

# echo "${JAUNE}"
echo ' _________________'
echo "${NOCOLOR}"
