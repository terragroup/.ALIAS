#!/bin/bash

alias ccd='cd /home/axel/com/GO/1-todo-list/app'
alias ppy='python -m SimpleHTTPServer 8080'
alias ccp='cat gulpfile.js  | h -ni serve task src ".*//.*" "element|index|script|images|bower_components" app dist "static|pipe|require" gulp'
alias ccpp='cat gulpfile.babel.js  | h -ni serve task src ".*//.*" "element|index|script|images|bower_components" app dist "static|pipe|require" gulp'
alias ccb='cat bower.json  | h -ni iron polymer paper element layout "input|button|menu|drawer|panel|checkbox|fab|icon|flex|selector|style|toggle|toolbar|item|material|header"'
alias ccbb='ccp & ccb'
alias nnp='npm install && bower install'



echo "-- BEGIN bash --"
################################################################################
# INSTALL PACKAGE - sudo dpkg -i DEB_PACKAGE
################################################################################
#-------------------------------------------------------------------------------
# log
#-------------------------------------------------------------------------------
alias cl="$AXL_HOME_ALIAS/bin/lnav"    # reader de log : attention : dependence BINAIRE
alias llog="cd $AXL_HOME/LOG"
#-------------------------------------------------------------------------------
# indispensable
#-------------------------------------------------------------------------------
alias cat='pygmentize -g '
alias cdcd="cd .."; alias rroot='cd /root'; alias oopt='cd /opt ';alias eetc='cd /etc ';alias mmnt='cd /mnt ';alias vvar='cd /var ';alias uusr='cd /usr ';
#-------------------------------------------------------------------------------
# TODO - ce grep peut etre TROP restrictif
#-------------------------------------------------------------------------------
alias grepc='grep --color=always';
alias grep='grep -Ei --color=always';
alias grepa='grep -HEin --color=always';
#-------------------------------------------------------------------------------
# compress
#-------------------------------------------------------------------------------
alias detar='tar -xvzf '
alias dezip='unzip'     #
# gzip -d fichier.gz    # decompress  gunzip (.gz)
#-------------------------------------------------------------------------------
# dangeureux
#-------------------------------------------------------------------------------
alias rmf='rm -rf'
#-------------------------------------------------------------------------------
# application
#-------------------------------------------------------------------------------
alias google='/opt/google/chrome/google-chrome &'
alias oopen='gnome-open .'
alias distance='remmina &'
alias vi='/usr/bin/vim'
alias idea="$AXL_HOME/dev/idea-13/bin/./idea.sh &"      # cat /home/axel/dev/idea-13 /home/axel/dev/idea-13/bin/idea64.vmoptions  # VM options are loaded from the IDE_HOME\bin\<product>[bits][.exe].vmoptions file.
alias aaa='atom .'
alias aapm='sudo apm install'
#-------------------------------------------------------------------------------
# directory +++
#-------------------------------------------------------------------------------
alias dl="cd $AXL_HOME/DL"
alias aatn="cd $AXL_HOME/com/atnv2"     # bureau
alias qq="cd $AXL_HOME/com/MEAN"     # home
alias aalias="cd $AXL_HOME/com/.ALIAS"     # bureau
#-------------------------------------------------------------------------------
# directory ---
#-------------------------------------------------------------------------------
alias leo='cd /home/ax/com/leo'
alias alog='rmf  a-rec-tomcat-atnv2.log && megalogrec && cl a-rec-tomcat-atnv2.log'
#-------------------------------------------------------------------------------
# fast file
#-------------------------------------------------------------------------------
alias rs='atom ~/.m2/settings.xml'
alias rc='atom $AXL_HOME_ALIAS'
alias sb='. $AXL_HOME_ALIAS/0-basic.sh'   # alias sb='source ~/.bashrc'
#-------------------------------------------------------------------------------
# type function pour avoir la declaration
#-------------------------------------------------------------------------------
alias ffun='compgen -A function  | grep -v '^[_]' | h -ni log dump fast_forward '
#-------------------------------------------------------------------------------
# moins important
#-------------------------------------------------------------------------------
alias df='df -h'
alias du='du -h'
alias mywget="wget http://redmine.mre.pub/projects/medicis-recap/repository"
################################################################################
# divers function
################################################################################
function mkcd() {
    `mkdir -m 700 "$1"`
    ret=`echo $?`
    if [ $ret -ne 0 ]; then
        `cd "$1"`
    else
        `cd "$1"`
    fi
}
# copie des settings de workspace exlipse
function cp_ws() {
    echo $1 '=>' $2 ;
    mkdir -p "$2/.metadata/.plugins/org.eclipse.core.runtime/"
    # ignorer en cas d'erreur
    mv "$2/.metadata/.plugins/org.eclipse.core.runtime/.settings" "$2/.metadata/.plugins/org.eclipse.core.runtime/.settings.old"
    cp -R "$1/.metadata/.plugins/org.eclipse.core.runtime/.settings" "$2/.metadata/.plugins/org.eclipse.core.runtime/.settings"
}
