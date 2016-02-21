#!/bin/bash
################################################################################
# LS
################################################################################
# EXTENSION_VAR=" ' \\.java|\\.xml|\\.tar.gz|\\.jar|\\.yml|\\.sh|\\.png|\\.jpg|\\.gif|\\.jsp|\\.svg|\\.war|\\.ear|\\.css|\\.log ' "
# \\->|
BASIC_DIR_HOME="'atn_v2|com|Bureau|DL'"
BASIC_DIR_VAR="'bin|lib|LICENCE|RELEASE|log|build|WEB-INF|index|web|pom|spots|src|target|SNAPSHOT|classes'"
NGINX_VAR="'sites-available|sites-enabled|nginx.conf'"
#-------------------------------------------------------------------------------
# $BASIC_DIR_VAR $BASIC_DIR_HOME
# startup shutdown $  | h -ni $BASIC_DIR_HOME $BASIC_DIR_VAR $EXTENSION_VAR  $AXL_MAVEN
# alias l='ls -CF --group-directories-first | h -i .yml'
# alias l='ls -lh --group-directories-first   | h -i drwx rw\\- root axel sites\-enabled default \\-\> "alias|pom.xml|.xml"'
alias la='ls -A --group-directories-first   | h -i drwx rw\\-  root axel \\.m2 \\.bashrc \\.com DL Bureau \\.h.sh .gitconfig .git-prompt.sh \\.ssh '           # all but . and ..
alias lla='ls -la --group-directories-first | h -i drwx rw\\-  root axel \\.m2 \\.bashrc \\.com DL Bureau \\.h.sh .gitconfig .git-prompt.sh \\.ssh '



alias l='ls -lh --group-directories-first   | h -i drwx rw\\- root axel sites\-enabled default \\-\> "alias|pom.xml|.xml"    utils hcodejava hcode     '
