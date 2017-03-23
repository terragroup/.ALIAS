#!/bin/bash

 # ------------------------------------------------------------------------------
 # MAN grep
 # -E use extended regex;
 # -o output only the matched text instead of the full line)
 # ------------------------------------------------------------------------------
 # ASTUCE : comme cela je sais les fichiers qui sont lies
 alias now="gs f3c8275 | grepc 'getfilter|diff \-\-' | h -ni '\.java|src/main/java/com/groupemre/atnv2/'"

 # refaire pour mettre jsute le nom du fichier
 # gs f3c8275 | grep 'getfilter|diff \-\-' | h -ni '([^/.*\.java]|)+$'
 # ------------------------------------------------------------------------------

 # AXEL - c'est TROP restrictif
 # alias grepc='grep --color=always';
 # alias grepa='grep -HEin --color=always';

# adde|cgr|kinepolis|ymagis|globecast|smartjog

# https://www.jetbrains.com/idea/help/finding-usages-in-project.html

#########################################################################>
# BEST OF TECHNIQUE GREP
#########################################################################>
# TECHNIQUE GREP 1 : supprimer les lignes inutiles
# grep -v "DATABASECHANGELOG|executed|changeset"

# TECHNIQUE GREP 2 : pour afficher les 4 lignes qui suivent le GREP
# grep -A 4 preprodatnv2

# TECHNIQUE GREP 3 : le $ a la fin permet de faire un GREP mais laisse tout le reste du fichier
# grep  "47|$"








################################################################################
# file search
################################################################################
# ------------------------------------------------------------------------------
# LOCATE (regarde partout)
# ------------------------------------------------------------------------------
# 1 - MY FIND (dans tous les repertoires fils) --
function llocate(){
  locate $1 | grep `pwd`
}

# ------------------------------------------------------------------------------
# FIND
# ------------------------------------------------------------------------------
# 1 - find /path/to/look/in -name '*somestring*' -print
function fff(){
  find . -name $1 -print | h -n popo $1| h bower_components
}


################################################################################
################################################################################
################################################################################
################################################################################
# string search (tous les SOUS directory)
################################################################################
################################################################################
################################################################################
################################################################################

# ------------------------------------------------------------------------------
# GREP
# ------------------------------------------------------------------------------
# 1 - SEARCH EVERY WHERE
# grep -rnwl '/' -e "/var/atn/frontend/atnv2"
#
# 2 - autre
# grep --exclude-dir={target} -rnwi . -e "ymagis"
#
# 3 - GREP = comment reccuperer une sortie plus "complexe"
# grep -Ei '.*/|$'


# ------------------------------------------------------------------------------
# ACK (text search)
# ------------------------------------------------------------------------------
# alias ack='ack-grep'

# 1 - Replace with ACK
# ack-grep --print0 -irl 'Online' | xargs -0 -L1 sed  -i 's/Online/Healthy/g'

# 2 - -H : force filename
alias sss='ack -H --ignore-dir=target --ignore-dir=.idea --ignore-dir=bower_components --ignore-dir=node_modules  --ignore-dir=dist'

# 3 - ack-grep  "ymagis"  --ignore-dir=target --ignore-dir=.idea
#

# ack-grep -H --ignore-dir=target --ignore-dir=.idea multirouter.smartjog.certificat
# grep -rnwl '/' -e "multirouter.smartjog.certificat"
