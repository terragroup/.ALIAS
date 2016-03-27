#!/bin/bash

################################################################################
# PS1
# ------------------------------------------------------------------------------
# COLOR UNIX (setaf, setab)
# 1 - blue
# 2 - green
# 3 - blue
# 4 - red
# 5 - purple
# export H_COLORS_FG="bold black on_rgb520","bold red on_rgb025" #     export H_COLORS_BG="underline bold rgb520","underline bold rgb025"
# TODO : ici - conditions : en fonction du user (axel, root, autre, postgres) ==> tu generes le PS1
################################################################################
PURPLE="$(tput setb 5)"; TT_USER="$(tput setb 2) $(tput setaf 0)"; RED="$(tput setaf 1)";
RED_BLACK="$(tput setb 0) $(tput setaf 7)";
WHITE_RED="$(tput setb 7) $(tput setaf 0)";
GREEN="$(tput setaf 2)"; YELLOW="$(tput setaf 3)"; END="$(tput sgr0)"
# multi-line
JAUNE_GIT="\[\033[01;33m\]"
JAUNE_GIT_2="$(tput setb 6) $(tput setaf 0)"
# ------------------------------------------------------------------------------

PS1='\n$JAUNE_GIT_2 $(__git_ps1) $END $GREEN \A $END \d  \$END\n$WHITE_RED($(echo $?)) $(dirname $(pwd))/ $END $WHITE_RED \W $END $TT_USER \u $END @ $TT_USER \H $END \n\n    '
# RED_BLACK


# PS1='\n$JAUNE_GIT_2                                                               $(__git_ps1)   $END $GREEN        \A $END      \d  \
# $END\n$WHITE_RED($(echo $?))  $(dirname $(pwd))/     $END                               $WHITE_RED     \W     $END       $TT_USER \u $END @ $TT_USER \H $END \n\n    '




  #  $END  $GREEN >>>   $END

# 1-line
#PURPLE="$(tput setb 5)"; TT_USER="$(tput setb 2)"; RED="$(tput setaf 1)"; GREEN="$(tput setaf 2)"; YELLOW="$(tput setaf 3)"; END="$(tput sgr0)"
#PS1='\n\n\n$GREEN$(dirname $(pwd))$END$RED \W $END\[\033[01;33m\]$(__git_ps1) $END        $(echo $?) |$GREEN \T $END| \d | \H | $TT_USER \u $END\n  '
