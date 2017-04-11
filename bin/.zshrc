# Path to your oh-my-zsh installation.
export ZSH=/Users/axel/.oh-my-zsh

# NE DEMANDE PAS UPDATE ZSH
DISABLE_AUTO_UPDATE="true"

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="robbyrussell"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git colored-man-pages zsh-syntax-highlighting)

# User configuration

# export PATH="/opt/java/current/bin:bin:/opt/maven/current/bin:/opt/tomcat/current/bin:/opt/java/current/bin:bin:/opt/maven/current/bin:/opt/tomcat/current/bin:/opt/java/current/bin:bin:/opt/maven/current/bin:/opt/tomcat/current/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/opt/ack:/opt/ack:/Users/axel/Documents/soft-WP/google-cloud-sdk/bin:/usr/local/mysql/bin"
# export PATH="/opt/maven/current/bin:/opt/tomcat/current/bin:/opt/java/current/bin:bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/opt/ack:/Users/axel/Documents/soft-WP/google-cloud-sdk/bin:/usr/local/mysql/bin"
# avec Coreutils
export PATH="/usr/local/opt/coreutils/libexec/gnubin:bin:/bin:/sbin:/usr/bin:/usr/sbin:/usr/games:/usr/local/bin:/usr/local/sbin:/usr/local/games"
export MANPATH="/usr/local/man:$MANPATH"

# PATH="/usr/local/opt/coreutils/libexec/gnubin:$PATH"
# MANPATH="/usr/local/opt/coreutils/libexec/gnuman:$MANPATH"


source $ZSH/oh-my-zsh.sh

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

. "/Users/axel/.ALIAS/0-root.sh"
# source /Users/axel/.ALIAS/bin/zsh-syntax-highlighting-filetypes-master/zsh-syntax-highlighting-filetypes.zsh

# export CLICOLOR=YES
# export LS_COLORS='di=01;33'
# export LSCOLORS=GxFxCxDxBxegedabagaced



# ~/.dircolors/themefile
eval $(gdircolors ~/.dircolors2/dircolors.256dark)

# Aliases
# alias l='gls --color=auto'
# alias ll='ls -al'

AXEL_LS='.ALIAS|.oh-my-zsh|.npm|Downloads|documents|google drive|etc|usr|var|opt|bin|sbin|d--|drwx|d-wx|dr-'

# /usr/local/bin/gls
# alias l="gls --color -hpF -la --group-directories-first | h -i staff 'axel|drwx' '/|\*' '-rwx' wheel  admin root void '$AXEL_LS|jan|feb|mar|apr|may|jun|jul|aug|sep|oct|nov|dec' "

alias l="gls  --color      -hpF -la --group-directories-first | h -i staff 'axel|togezer'  '/|\*' 'void' wheel  admin root void '$AXEL_LS|jan|feb|mar|apr|may|jun|jul|aug|sep|oct|nov|dec' "
alias la="gls --color=auto -hpF -la --group-directories-first | h -i staff 'axel|togezer'  '/|\*' 'drwx|-rwx' wheel root admin  "

 # alias L="gls --color=auto -hpF -l  --group-directories-first | h axel staff '/|\*' 'drwx|-rwx' wheel root admin  "


# LS_COLORS='di=1;34:ln=35:so=32:pi=0;33:ex=32:bd=34;46:cd=34;43:su=0;41:sg=0;46:tw=1;34:ow=1;34:'
# LS_COLORS='di=1:fi=0:ln=31:pi=5:so=5:bd=5:cd=5:or=31:mi=0:ex=35:*.rpm=90'
# export LS_COLORS
