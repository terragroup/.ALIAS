//##############################################################################
#
#                                   NODE + BOWER + PYTHON
#
##############################################################################//


# /usr/bin/env: node: No such file or directory
sudo ln -s /usr/bin/nodejs /usr/bin/node

# sudo ln -sf /usr/local/n/versions/node/<VERSION>/bin/node /usr/bin/node
sudo ln -sf /usr/local/n/versions/node/5.8.0/bin/node /usr/bin/node



################################################################################
# PYTHON
################################################################################
python -m SimpleHTTPServer 8080
or with Python 3 python -m http.server 8080)


################################################################################
# GULP
################################################################################
gulp serve

# reload les modifs des .js
gulp.watch(['app/**/*.js'], reload);


################################################################################
# ALGORITHME
################################################################################
algorithme du sac a dos


################################################################################
# TESTS JAVA
################################################################################
imdv > test > java > fr
click droit sur JAVA > debug ALL TEST


################################################################################
# SHELL
################################################################################
# bash color prompt
https://github.com/powerline/powerline

# zsh cool
https://github.com/robbyrussell/oh-my-zsh


################################################################################
# UNIX
################################################################################

CTRL + e                      = ?
CTRL + t                      = open terminal
setxkbmap fr                  = change setting keyboard
super + d                     = montrer le bureau

# select zone rapide > dans cmd Mint
shutter -s

shutter -s

################################################################################
# vi
################################################################################
# activier les lignes dans VI
:set number
:%s/a/b



################################################################################
# MINT
################################################################################
# booster mint - /etc/sysctl.conf
vm.swappiness=10            # Decrease swap usage to a more reasonable level
vm.vfs_cache_pressure=50    # Improve cache management
sudo apt-get purge apt-xapian-index # remove inde de merde


################################################################################
# GCLOUD
################################################################################
# web starter kit + GAE
gcloud auth login


################################################################################
# YEOMAN
################################################################################
mkdir -p my-project && cd $_
yo meanstack
