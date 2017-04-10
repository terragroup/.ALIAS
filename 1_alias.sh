#!/bin/bash

# du -ah | sort -nr | awk '{usage=$1; $1="";cmd="file "$0;cmd |& getline type;print usage,type ;close(cmd)}'
# du -ah | sort -nr | awk '{usage=$1; $1="";}  '
# du -ah | sort -nr | awk '
# {usage=$1;
# $1="";
# cmd="file "$0;cmd |& getline type;
# print usage,type ;
# close(cmd)}'


# lftp ftp://test6@myterra.fr     # hjxs3A9d

################################################################################
# HUGO
################################################################################

alias hh="hugo; hugo serve | h http://localhost: /Users/axel/com/HUGO/ content created copied unable "
alias hf="find public -type f -name '*.html' | xargs ls -l | h public"



################################################################################
# NEW
################################################################################

alias tl="tree -L 2"






################################################################################
# AXEL ALIAS
################################################################################
alias kkk="ack "

alias PPATH="echo $PATH"

#-------------------------------------------------------------------------------
# indispensable
alias cat='pygmentize -g '
alias cdcd="cd .."; alias rroot='cd /root'; alias oopt='cd /opt ';alias eetc='cd /etc ';alias mmnt='cd /mnt ';alias vvar='cd /var ';alias uusr='cd /usr ';
#-------------------------------------------------------------------------------
# WARN - ce grep peut etre TROP restrictif
alias grepc='grep --color=always';
alias grep='grep -Ei --color=always';
alias grepa='grep -HEin --color=always';
#-------------------------------------------------------------------------------
# compress
alias detar='tar -xvzf '
alias dezip='unzip'
alias degz='gzip -d' # decompress  gunzip (.gz)
#-------------------------------------------------------------------------------
# dangeureux
alias rmf='rm -rf'
#-------------------------------------------------------------------------------
# application
# alias google='/opt/google/chrome/google-chrome &'
# alias oopen='gnome-open .'
# alias distance='remmina &'
# alias vi='/usr/bin/vim'
alias idea="$AXL_HOME/dev/idea-13/bin/./idea.sh &"      # cat /home/axel/dev/idea-13 /home/axel/dev/idea-13/bin/idea64.vmoptions  # VM options are loaded from the IDE_HOME\bin\<product>[bits][.exe].vmoptions file.
#-------------------------------------------------------------------------------
# fast file
alias rs='atom ~/.m2/settings.xml'
alias rc='atom $AXL_HOME_ALIAS'
alias sb='. ~/.zshrc'   # alias sb='source ~/.bashrc'


#-------------------------------------------------------------------------------
# DEV
#-------------------------------------------------------------------------------
# js
alias bi='bower install'
alias ni='npm install'
alias yyy='yo polymer:el '
alias ggg='gulp serve | h -ni css finished lint styles app js serving 3000 3001 starting reloading PSK'

# atom
alias aapm='sudo apm install'
alias aaz='atom '
alias aaa='atom .'
alias aaaa='atom app/scripts/main.js app/styles/main.css app/index.html atom gulpfile.babel package.json bower.json  atom app/elements/elements.html atom app/elements/elements.html atom app/elements/axel/axel-app/axel-app.html  atom app/elements/axel/axel-body/axel-body.html  atom app/elements/axel/axel-header/axel-header.html  atom app/elements/axel/axel-footer/axel-footer.html'

# NET WWW
alias mywget="wget http://redmine.mre.pub/projects/medicis-recap/repository"

# UNIX
alias ss='source ~/.bashrc'
alias aalias='alias | h  = alias /home/axel com DL'

# GOOD - savoir la taille d'un dossier
# alias ddu='du -sh * | sort -nr'
alias ddu="du -sh  *      | sort -n | h -ni 'G\t' 'K\t' 'M\t'"
alias ddf="du -sh .[!.]*  | sort -n | h -ni 'G\t' 'K\t' 'M\t'"
alias ddd='ddu ; echo "\n\nFILES\n"; ddf'

# alias df='df -h'          # SAVOIR LA TAILLE ESPACE DISC
# alias du='du -h'

# alias cl='clear ; l'
# type function pour avoir la declaration
# TODO - a reparer sous ZSH
# alias ffun='compgen -A function  | grep -v '^[_]' | h -ni log dump fast_forward '

##########################################
##########################################
##########################################
##########################################
# DETAIL FONCTION
##########################################
alias ppy='python -m SimpleHTTPServer 8080'
alias ccp='cat gulpfile.js  | h -ni serve task src ".*//.*" "element|index|script|images|bower_components" app dist "static|pipe|require" gulp'
alias ccpp='cat gulpfile.babel.js  | h -ni serve task src ".*//.*" "element|index|script|images|bower_components" app dist "static|pipe|require" gulp'
alias ccb='cat bower.json  | h -ni iron polymer paper element layout "input|button|menu|drawer|panel|checkbox|fab|icon|flex|selector|style|toggle|toolbar|item|material|header"'
alias ccbb='ccp & ccb'

alias alog='rmf  a-rec-tomcat-atnv2.log && megalogrec && cl a-rec-tomcat-atnv2.log'

alias ooo='atom .ALIAS com'

alias nn1='echo ">>>>> npm   install "               &&  npm install ;  echo ">>>>> bower install"                    && bower install | h -ni bower gulp npm install polymer '
alias nn2='echo ">>>>Ø> bower ncu -u (package.json)" &&  sudo ncu -u | h -ni bower gulp npm install polymer ;       echo ">>>>> bower ncu -m bower (bower.json)"  &&  sudo ncu -m bower -u | h -ni bower gulp npm install polymer '

# To update global packages, you can use
# npm install -g <package>:  npm -a/--upgradeAll;

# clavier asus... bttn eteindre,
# lenovo - clavier PRO
# log
alias cl="$AXL_HOME_ALIAS/bin/lnav"    # reader de log : attention : dependence BINAIRE
alias llog="cd $AXL_HOME/LOG"

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

function ffast()
{
  rmf *
  sudo rmf node_modules
  git clone https://github.com/StartPolymer/polymer-starter-kit-plus.git
  chmod 666 *
}
# refaire passwd axel
# sudo passwd axel
# change default shell
# chsh -s /bin/zsh
# // TODO :
# 1 - autocomplete comme zsh (navigation)
# 2 - m si 1ere lettre est mauvaise : faire auto-complete //
# https://github.com/robbyrussell/oh-my-zsh //
# changer taille terminal terminator
# ~/.config/terminator/config
#       size = 900, 600
# a chercher :
# - rajouter le PWWD dans sudo directement au lieu de le rataper
# ----------------------------------------------------
# INSTALL PACKAGE
# sudo dpkg -i .deb
# sudo dpkg - --force-depends --install .deb
# ----------------------------------------------------
# alias     ls='ls -lh --group-directories-first   | awk '"'"'{print $1, $9}'"'"'  | h -ni $LS_ALL | h -ni $LS_NUM  | h -ni LS_NUM_TIRET  '
# desinstaller le programme SCREEN - quel est la cmd uninstall
#
# brew list (installed packages)
# brew leaves (installed pck without dependencies = BETTER)
# pkgutil --pkgs
# help("modules")

# MAC - DESINSTALLE
# rm -rf /Applications/Vagrant
# rm -f /usr/local/bin/vagrant
# sudo pkgutil --forget com.vagrant.vagrant
