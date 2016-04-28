#!/bin/bash

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


################################################################################
# Axel REGNOULT - BASHRC - 1er nov
################################################################################
echo ' ____START__    _'
echo '/  __//  _ \  / \'
echo '| |  _| / \|  | |'
echo '| |_//| \_/|  \_/'
echo '\____\\____/  (_)'
################################################################################
# ENV
################################################################################
export LANGUAGE=en_US.UTF-8
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
export LC_TYPE=en_US.UTF-8export LANGUAGE=en_US.UTF-8
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
export LC_TYPE=en_US.UTF-8
# ------------------------------------------------------------------------------
export HISTCONTROL="ignoredups"       # Don't put duplicate lines in the history.
export PAGER="most"
export EDITOR="atom"                  # export EDITOR='emacs'
# ------------------------------------------------------------------------------
export JAVA_HOME="/opt/java/current"  # 'echo $PATH' or  'echo $ENV'
export M2_HOME="/opt/maven/current"
export MAVEN_OPTS="-Djaxb.debug=true"
export CATALINA_HOME="/opt/tomcat/current"
                                      # GRADLE_HOME ?
PATH=$JAVA_HOME/bin:bin:$M2_HOME/bin:$CATALINA_HOME/bin:$PATH:/opt/ack
################################################################################
# VAR
################################################################################
                              AXL_HOME="/home/axel"
                          AXL_HOME_LOG="$AXL_HOME/LOG"
                        AXL_HOME_ALIAS="$AXL_HOME/com/.ALIAS"
################################################################################
# DEPENDENCIES
################################################################################
.       "$AXL_HOME_ALIAS/bin/.h.sh"
.       "$AXL_HOME_ALIAS/bin/.git-prompt.sh"
################################################################################
# DIVERS
################################################################################
# bind    "set completion-ignore-case on"
stty    -ixon                                           # disable flow control
# shopt   -s histappend                                   # Make bash append rather than overwrite the history on disk
################################################################################
# IMPORT SOURCE
################################################################################
echo "source basic-mre"       && . "$AXL_HOME_ALIAS/basic-mre.sh"
echo "source 0-alias"         && . "$AXL_HOME_ALIAS/0-alias.sh"
# echo "source 0-prompt"        && . "$AXL_HOME_ALIAS/0-prompt.sh"
# ------------------------------------------------------------------------------
echo "source 1-ls"            && . "$AXL_HOME_ALIAS/ls.sh"
echo "source 1-ssh"           && . "$AXL_HOME_ALIAS/ssh.sh"
echo "source 2-git"           && . "$AXL_HOME_ALIAS/git.sh"
echo "source 2-mvn"           && . "$AXL_HOME_ALIAS/mvn.sh"
echo "source 2-search"        && . "$AXL_HOME_ALIAS/search.sh"
echo "source 3-pgsql"         && . "$AXL_HOME_ALIAS/pgsql.sh"
echo "source 4-log"           && . "$AXL_HOME_ALIAS/log.sh"
echo "source 5-server"        && . "$AXL_HOME_ALIAS/server.sh"
echo "source 7-network"       && . "$AXL_HOME_ALIAS/network.sh"
# echo "source 8-mysql"       && . "$AXL_HOME_ALIAS/mysql.sh"
# ------------------------------------------------------------------------------
