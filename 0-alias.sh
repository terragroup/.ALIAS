#!/bin/bash



# <!-- To specify DOM to use for an element’s local DOM, use the <dom-module> element. Give the <dom-module> an id attribute that matches its element’s is property and put a <template> inside the <dom-module>. Polymer will automatically clone this template’s contents into the element’s local DOM. -->


#-------------------------------------------------------------------------------
#  now
#-------------------------------------------------------------------------------
# 1

# 2

alias nn1='echo ">>>>> npm   install"               && sudo npm install;  echo ">>>>> bower install"                    && bower install'
alias nn2='echo ">>>>> bower ncu -u (package.json)" && sudo ncu -u;       echo ">>>>> bower ncu -m bower (bower.json)"  && sudo ncu -m bower'

# To update global packages, you can use
# npm install -g <package>:  npm -a/--upgradeAll;
alias nnn='nn1 && nn2'

# git clone https://github.com/regnou/3-P-todo
# curl -u 'regnou' https://api.github.com/user/repos -d '{"name":"3-P-todo"}'


# TOTAL
# First commit any outstanding code changes, and then, run this command:
# git rm -r --cached .
# This removes any changed files from the index(staging area), then just run:
# git add .
# Commit it:
# git commit -m ".gitignore is now working"


################################################################################
# AXEL ALIAS
################################################################################

alias ccd='cd /home/axel/com/axel'
alias ppy='python -m SimpleHTTPServer 8080'
alias ccp='cat gulpfile.js  | h -ni serve task src ".*//.*" "element|index|script|images|bower_components" app dist "static|pipe|require" gulp'
alias ccpp='cat gulpfile.babel.js  | h -ni serve task src ".*//.*" "element|index|script|images|bower_components" app dist "static|pipe|require" gulp'
alias ccb='cat bower.json  | h -ni iron polymer paper element layout "input|button|menu|drawer|panel|checkbox|fab|icon|flex|selector|style|toggle|toolbar|item|material|header"'
alias ccbb='ccp & ccb'

alias kkk="ack "

# clavier asus... bttn eteindre,
# lenovo - clavier PRO


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
alias aaaa='atom app/scripts/main.js app/styles/main.css app/index.html atom gulpfile.babel package.json bower.json  atom app/elements/elements.html atom app/elements/elements.html atom app/elements/axel/axel-app/axel-app.html  atom app/elements/axel/axel-body/axel-body.html  atom app/elements/axel/axel-header/axel-header.html  atom app/elements/axel/axel-footer/axel-footer.html'

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
alias sb='. $AXL_HOME_ALIAS/0-root.sh'   # alias sb='source ~/.bashrc'
#-------------------------------------------------------------------------------
# type function pour avoir la declaration
#-------------------------------------------------------------------------------
# TODO - a reparer sous ZSH
# alias ffun='compgen -A function  | grep -v '^[_]' | h -ni log dump fast_forward '
#-------------------------------------------------------------------------------
# moins important
#-------------------------------------------------------------------------------
alias df='df -h'
alias du='du -h'
alias mywget="wget http://redmine.mre.pub/projects/medicis-recap/repository"
#-------------------------------------------------------------------------------
#
#-------------------------------------------------------------------------------


# FAST AT HOME
# cd ~/com
alias cdd='cd ~/com/GO'

alias aalias='alias | h  = alias /home/axel com DL'

alias ss='source ~/.bashrc'
alias ggg='gulp serve'
alias aaz='atom '

alias bi='bower install'
alias ni='npm install'

#-------------------------------------------------------------------------------
#
#-------------------------------------------------------------------------------

alias cl='clear ; l'

alias yyy='yo polymer:el '

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
