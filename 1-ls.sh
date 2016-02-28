#!/bin/bash
################################################################################
# LS
################################################################################
LS_EXTENSION="\
\\.xml|\\.yml\
|\\.json|\\.js\
|\\.java\
|\\.tar.gz|\\.jar|\\.gz|\\.zip\
|\\.sh|\\.png|\\.jpg|\\.gif|\\.jsp|\\.svg\
|\\.war|\\.ear\
|\\.css|\\.md\
|\\.log"

LS_ALIAS="\\.gitconfig|\\.ssh|pom.xml|gulpfile.js|package.json"
LS_RIGHT="drwx rw\\-|root|axel|ax"
LS_HOME_DIR="com|Bureau|Desktop|DL|\\.m2|atn_v2|\\.bashrc"
LS_NGINX_DIR="sites-available|sites-enabled|nginx.conf|default"
LS_SRC_DIR="bin|lib|LICENCE|RELEASE|README|index|log|build|src"
LS_MVN_DIR="target|SNAPSHOT|classes|WEB-INF"
# LS_JS_DIR=""
LS_DIR="$LS_HOME_DIR|$LS_MVN_DIR|$LS_SRC_DIR|$LS_NGINX_DIR" #$LS_JS_DIR

LS_DIR_2="alias|starter-kit|package|gulpfile|babel|app|docs  rc \\.git|\\.gitignore|\\.gitattributes|\\.gitconfig"

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
alias     l='ls -lh --group-directories-first   | awk '"'"'{print $1, $9}'"'"'  | h -ni $LS_ALL | h -ni $LS_NUM  | h -ni LS_NUM_TIRET  '

alias     la='ls -la --group-directories-first   | awk '"'"'{print $1, $9}'"'"'  | h -ni $LS_ALL | h -ni $LS_NUM  | h -ni LS_NUM_TIRET  '
alias    lla='ls -A  --group-directories-first   | h -i $LS_ALL ' # -A: all but . and ..
