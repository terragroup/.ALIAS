#!/bin/bash

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
            'Merge|Revert' \
            'origin/master|master'  \
            'origin/development|, development'  \
            'origin/hotfixes|hotfixes' \
            'tag: |tag: 2\.2\.' \
            'refs/stash' \
            'HEAD|origin/HEAD' \
            'test' \
            "

################################################################################
# CURRENT COMMIT - TODO
################################################################################
CURRENT_COMMIT="'5f4e63e|5162b42|d9af13b|4b657e6|acfa51a|ad2e172|e869510' 20715 19020 19054 21068 22606 '615d7ff|ec4667e|ad2e172'"

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

################################################################################
# OTHER
################################################################################
alias gst='git show $(git stash list | cut -d":" -f 1)'
alias gb='git branch -a'
# stash
alias gt='git stash'
# alias gtl='git stash list --date=local'
alias gtl='git stash list '
alias gtp='git stash pop'
#
alias gitp='git pull --rebase '
alias gp='git push | h -i Everything'
alias gm='git commit -m '
alias gmm='git commit -m "maison"'
alias gmM='git commit -m "bureau"'
alias grc='git rebase --continue'
alias gcp="git cherry-pick" # git cherry -v master
#
alias gc='git checkout'
alias gcd='git checkout development'
alias gaa='git add --all .'
alias ga='git add '
alias grH='git reset HEAD | h -n "M	    "'    # utile pour UNSTAGE (remet en normal ET NON PAS en pret a commiter)
alias grv='git revert '

alias gtag='git tag | h -ni 2.2.3 2.2.4 2.2.5 '
