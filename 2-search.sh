#!/bin/bash


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
function flocate(){
  locate $1 | grep `pwd`
}

# ------------------------------------------------------------------------------
# FIND
# ------------------------------------------------------------------------------
# 1 - find /path/to/look/in -name '*somestring*' -print


################################################################################
# string search (tous les SOUS directory)
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
# ACK
# ------------------------------------------------------------------------------
alias ack='ack-grep'

# 1 - Replace with ACK
# ack-grep --print0 -irl 'Online' | xargs -0 -L1 sed  -i 's/Online/Healthy/g'

# 2 - -H : force filename
alias wh='ack -H --ignore-dir=target --ignore-dir=.idea'

# 3 - ack-grep  "ymagis"  --ignore-dir=target --ignore-dir=.idea
#

# ack-grep -H --ignore-dir=target --ignore-dir=.idea multirouter.smartjog.certificat
# grep -rnwl '/' -e "multirouter.smartjog.certificat"
