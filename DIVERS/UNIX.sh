//##############################################################################
# 
#                                   UNIX
# 
##############################################################################//

# ------------------------------------------------------------------------------
# SSH A FAIRE
# ----------------------------------------------------------------------------
// TODO : 
1 - autocomplete comme zsh (navigation)
2 - m si 1ere lettre est mauvaise : faire auto-complete //


################################################################################
# MINT
################################################################################
# booster mint - /etc/sysctl.conf
vm.swappiness=10            # Decrease swap usage to a more reasonable level
vm.vfs_cache_pressure=50    # Improve cache management
sudo apt-get purge apt-xapian-index # remove inde de merde



################################################################################
# UNIX
################################################################################

CTRL + e                      = ?
CTRL + t                      = open terminal
setxkbmap fr                  = change setting keyboard
super + d                     = montrer le bureau

# select zone rapide > dans cmd Mint
shutter -s



################################################################################
# vi
################################################################################
# activier les lignes dans VI
:set number
:%s/a/b



################################################################################
# DEBIAN
################################################################################
# apt-get update
# apt-get upgrade
# ------------------------------------------------------------------------------
apt-get install nodejs
apt-get install npm
# ------------------------------------------------------------------------------
apt-get install guake
apt-get install gedit-plugins
apt-get install libcurl4-gnutls-dev libexpat1-dev gettext libz-dev libssl-dev build-essential
apt-get install python-pygments
# ------------------------------------------------------------------------------
apt-get install xclip && xclip -sel clip < ~/.ssh/id_rsa.pub
apt-get install zsh
apt-get install curl
apt-get install most
apt-get install ack-grep
apt-get install tree
# ------------------------------------------------------------------------------
# paoloantinori/hhighlighter
# https://github.com/paoloantinori/hhighlighter#screenshots
curl http://beyondgrep.com/ack-2.08-single-file > ~/bin/ack && chmod 0755 !#:3
