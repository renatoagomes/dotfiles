# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH=/home/zord/.oh-my-zsh

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="agnoster"

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
plugins=(git)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

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
# export SSH_KEY_PATH="~/.ssh/rsa_id"


#####
# CUSTOM ALIASES

#conf zsh / oh-my-sh
alias zshconfig="vim ~/.zshrc"
alias ohmyzsh="vim ~/.oh-my-zsh"

#TODO conf p/ termite
#TODO conf p/ i3
#TODO conf p/ guake
#TODO conf p/ tmux

# gerando ctags
alias genctags="ctags -R --exclude='.git' --exclude='node_modules' --exclude='' --exclude='public' --exclude='laradock' --exclude='*.js'"
alias art="php artisan "


#####
# PATH'S

alias ppath="cd ~/projetos/" 
alias acordopath="cd ~/projetos/acordorapido2" 
alias ticpath="cd ~/projetos/tic-solucoes" 
alias boitatapath="cd ~/projetos/boitata" 
alias shantipath="cd ~/projetos/instituto-shanti" 


#####
# DOCKER Aliases

#docker workspace 

alias dworkspace="docker exec -it laradock_workspace_1 "
alias dart="docker exec -it laradock_workspace_1 php artisan "
alias dcomposer="docker exec -it laradock_workspace_1 composer "

#docker postgres
alias dcreatedb='docker exec -it laradock_postgres_1 createdb  '
alias ddropdb='docker exec -it laradock_postgres_1 dropdb  '


#####
# QUICK-START ALIASES
####

#TIC
alias tic-build='ticpath && cd laradock && docker-compose up -d --build php-fpm nginx mysql phpmyadmin '
alias tic-start='ticpath && cd laradock && docker-compose up -d php-fpm nginx mysql phpmyadmin '

#AcordoRapido
alias acordo-build='acordopath && cd laradock && docker-compose up -d --build php-fpm postgres pgadmin '
alias acordo-start='acordopath && cd laradock && docker-compose up -d php-fpm nginx postgres pgadmin '

#Boitata
alias boitata-build='boitatapath && cd laradock && docker-compose up -d --build php-fpm postgres pgadmin; cd .. '
alias boitata-start='boitatapath && cd laradock && docker-compose up -d php-fpm nginx postgres pgadmin '

#shanti
alias shanti-build='shantipath && cd laradock && docker-compose up -d --build php-fpm postgres pgadmin; cd .. '
alias shanti-start='shantipath && cd laradock && docker-compose up -d php-fpm nginx postgres pgadmin '


export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
