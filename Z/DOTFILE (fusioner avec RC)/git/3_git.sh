#!/bin/bash


############################################################
# DEFAULT USER - GIT
############################################################


alias gllf='git log -20 --stat  --oneline --pretty=format:"%Cred%h%Creset %C(yellow)%d%Creset %C(yellow)%s %Cgreen(%cr) %C(bold blue)<%an>%Creset" --abbrev-commit | grep -E "/|$"'
alias gllfa='git log -20 --author="axel" --stat  --oneline --pretty=format:"%Cred%h%Creset %C(yellow)%d%Creset %C(yellow)%s %Cgreen(%cr) %C(bold blue)<%an>%Creset" --abbrev-commit | grep -E "/|$"'
# je n ai pas le nom des personnes
alias gli='git log -10 --graph --oneline --decorate --all --name-status --stat'
# comme glo, mais pas sur une ligne
alias gla='git log -50 --stat'
alias glax='git log -50 --author="axel" --stat'
alias glaxa='git log --author="axel" --stat'
alias gitlgf='git log --pretty=format:"%Cred%h%Creset -%C(yellow)%d%Creset %s <%ad>" --abbrev-commit --date=relative --name-status
 heir = log --all --graph --decorate --oneline --simplify-by-decoration'

# alias xxgxx='echo -e "\n PUSHING \n" && gt && echo -e "\n-----------------\n" && gitp && echo -e "\n-----------------\n" && gp && echo -e "\n-----------------\n" && gtp && echo -e "\n-----------------\n" && gll && echo -e "\n-----------------\n" && aa && echo -e "\n >>> Thanks you :D <<<\n" '
# alias gitc='git commit -a && git pull --rebase && git --no-pager lg -5 && echo'


function gitSpeed()
{
  # git clone https://github.com/regnou/.ALIAS.git
  git clone https://github.com/regnou/0-MS-2.0.0.git
  git clone https://github.com/regnou/1-P-130.git
  git clone https://github.com/regnou/2-P-light-130.git
  git clone https://github.com/regnou/3-W-061.git
  git clone https://github.com/regnou/4-W-P.git
  git clone https://github.com/regnou/5-Layout.git
}

# ------------------------------------------------------------------------------
# LE TOKEN IL FAUT LE RECCUPERER ICI : https://github.com/settings/tokens
# ------------------------------------------------------------------------------
# CREER GITHUB distant
# curl -u 'regnou' https://api.github.com/regnou -d '{"name":0-MS-2}'
# curl -u yourUsername -X POST https://api.github.com/user/repos -d '{"name":"nameOfRepo"}'
# SUPPRIMER GITHUB distant
# curl -X DELETE -H 'Authorization: token 73aa994f11809b82838ff15fbd0fc4e7c0a9fe57' https://api.github.com/repos/regnou/0-MS2

# curl -u 'terragroup' https://api.github.com/terragroup -d '{"name":test}'

# git clone https://github.com/terragroup/puzzle.git

# git remote add origin git@github.com:terragroup/puzzle.git

alias gogit='git remote add origin git@github.com:TOGEZER/tooling.git'

# # # # # # # # # # # # # # # # # # #
# git@github.com:TOGEZER/tooling.git
# ou

# git remote add origin git@github.com:TOGEZER/tooling.git
# fatal: remote origin already exists.
# git remote set-url origin git@github.com:TOGEZER/tooling.git
alias gitv='git remote -v'

function fgitc()
{
git clone https://github.com/TOGEZER/tooling.git
git remote add origin git@github.com:TOGEZER/tooling.git
git push origin master
# git remote -v # debug: Para ver los branch
}
# # # # # # # # # # # # # # # # # # #

function github()
{
    echo "github"
   git clone https://github.com/regnou/$1.git
   git remote add origin git@github.com:regnou/$1.git
   git push origin master
}

################################################################################
# CURRENT COMMIT - TODO
################################################################################
# TU CHAGES CA, et ton GIT LOG (gl) te mettra en valeur le necessaire
CURRENT_COMMIT="'5f4e63e|5162b42|d9af13b|4b657e6|acfa51a|ad2e172|e869510' 20715 19020 19054 21068 22606 '615d7ff|ec4667e|ad2e172'"

# git push --tags

################################################################################
# GIT
################################################################################
alias gst='git show $(git stash list | cut -d":" -f 1)'
alias gb='git branch -a'

# stash
alias gt='git stash'
# alias gtl='git stash list --date=local'
alias gtl='git stash list '
alias gtp='git stash pop'
# git stash pop "stash@{0}"

alias gitp='git pull --rebase '

alias ga='git add '
alias gaa='git add --all .'

alias gp='git push | h -ni github.com Username Password Everything'
alias gpp='gaa && gmm && gp'                                                    # NEW

# alias gm='gaa && git commit -m  && gp'
alias gm='git commit -m '
alias gmm='git commit -m "warning: auto generated msg :("'

alias gmM='git commit -m "bureau"'
alias grc='git rebase --continue'
alias gcp="git cherry-pick"                                                     # git cherry -v master
#
alias gc='git checkout'
alias gcd='git checkout development'

alias grH='git reset HEAD | h -n "M	    "'                                      # utile pour UNSTAGE (remet en normal ET NON PAS en pret a commiter)
alias grv='git revert '

alias gtag='git tag | h -ni 2.2.3 2.2.4 2.2.5'

# STASH ONLY certains fichiers
# tu fais git add sur certains elements et puis tu fais
# git stash save --keep-index
# et ca ne va stasher que ces fichiers

# git checkout --ours <filename>
# git checkout --theirs <filename>

# ------------------------------------------------------------------------------
# REGLE : LORSQUE TU CHERRY PICK : IL FAUT ABSOLUEMENT QUE TU METTES :
# PICK (avec la coloration syntaxique : sinon tu ne comprend plus rien)
# ------------------------------------------------------------------------------

################################################################################
# GL
################################################################################
AXL_GIT_GL="'fixes #' \
            'refs #' \
            'Revert \"Revert' \
            'origin/tmp|tmp'  \
            'origin/dev|dev'  \
            'origin/development|development'  \
            'origin/master|master'  \
            'HEAD|origin/HEAD' \
            'Merge|Revert' \
            'origin/hotfixes|hotfixes' \
            'tag: |tag: 2\.2\.' \
            'refs/stash' \
            'test' \
            "

################################################################################
# QQUE SOIT LA BRANCHE
alias gl="git log -30 --graph --pretty=format:'  %C(yellow)%<(30)%d   %C(white)%<(50)%s  %C(cyan)%h   %C(bold blue)%<(12)%cr  ' --abbrev-commit --date=short --all  \
| h -i  $AXL_GIT_GL \
| h -ni popo pipi pupu koko kiki kuku  '\[maven-release-plugin\] prepare for next development iteration|\[maven-release-plugin\] prepare release'  \
| h -ni $CURRENT_COMMIT \
"
# AVANTAGE GLL = il faut se mettre sur la branche, et on ne voit QUE la branche
alias gll="git lg -50 \
| h -i  $AXL_GIT_GL \
| h -ni popo pipi pupu koko kiki kuku  '\[maven-release-plugin\] prepare for next development iterationgi|\[maven-release-plugin\] prepare release'  \
| h -ni $CURRENT_COMMIT \
"
# divers
alias gl0='git l -50'
alias gl1='git gl -5'
alias gl2='git lg -50'
alias gl3="git log -30 --graph --pretty=format:'  %C(yellow)%<(25)%d   %C(white)%<(100)%s  %C(cyan)%h   %C(bold blue)%<(12)%cr  ' --abbrev-commit --date=short --all  "
alias gl4='git glaaa -50'

################################################################################
# STATUS
################################################################################
AXL_GIT_BOUCHONX="'LoginPresenter.java|Atnv2Dev.gwt.xml|applicationContext.xml|variableConfig.properties|RouterService.java|MainPresenter.java|logback.xml|settings.xml|db.changelog.xml|persistence.xml' \
                  "
AXL_GIT_STATUS="'untracked files:|(use \"git add <file>...\" to include in what will be committed)|nothing added to commit but untracked files present (use \"git add\" to track)' \
              'nothing to commit, working directory clean' \
              'Changes to be committed:|\(use \"git reset HEAD <file>...\" to unstage\)' \
              'modified:|Your branch is up-to-date with|On branch|Changes not staged for commit:|\(use \"git add/rm <file>...\" to update what will be committed\)|\(use \"git checkout -- <file>...\" to discard changes in working directory\)|\(use \"git add <file>...\" to update what will be committed\)|no changes added to commit|\(use \"git add\" and/or \"git commit -a\"\)' \
              'Current branch development is up to date.' \
              'Unmerged paths|\(use \"git add <file>...\" to mark resolution\)' \
              "
AXL_GIT_STATUS_detail=" 'origin/' \
        'development|hotfixes|master' \
        'popo' \
        'new file' \
        'toto' \
        'lili' \
        'deleted' \
        'renamed' \
        "
alias a="git status | h -i $AXL_GIT_BOUCHONX | h -i $AXL_GIT_STATUS | h -ni $AXL_GIT_STATUS_detail"

################################################################################
# MERGE
################################################################################
alias gddd=' h -ni  \
    "^diff --git.*" \
    "^\+ .*" \
    "^@@.*" \
    "toto" \
    "\+\=\=\=\=\=\=\=|\+\|\|\|\|\|\|\| merged common ancestors|\+\>\>\>\>\>\>\> Stashed changes" \
    "\+\<\<\<\<\<\<\<\ Updated upstream" \
    | h -i  \
    "^\- .*" \
    ".*\.java$" \
    "deleted file mode" \
    "new file mode" \
    "index" \
    '
# diff ce qui est dans mon index local
function gd()
{
  gdf $1
  git diff $1 | gddd | h -i "popo" "lolo" "lili" $1
  gdf $1
}

function gdf()
{
  git show  --oneline --decorate --stat --graph $1 | h -ni $1  '\/java\/com\/groupemre\/atnv2\/'  'files changed' insertions deletions  \\.java \\.ui\\.xml exception xml | h -i presenter popup module service dao validator filter bulksend editor create  \\+ \\-
}

# diff ce qui est commit (repo distant)
function gs()
{
  gsf $1
  git show $1| gddd | h -i "popo" "lolo" "lili" $1
  gsf $1
}

# permet de lister JUSTE NOM + HASH --> et de grep sur un sha
function gsf()
{
  # FAIRE JUSTE git l
  git show  --oneline --decorate --stat --graph $1
  git show  --oneline --decorate --stat --graph $1 | h -ni $1   \\.java \\.ui\\.xml '/services/|/dao/' /dto/ '/client/|/ui/|ui/|/views/|/pdd/|list/pddcreator/'  /java/com/groupemre/atnv2    | h -i 'dao|service' presenter 'popup|editor' module 'validator|filter|Validation' bulksend  create 'files changed' insertions deletions  \\- \\+ '/combo.*'
  # git show  --oneline --decorate --stat --graph $1 | h -i $1 'java\/com'  \\.java \\.ui\\.xml \\+ \\- 'files changed' insertions deletions
  # '\/java\/com\/groupemre\/atnv2\/'
}

# git blame
# param : le nom de fichier
function bb()
{
  git blame -n $1 | grep Axel | h -i "2015|\.java|Regnoult Axel|\)"
}

# TOTAL
# First commit any outstanding code changes, and then, run this command:
# git rm -r --cached .
# This removes any changed files from the index(staging area), then just run:
# git add .
# Commit it:
# git commit -m ".gitignore is now working"
# git clone https://github.com/regnou/3-P-todo
# curl -u 'regnou' https://api.github.com/user/repos -d '{"name":"3-P-todo"}'


##########################################
##########################################
##########################################
##########################################
# DETAIL FONCTION
##########################################
