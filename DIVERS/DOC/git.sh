#!/bin/bash

# --------------------------------------------
# GIT
# --------------------------------------------

function git_change_commited(){

# si pas push => tu utilises --amend
# sinon :
 git rebase -i HEAD~2
 # tu changes avec EDIT (au lieu de pick)
 git commit --amend
}


function git_init(){
  # git init
  git config --global user.name "regnou"
  git config --global user.email "regnou.a@gmail.com"
  git config --global push.default simple
  # git config -l | grep origin
  # remote.origin.url=https://github.com/regnou/paris-master.git
  # git config remote.origin.url git@github.com:regnou/paris-master.git
  # git config remote.origin.url https://regnou.a:5xjwfBDo@github.com/regnou/paris-master.git
  git config --global url."https://regnou@github.com"
  git config --global credential.helper 'cache --timeout=28800'
  # ----------------------------------------------------------------------------
  git clone              https://github.com/regnou/paris-master.git
  # ou
  git remote add origin  https://github.com/regnou/paris-master.git
  #
  git init
  git commit -m "first commit : projet vierge"
  git remote add origin git@github.com:regnou/regnou/paris-master.git
  git push -u origin master
}

function create_project(){
  echo "# DEMO" >> README.md
  git init
  git add README.md
  git commit -m "first commit"
  git remote add origin https://github.com/regnou/DEMO.git
  git push -u origin master
  #git push --set-upstream origin master
  git branch --set-upstream-to=origin/master-dev master
}

function generate_ssh_key(){
  # GENERATE SSH KEY
  # https://help.github.com/articles/generating-ssh-keys/

  # start the ssh-agent in the background
  # Add your SSH key to the ssh-agent:
  # test connexion
  ssh-keygen -t rsa -b 4096 -C "regnou.a@gmail.com"
  eval "$(ssh-agent -s)"
  ssh-add ~/.ssh/id_rsa
  ssh -T git@github.com
  ssh -T -p 443 git@ssh.github.com

  # pour sauvegrade la connexion
  ~/.ssh/config :
  # Host github.com
  Hostname ssh.github.com
  Port 443
}



#!/bin/bash


# tu reccuperes le dernier commit et le place ou il le faut
#  git reset --soft HEAD^

# from DARTY HUNOUT - conseil merge
# se mettre sur oms_cuu et faire un REBASE origin/master
# puis se mettre sur master (je crois) et faire un merge normal
# comme cela, il y a moins de merges a faire, c est plus SIMPLE
#
# ou alors si on veut garder la parralelisation, il vaut mieux faire un merge
# ------------------------------------------------
# apres git pull, il te faut un git merge, OU ALORS tu fais git fetch



# vive la git diff - atlassian
# http://blogs.atlassian.com/2013/06/git-diff/


################################################################################
# GIT (axel)
################################################################################

# savoir origin repo
# git remote -v


# ------------------------------------------------------------------------------
# EN COURS             refs  #numero
# SI C EST OK          fixes #numero
# ------------------------------------------------------------------------------
# git config --global core.excludesfile ~/.gitignore
# git clone git@github.com:regnou/DEMO.git
# ------------------------------------------------------------------------------

# ------------------------------------------------------------------------------
# Gestion branches
# ------------------------------------------------------------------------------
# > delete branch
# git branch -d ou -D

# ------------------------------------------------------------------------------
# differents affichages
# ------------------------------------------------------------------------------
 # gl
 # gl0
 # gl1
 # gl2
 # gl3
 # gl4
 # gll
 # gd
 # gdf
 # gs
 # gsf
 # bb

# ------------------------------------------------------------------------------
# @@ -start,count +start,count @@
# ----------------------------------


# MERGE
################################################################################
# "^diff --git.*|^index.*|^\-\-\- a/.*|^\+\+\+ b/.*" \
# gs f3c8275 | grep 'diff \-\-.*([^/]|)+$'

# GL
################################################################################
# '\[maven-release-plugin\] prepare for next development iteration|\[maven-release-plugin\] prepare release|<Jenkins CI>|Jenkins CI' \
            # '<Regnoult Axel>|Regnoult Axel'  \

# STATUS
################################################################################
# On branch development
# Your branch is ahead of 'origin/development' by 1 commit.
#   (use "git push" to publish your local commits)
# HEAD origin master development hotfixes
# 'On branch|Your branch is up-to-date with|nothing to commit, working directory clean' \
################################################################################

################################################################################
# TAGGER
################################################################################
git tag nom_du_tag HEAD
git push origin --tags

git merge 2.2.25 # merge depuis le tag

ga 	backend/src/main/java/com/groupemre/atnv2/dao/delivery/router/RouterContentDeliveryDAO.java backend/src/main/java/com/groupemre/atnv2/services/router/RouterService.java multirouter/src/main/java/com/groupemre/atnv2/globecast/service/GlobeCastService.java multirouter/src/main/java/com/groupemre/atnv2/multirouter/MultiRouterImpl.java multirouter/src/main/java/com/groupemre/atnv2/smartjog/router/SmartJogRouter.java multirouter/src/main/java/com/groupemre/atnv2/smartjog/service/SmartJogService.java

################################################################################
# delete branch
################################################################################
git branch -D
git branch -D hotfixes

################################################################################
# merge branche
################################################################################
git checkout --ours     # local
git checkout --theirs   #

################################################################################
# diff avec MELD
################################################################################
sudo git diff 3d83be0 b571ec3





 # OK - super - me donne de bons resultats (juste le nom du fichier apres le /)
 # gs f3c8275 | grep 'diff \-\-'
 # gs f3c8275 | grep 'diff \-\-' | grep '([^/]|)+$'
 # gs f3c8275 | grep 'diff \-\-' | grep -o '([^/]|)+$' (que le nom)

 # gs f3c8275 | grep 'diff \-\-.*([^/]|)+$'

 # gs f3c8275 | grep 'diff \-\-' | grep -o '([^/]|)+$' (que le nom)
 # gs f3c8275 | sed 's/diff \-\- //g'
 # gs f3c8275 | sed 's/.* //g'

 # gs f3c8275 | grep -v '[^\-]'
