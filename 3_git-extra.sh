#!/bin/bash

BEST GIT
alias gllf='git log -20 --stat  --oneline --pretty=format:"%Cred%h%Creset %C(yellow)%d%Creset %C(yellow)%s %Cgreen(%cr) %C(bold blue)<%an>%Creset" --abbrev-commit | grep -E "/|$"'
alias gllfa='git log -20 --author="axel" --stat  --oneline --pretty=format:"%Cred%h%Creset %C(yellow)%d%Creset %C(yellow)%s %Cgreen(%cr) %C(bold blue)<%an>%Creset" --abbrev-commit | grep -E "/|$"'
je n ai pas le nom des personnes
alias gli='git log -10 --graph --oneline --decorate --all --name-status --stat'
comme glo, mais pas sur une ligne
alias gla='git log -50 --stat'
alias glax='git log -50 --author="axel" --stat'
alias glaxa='git log --author="axel" --stat'
alias gitlgf='git log --pretty=format:"%Cred%h%Creset -%C(yellow)%d%Creset %s <%ad>" --abbrev-commit --date=relative --name-status
 heir = log --all --graph --decorate --oneline --simplify-by-decoration'
alias xxgxx='echo -e "\n PUSHING \n" && gt && echo -e "\n-----------------\n" && gitp && echo -e "\n-----------------\n" && gp && echo -e "\n-----------------\n" && gtp && echo -e "\n-----------------\n" && gll && echo -e "\n-----------------\n" && aa && echo -e "\n >>> Thanks you :D <<<\n" '
alias gitc='git commit -a && git pull --rebase && git --no-pager lg -5 && echo'

------------------------------------------------------------------------------------------------------

# Pour savoir a qui on se connecte : le client a une liste des KNOWS HOST des serveurs auxquels il se connecte
# Donc, il faut AJOUTER LA CLED PUBLIQUE DU SERVEUR dans ce fichier, comme cela, on sait avec qui on se connecte
~/.ssh/known_hosts on the client manually.

# savoir ton fingerprint
ssh-keygen -lf axel-key.pub
2048 45:46:75:03:d2:5a:f4:ff:bb:5b:8d:b8:1b:7e:21:fd  axel@axel-HP-Compaq-8200-Elite-SFF-PC (RSA)

------------------------------------------------------------------------------------------------------

# FONCTIONNEMENT COMMIT
- tu commits avec FIXES (ca fera passer le status a RESOLU)
- puis tu click sur le SHA et tu vas dans le depot (ca met un peu de temps a rafraichir et c est OK)

#----------------------------
# Besoin de supprimer des commits
#----------------------------
git rebase -i HEAD~4        # il va te proposer d editer un fichier et tu vas pouvoir supprimer les lignes que tu souhaites supprimer
git push -f origin hotfixes # il te faudra le -f

#----------------------------
#
#----------------------------
git fetch --tag
git tag IMDV-2.19.18

#
wget http://redmine.mre.pub/projects/medicis-recap/repository

#
git://gitorious.mre.pub/medicis/medicis.git
1bb372fe3049332e88d1ac62561532764f76294d
echo 1bb372fe3049332e88d1ac62561532764f76294d >> .git/refs/heads/hotfixes

# ------------------------------------------------------------------------------
# Gestion branches
# ------------------------------------------------------------------------------
# > delete branch
git branch -d ou -D
# > delete REMOTE branch
git push origin --delete origin/000000000000000

# remove tag
git tag -d release01git tag -d release01

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
  # git push --set-upstream origin master
  git branch --set-upstream-to=origin/master-dev master
}

#
# AVEC CA : GITHUB ne te demande plus le password
#
function generate_ssh_key(){
  #
  # GENERATE SSH KEY
  # https://help.github.com/articles/generating-ssh-keys/
  #

  # start the ssh-agent in the background
  ssh-keygen -t rsa -b 4096 -C "regnou.a@gmail.com"
  eval "$(ssh-agent -s)"
  # Add your SSH key to the ssh-agent:
  ssh-add ~/.ssh/id_rsa

  # LA TU FAIS L AJOUT DE LA CLEF PUBLIQUE DANS GITHUB ! et tu fais :
  # test connexion
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
git config --global core.excludesfile ~/.gitignore
git clone git@github.com:regnou/DEMO.git
# ------------------------------------------------------------------------------

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
gs f3c8275 | grep 'diff \-\-.*([^/]|)+$'

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
