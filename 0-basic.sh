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
RED_BLACK="$(tput setb 0) $(tput setaf 7)";
WHITE_RED="$(tput setb 7) $(tput setaf 0)";
GREEN="$(tput setaf 2)"; YELLOW="$(tput setaf 3)"; END="$(tput sgr0)"
# multi-line
JAUNE_GIT="\[\033[01;33m\]"
JAUNE_GIT_2="$(tput setb 6) $(tput setaf 0)"
# ------------------------------------------------------------------------------
PS1='\n ($(echo $?)) $JAUNE_GIT_2                                                         $(__git_ps1)   $END $GREEN \A $END  \d  \
$END\n$RED_BLACK     $(dirname $(pwd))/     $END$WHITE_RED     \W     $END       $TT_USER \u $END @ $TT_USER \H $END \n\n    '
  #  $END  $GREEN >>>   $END

# 1-line
#PURPLE="$(tput setb 5)"; TT_USER="$(tput setb 2)"; RED="$(tput setaf 1)"; GREEN="$(tput setaf 2)"; YELLOW="$(tput setaf 3)"; END="$(tput sgr0)"
#PS1='\n\n\n$GREEN$(dirname $(pwd))$END$RED \W $END\[\033[01;33m\]$(__git_ps1) $END        $(echo $?) |$GREEN \T $END| \d | \H | $TT_USER \u $END\n  '
