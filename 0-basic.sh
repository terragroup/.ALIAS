#!/bin/bash

# FAST AT HOME
cd ~/com/JS

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
AXL_HOME="/home/axel"
AXL_HOME_LOG="$AXL_HOME/LOG"
AXL_HOME_ALIAS="$AXL_HOME/com/.ALIAS"
################################################################################
# DEPENDENCIES
################################################################################
. "$AXL_HOME_ALIAS/bin/.h.sh"
. "$AXL_HOME_ALIAS/bin/.git-prompt.sh"
################################################################################
# DIVERS
################################################################################
bind "set completion-ignore-case on"
stty -ixon                            # disable flow control
shopt -s histappend                   # Make bash append rather than overwrite the history on disk
################################################################################
# ENV
################################################################################
export HISTCONTROL="ignoredups"       # Don't put duplicate lines in the history.
export PAGER="most"
export EDITOR="atom"                  # export EDITOR='emacs'
# ------------------------------------------------------------------------------
# GRADLE_HOME ?
export JAVA_HOME="/opt/java/current"  # 'echo $PATH' or  'echo $ENV'
export M2_HOME="/opt/maven/current"
export MAVEN_OPTS="-Djaxb.debug=true"
export CATALINA_HOME="/opt/tomcat/current"
PATH=$JAVA_HOME/bin:bin:$M2_HOME/bin:$CATALINA_HOME/bin:$PATH:/opt/ack
################################################################################
# IMPORT SOURCE
################################################################################

echo "source 0-basic-mre" && . "$AXL_HOME_ALIAS/0-basic-mre.sh"
echo "source 0-basic-alias" && . "$AXL_HOME_ALIAS/0-basic-alias.sh"
echo "source 0-prompt" && . "$AXL_HOME_ALIAS/0-prompt.sh"

echo "source 1-ls" && . "$AXL_HOME_ALIAS/ls.sh"
echo "source 1-ssh" && . "$AXL_HOME_ALIAS/ssh.sh"
echo "source 2-git" && . "$AXL_HOME_ALIAS/git.sh"
echo "source 2-mvn" && . "$AXL_HOME_ALIAS/mvn.sh"
echo "source 2-search" && . "$AXL_HOME_ALIAS/search.sh"
echo "source 3-pgsql" && . "$AXL_HOME_ALIAS/pgsql.sh"
echo "source 4-log" && . "$AXL_HOME_ALIAS/log.sh"
echo "source 5-server" && . "$AXL_HOME_ALIAS/server.sh"
echo "source 7-network" && . "$AXL_HOME_ALIAS/network.sh"
# echo "source 8-mysql" && . "$AXL_HOME_ALIAS/mysql.sh"


alias ss='source ~/.bashrc'
alias ggulp='gulp serve'
alias aaz='atom '
