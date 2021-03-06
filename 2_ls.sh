#!/bin/bash

################################################################################
# LS
################################################################################
# |.*json|.*.js \
LS_EXTENSION="\
\\.xml|\\.yml\
|\\.java\
|\\.tar.gz|\\.jar|\\.gz|\\.zip\
|\\.sh|\\.png|\\.jpg|\\.gif|\\.jsp|\\.svg\
|\\.war|\\.ear\
|\\.css|\\.md\
|\\.log"
# |gulpfile|package
LS_ALIAS="\\.gitconfig|\\.ssh|pom.xml"
LS_RIGHT="drwx rw\\-|root|axel|ax|togezer"
LS_HOME_DIR="com|Bureau|Desktop|DL|\\.m2|atn_v2|\\.bashrc"
LS_NGINX_DIR="sites-available|sites-enabled|nginx.conf|default"
LS_SRC_DIR="bin|lib|LICENCE|RELEASE|README|index|log|build|src"
LS_MVN_DIR="target|SNAPSHOT|classes|WEB-INF"
# LS_JS_DIR=""
LS_DIR="$LS_HOME_DIR|$LS_MVN_DIR|$LS_SRC_DIR|$LS_NGINX_DIR" #$LS_JS_DIR
LS_DIR_2="alias|starter-kit  rc \\.git|\\.gitignore|\\.gitattributes|\\.gitconfig"
# package|gulpfile|babel|app|docs

LS_ALL="\
$LS_EXTENSION \
$LS_ALIAS \
$LS_RIGHT \
$LS_DIR \
$LS_DIR_2 \
"

# startup shutdown
#-------------------------------------------------------------------------------
#ls -CF
# alias     l='ls -lh --group-directories-first   | h -i $LS_ALL '
# LS_NUM="\s0 \s1 \s2 \s3 \s4 \s5 \s6 \s7 \s8 \s9"
LS_NUM="\s0\\-.* \s1\\-.* \s2\\-.* \s3\\-.* \s4\\-.* \s5\\-.* \s6\\-.* \s7\\-.* \s8\\-.* \s9\\-.*"
LS_NUM_TIRET="popo"
# LS_NUM="popo"
# alias     la='ls -la'
# alias     l='ls  -nlXa --group-directories-first | h 1- 2- 3- 4- 5- 6- 7- 8- 9- | h js json md html css rc | h -ni app bower element script gulpfile babel package | h -ni node module index'
# tout defaire ici
# alias     ll='ls'
# | h 1- 2- 3- 4- 5- 6- 7- 8- 9- \
# //////////////////////////////////////////////////////////////////////////////
# LE BON LS d habitude
# //////////////////////////////////////////////////////////////////////////////
# alias     l='tree  -LACa 1 --dirsfirst \
#     | h -ni  popo pipi lolo popo popo popo pipi popo "gulpfile|json|bower|babel|html|css|rc|node|module|index|hint|lint" \
#     '
# //////////////////////////////////////////////////////////////////////////////
# TMP
# alias l='ls -a'
# alias     ll='tree  -LACa 2 --dirsfirst \
#         | h -ni  popo pipi lolo popo popo popo pipi popo "gulpfile|json|bower|babel|html|css|rc|node|module|index|hint|lint" \
#         '
#
# alias     la='tree  -LAaC 1 --dirsfirst '
# alias     ls='ls -lh --group-directories-first   | awk '"'"'{print $1, $9}'"'"'  | h -ni $LS_ALL | h -ni $LS_NUM  | h -ni LS_NUM_TIRET  '

# alias     la='ls -la --group-directories-first   | awk '"'"'{print $1, $9}'"'"'  | h -ni $LS_ALL | h -ni $LS_NUM  | h -ni LS_NUM_TIRET  '
# alias    lla='ls -A  --group-directories-first   | h -i $LS_ALL ' # -A: all but . and ..

#  | awk '"'"'{print $1, $9}'"'"'  | h -ni $LS_ALL | h -ni $LS_NUM  | h -ni LS_NUM_TIRET
# alias     l='ls -a --group-directories-first'
# alias     l='ls -a --group-directories-first'
# . com/.ALIAS/0-root.sh
