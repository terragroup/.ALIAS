#!/bin/bash

################################################################################
# DEBIAN
################################################################################
apt-get update
# apt-get upgrade
# ------------------------------------------------------------------------------
apt-get install guake
apt-get install gedit-plugins
apt-get install libcurl4-gnutls-dev libexpat1-dev gettext libz-dev libssl-dev build-essential
apt-get install python-pygments
apt-get install nodejs
apt-get install xclip && xclip -sel clip < ~/.ssh/id_rsa.pub
apt-get install zsh
apt-get install curl
apt-get .install most
apt-get install ack-grep
apt-get install tree
# ------------------------------------------------------------------------------
# paoloantinori/hhighlighter
# https://github.com/paoloantinori/hhighlighter#screenshots
curl http://beyondgrep.com/ack-2.08-single-file > ~/bin/ack && chmod 0755 !#:3

################################################################################
# CHROME
################################################################################
# LEVEL 1
AdBlock / uBlock
G-calize
Google Art Project
EditThisCookie
Dark Skin for Youtube
Multi-highlight
# LEVEL ?
calculette ?
KIMONO LAB (pour le crawling)
# LEVEL 2
Bookmark Manager
Todoist: Liste de tâches 4.5.0
Extensions HotKey
Postman
Pearls Extension
Page Captures d écran Web - Fireshot
MultiHighlighter
Bureau à distance Google Chrome
Chrome Dev Editor (developer preview)
Chrome RDP for Google Cloud Platform

################################################################################
# ECLIPSE
################################################################################
myLyn - tache ou plugin couleur mon code (lie git) - git + eclipse


################################################################################
# ALGORITHME
################################################################################
algorithme du sac a dos

################################################################################
# AUTRES
################################################################################
# # get them
# f 'GOOGLE : wget -c https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb'
# wget -c https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
# f 'rmf git-1.8.1.2.tar.gz'
# rmf git-1.8.1.2.tar.gz
# f 'GIT : wget https://git-core.googlecode.com/files/git-1.8.1.2.tar.gz'
# wget https://git-core.googlecode.com/files/git-1.8.1.2.tar.gz
# # -------------------------------------
# titre '2 INSTALL THEM > OPT'
# # -------------------------------------
# f 'GOOGLE : dpkg -i ../DL/google-chrome-stable_current_i386.deb'
# dpkg -i ../DL/google-chrome-stable_current_i386.deb
# f 'tar -zxf ../DL/git-1.8.1.2.tar.gz'
# tar -zxf ../DL/git-1.8.1.2.tar.gz
# -------------------------------------
# titre '3 GIT'
# -------------------------------------
# mv git-1.8.1.2 /opt/git
# rmf git-1.8.1.2
# cd /opt/git  && make prefix=/usr/local all  && make prefix=/usr/local install
# update git = git clone git://git.kernel.org/pub/scm/git/git.git
