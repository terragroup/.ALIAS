#!/bin/bash
################################################################################
# LS
################################################################################
LS_EXTENSION="\
\\.xml|\\.yml\
|\\.json|\\.js\
|\\.java\
|\\.tar.gz|\\.jar|\\.gz\
|\\.sh|\\.png|\\.jpg|\\.gif|\\.jsp|\\.svg\
|\\.war|\\.ear\
|\\.css\
|\\.log"

LS_ALIAS="\\.gitconfig|\\.ssh|pom.xml|gulpfile.js|package.json"
LS_RIGHT="drwx|rw\\-|root|axel|ax"

LS_HOME_DIR="com|Bureau|DL|\\.m2|atn_v2|\\.bashrc"
LS_NGINX_DIR="sites-available|sites-enabled|nginx.conf|default"
LS_SRC_DIR="bin|lib|LICENCE|RELEASE|README|index|log|build|src"
LS_MVN_DIR="target|SNAPSHOT|classes|WEB-INF"
# LS_JS_DIR=""
LS_DIR="$LS_HOME_DIR|$LS_MVN_DIR|$LS_SRC_DIR|$LS_NGINX_DIR" #$LS_JS_DIR

LS_ALL="\
$LS_EXTENSION \
$LS_ALIAS \
$LS_RIGHT \
$LS_DIR \
"

# startup shutdown
#-------------------------------------------------------------------------------
#ls -CF

alias    la='ls -A  --group-directories-first   | h -i $LS_ALL ' # -A: all but . and ..
alias   lla='ls -la --group-directories-first   | h -i $LS_ALL '
alias     l='ls -lh --group-directories-first   | h -i $LS_ALL '
