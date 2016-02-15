#!/bin/bash
################################################################################
# SSH - ATN
################################################################################

# ------------------------------------------------------------------------------
# GERER LES KEYS
# repertoire DISTANT .SSH/ authorized_key  (TODO : y copier la clef pub source, dans ce fichier)
# repertoire SOURCE (qui veut se connecter sur le distant) .SSH/RSA.PUBLIC
# ------------------------------------------------------------------------------


# ------------------------------------------------------------------------------
# Sur jcont => /var/lib/jenkins/.m2/settings-atnv2.xml
# Le settings.xml doit etre sur jenkins contuinue
# ------------------------------------------------------------------------------

# ------------------------------------------------------------------------------
# Connexion distante PGSQL
# ------------------------------------------------------------------------------
alias prod_remote_cnx="psql -d atnv2_prod -U bo_alim -h $PROD_DB_DOMAIN"  # password : atnv2_prod
alias  rec_remote_cnx="psql -d atnv2_preprod -U atnv2_preprod -h $REC_DB_DOMAIN"  # password : atnv2_preprod
# ------------------------------------------------------------------------------
# PROD        - RED
# ------------------------------------------------------------------------------
alias          prodbdd='sshpass -p "innovation" ssh root@'$PROD_DB_DOMAIN
alias          prodwww='sshpass -p "innovation" ssh root@'$PROD_WWW_DOMAIN
# ------------------------------------------------------------------------------
# REC           - BLUE
# ------------------------------------------------------------------------------
alias           recbdd='sshpass -p "innovation" ssh root@'$REC_DB_DOMAIN
alias           recwww='sshpass -p "innovation" ssh root@'$REC_WWW_DOMAIN
# alias           recweb="sshpass -p \"innovation\" ssh root@$x_PROD_DB_DOMAIN_DOMAIN -o LocalCommand=\"echo hello\""
# alias           recweb="sshpass -p \"innovation\" ssh root@$x_PROD_DB_DOMAIN_DOMAIN -t \"bash --rcfile /home/axel/alias/1-ssh -i\" "
# alias           recweb="sshpass -p \"innovation\" ssh root@$x_PROD_DB_DOMAIN_DOMAIN <(echo \". /home/axel/alias/1-ssh\")"
# ------------------------------------------------------------------------------
# JENKINS     - purple
# ------------------------------------------------------------------------------
alias       jdev='sshpass -p "innovation" ssh root@'$J_DEV_DOMAIN
alias      jprod='sshpass -p "innovation" ssh root@'$J_PROD_DOMAIN
alias      jcont_old='sshpass -p "innovation" ssh root@'$J_CONT_DOMAIN
alias      jcont='sshpass -p "innovation" ssh root@'$J_CONT_DOMAIN_2
################################################################################
# SSH - MEDICIS
################################################################################
alias       prodbddmds='sshpass -p "innovation" ssh root@MDSBDD'
# alias       prodmdsweb='sshpass -p "innovation" ssh root@MDSAPPLI'
################################################################################
# repertoires distants a monter
################################################################################
# ------------------------------------------------------------------------------
# COMMON
# ------------------------------------------------------------------------------
function common_mount(){
  sudo mount -t cifs -o gid=axel,uid=axel,username=aregnoult,pass=bonjour,sec=ntlm //MRE-NCS1-APPS/APPS          /mnt/apps;
  sudo mount -t cifs -o gid=axel,uid=axel,username=aregnoult,pass=bonjour,sec=ntlm //MRE-NCS1-GROUPS/GROUPS      /mnt/groups;
  sudo mount -t cifs -o gid=axel,uid=axel,username=aregnoult,pass=bonjour,sec=ntlm //MRE-NCS1-ARCHIVES/ARCHIVES  /mnt/archives;
  sudo mount -t cifs -o gid=axel,uid=axel,username=aregnoult,pass=bonjour,sec=ntlm //MRE-NCS1-USERS/USERS        /mnt/users;
  # fstab://MRE-NCS1-APPS/APPS /mnt/apps cifs credentials=/etc/mount_credentials,gid=atnv2,uid=atnv2,sec=ntlm 0 0
  # fstab://MRE-NCS1-ARCHIVES/ARCHIVES /mnt/archives cifs credentials=/etc/mount_credentials,gid=atnv2,uid=atnv2,sec=ntlm 0 0
  # fstab://MRE-NCS1-GROUPS/GROUPS /mnt/groups cifs credentials=/etc/mount_credentials,gid=atnv2,uid=atnv2,sec=ntlm 0 0
  # fstab://10.196.165.224/N /mnt/N cifs credentials=/etc/mount_credentials,gid=atnv2,uid=atnv2,sec=ntlm 0 0
}
# ------------------------------------------------------------------------------
# PROD : dir N (spot globalcast...)
# ------------------------------------------------------------------------------
function prod_mount(){
  sudo mount -t cifs -o gid=axel,uid=axel,username=adminmv,pass=innovation,sec=ntlm //10.196.164.48/N /mnt/N-PROD; # 10.196.164.48 = PRODATNV2GBLC.mre.pub
}
# ------------------------------------------------------------------------------
# REC : dir N (spot globalcast...)
# ------------------------------------------------------------------------------
function rec_mount(){
  sudo mount -t cifs -o gid=axel,uid=axel,username=adminmv,pass=innovation,sec=ntlm //10.196.165.224/N /mnt/N-REC;   # 10.196.165.224 = preprodatnv2gblc.mre.pub
  # PREPRODATN/Lecteur\ N /mnt/N
  # file_mode=0666,dir_mode=0777,
}
# ------------------------------------------------------------------------------
# USB
# ------------------------------------------------------------------------------
function usb(){
  sudo mount -t cifs -o gid=axel,uid=axel,username=adminmv,pass=innovation,sec=ntlm //10.196.164.108/archives/GROUPS/COMMUNS/ATNV2 /mnt/USB;
}





################################################################################
# OTHERS
################################################################################
# PROD        - RED
#             bind "set completion-ignore-case on"; TT_HOST="$(tput setb 4)"; TT_USER="$(tput setb 4)"; T="$(tput setaf 1)"; RED="$(tput setaf 1)"; GREEN="$(tput setaf 2)"; YELLOW="$(tput setaf 3)"; END="$(tput sgr0)";  alias rroot="cd /root"; alias cdcd="cd .."; alias grep='grep -HEin --color=always'; alias l='ls -CF --group-directories-first '; alias oopt='cd /opt ';alias eetc='cd /etc ';alias mmnt='cd /mnt ';alias vvar='cd /var ';alias uusr='cd /usr '; PS1='\n\n\n$GREEN$(dirname $(pwd))$END$RED \W $END\[\033[01;33m\]$END          $(echo $?) |$YELLOW \A $END| \d | $TT_HOST \H $END | $TT_USER \u $END\n  '
# REC         - BLUE
#             bind "set completion-ignore-case on"; TT_HOST="$(tput setb 1)"; TT_USER="$(tput setb 4)"; T="$(tput setaf 1)"; RED="$(tput setaf 1)"; GREEN="$(tput setaf 2)"; YELLOW="$(tput setaf 3)"; END="$(tput sgr0)";  alias rroot="cd /root"; alias cdcd="cd .."; alias grep='grep -HEin --color=always'; alias l='ls -CF --group-directories-first '; alias oopt='cd /opt ';alias eetc='cd /etc ';alias mmnt='cd /mnt ';alias vvar='cd /var ';alias uusr='cd /usr '; PS1='\n\n\n$GREEN$(dirname $(pwd))$END$RED \W $END\[\033[01;33m\]$END          $(echo $?) |$YELLOW \A $END| \d | $TT_HOST \H $END | $TT_USER \u $END\n  '
# JENKINS     - purple
#             bind "set completion-ignore-case on"; TT_HOST="$(tput setb 5)"; TT_USER="$(tput setb 5)"; T="$(tput setaf 1)"; RED="$(tput setaf 1)"; GREEN="$(tput setaf 2)"; YELLOW="$(tput setaf 3)"; END="$(tput sgr0)";  alias rroot="cd /root"; alias cdcd="cd .."; alias grep='grep -HEin --color=always'; alias l='ls -CF --group-directories-first '; alias oopt='cd /opt ';alias eetc='cd /etc ';alias mmnt='cd /mnt ';alias vvar='cd /var ';alias uusr='cd /usr '; PS1='\n\n\n$GREEN$(dirname $(pwd))$END$RED \W $END\[\033[01;33m\]$END          $(echo $?) |$YELLOW \A $END| \d | $TT_HOST \H $END | $TT_USER \u $END\n  '
################################################################################
# TODO -
# color HOST : prod, rec, local
# color HOST 2 : WEB, BDD, jenkins
# color USER : root, atnv2, postgres
################################################################################
