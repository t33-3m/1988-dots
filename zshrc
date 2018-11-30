# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH
export LANG="en_US.UTF-8"
export TERM="xterm-256color"
# Path to your oh-my-zsh installation.
export ZSH=~/.oh-my-zsh

# #Make ~/.bin folder easier to be executed from terminal
##
PATH=$PATH:~/.bin

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes

ZSH_THEME="powerlevel9k"
POWERLEVEL9K_MODE='nerdfont-complete'

## Replace full user in the terminal context with an icon
##
local user_symbol="\uF007 $"
    if [[ $(print -P "%#") =~ "#" ]]; then
        user_symbol = "\uF007 #"
    fi
POWERLEVEL9K_CONTEXT_TEMPLATE=$user_symbol

##  My Power Level 9K config
##
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(dir context rbenv vcs)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status root_indicator dir_writable time)
#POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=()

#POWERLEVEL9K_PROMPT_ADD_NEWLINE=true

POWERLEVEL9K_SHORTEN_DIR_LENGTH=2
POWERLEVEL9K_SHORTEN_STRATEGY=truncate_from_right
POWERLEVEL9K_SHORTEN_DELIMITER=..
POWERLEVEL9K_HIDE_BRANCH_ICON=false
POWERLEVEL9K_VCS_SHOW_SUBMODULE_DIRTY=false
POWERLEVEL9K_VCS_HIDE_TAGS=true
POWERLEVEL9K_CHANGESET_HASH_LENGTH=8
POWERLEVEL9K_VCS_GIT_ICON=''
POWERLEVEL9K_TIME_FORMAT='%D{%H:%M} \uF017 '

POWERLEVEL9K_STATUS_VERBOSE=false
POWERLEVEL9K_STATUS_OK_IN_NON_VERBOSE=true

## My Power Level 9K colors
##
#POWERLEVEL9k_COLOR_SCHEME=light

#POWERLEVEL9K_DIR_HOME_BACKGROUND=red
#POWERLEVEL9K_DIR_HOME_FOREGROUND=white
#POWERLEVEL9K_DIR_HOME_SUBFOLDER_BACKGROUND=red
#POWERLEVEL9K_DIR_HOME_SUBFOLDER_FOREGROUND=white
#POWERLEVEL9K_DIR_WRITABLE_FORBIDDEN_BACKGROUND=yellow
#POWERLEVEL9K_DIR_WRITABLE_FORBIDDEN_FOREGROUND=black
#POWERLEVEL9K_DIR_DEFAULT_BACKGROUND=red
#POWERLEVEL9K_DIR_DEFAULT_FOREGROUND=white
#
#POWERLEVEL9K_CONTEXT_DEFAULT_BACKGROUND=magenta
#POWERLEVEL9K_CONTEXT_DEFAULT_FOREGROUND=white
#
#POWERLEVEL9K_VCS_MODIFIED_BACKGROUND=yellow
#POWERLEVEL9K_VCS_MODIFIED_FOREGROUND=black
#POWERLEVEL9K_VCS_UNTRACKED_BACKGROUND=yellow
#POWERLEVEL9K_VCS_UNTRACKED_FOREGROUND=black
#POWERLEVEL9K_VCS_CLEAN_BACKGROUND=yellow
#POWERLEVEL9K_VCS_CLEAN_FOREGROUND=black
#
#POWERLEVEL9K_ROOT_INDICATOR_BACKGROUND=red
#POWERLEVEL9K_ROOT_INDICATOR_BACKGROUND=white
#
#POWERLEVEL9K_STATUS_OK_BACKGROUND=blue
#POWERLEVEL9K_STATUS_OK_FOREGROUND=black
#POWERLEVEL9K_STATUS_ERROR_BACKGROUND=yellow
#POWERLEVEL9K_STATUS_ERROR_FOREGROUND=black
#
#POWERLEVEL9K_TIME_BACKGROUND=cyan
#POWERLEVEL9K_TIME_FOREGROUND=black

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
ZSH_CUSTOM=/usr/share/zsh-theme-powerlevel9k/

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=()

source ~/.oh-my-zsh/oh-my-zsh.sh

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

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
alias fdisk="sudo fdisk"
mcc() {
	markdown $1 > .out.html && firefox ./.out.html
}

## alias for spawning a background task
bg-launch () {
	nohup $1 > /dev/null & 
}

## alias for unlocking and mounting an encrypted disk
unlock () {
	sudo cryptsetup luksOpen $1 LUKS001 
	sudo mount /dev/mapper/LUKS001 /media/disk
}

lock () {
	sudo umount /media/disk
	sudo cryptsetup luksClose LUKS001
}

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

setopt AUTO_CD # No cd needed to change directories
setopt BANG_HIST # Treat the '!' character specially during expansion.
setopt EXTENDED_HISTORY
setopt HIST_EXPIRE_DUPS_FIRST # Expire duplicate entries first when trimming history.
setopt HIST_FIND_NO_DUPS
setopt HIST_IGNORE_ALL_DUPS # Delete old recorded entry if new entry is a duplicate.
setopt HIST_IGNORE_DUPS # Don't record an entry that was just recorded again.
setopt HIST_IGNORE_SPACE # Don't record an entry starting with a space.
setopt HIST_REDUCE_BLANKS # Remove superfluous blanks before recording entry.
setopt HIST_SAVE_NO_DUPS # Don't write duplicate entries in the history file.
setopt INC_APPEND_HISTORY # Write to the history file immediately, not when the shell exits.
setopt SHARE_HISTORY # Share history between all sessions.

PS1='[\u@\h \W]\$ '

## Factorio
alias factorio='/home/tee/FlashFiles/factorio/bin/x64/factorio'


## List
alias ls='ls --color=auto'
alias la='ls -a'
alias ll='ls -la'
alias l='ls' 					
alias l.="ls -A | egrep '^\.'"      

## Fix obvious typo's
alias cd..='cd ..'
alias sl="ls"
alias pdw="pwd"

## Colorize the grep command output for ease of use (good for log files)##
alias grep='grep --color=auto'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'

## readable output
alias df='df -h'

## Run this after modifying .Xresources file
alias merge="xrdb -merge ~/.Xresources"


## Aliases for software managment
## pacman or pm
alias pmsyu="sudo pacman -Syu --color=auto"
alias pacman='sudo pacman --color auto'
alias update='sudo pacman -Syu'


## generate a file containing installed package list
alias pkglist="pacman -Qqe >"
##    Q – Queries the package database. This option allows you to view installed packages and their files, other useful meta-information about individual packages (dependencies, conflicts, install date, build date, size).
##    q – Shows less information for certain query operations. This is useful when pacman’s output is processed in a script.
##    e – Lists explicitly installed packages that are not required by any other package.

## install all package in the generated package list
alias install-pkglist="sudo pacman -S - <"

## ls group directory first
alias lsf="ls --group-directories-first"

## A funny meme :D
##

alias love="echo '\e[31mShell: \e[34mLove not found'"
alias happines="echo '\e[31mShell: \e[33mHappines not found'"
alias peace="echo '\e[31mShell: \e[35mPeace not found'"
alias kill="echo '\e[32mShell: \e[31mYou need to specify whom to kill'"
alias kill-everyone="echo '\e[32mShell: \e[31mBut! Genocide is illegal Sir!!'"
#alias love="echo '\e[31mShell: \e[34mLove not found \uF08A \uF00D'"
#alias happines="echo '\e[31mShell: \e[33mHappines not found \uF119'"
#alias peace="echo '\e[31mShell: \e[35mPeace not found \uF0E3'"
#alias kill="echo '\e[32mShell: \e[31mYou need to specify whom to kill \uF05B'"
#alias kill-everyone="echo '\e[32mShell: \e[31mBut! Genocide is illegal Sir!! \uF05C'"
#alias love="echo '\e[31mShell: \e[34mLove not found \uF08A \uF00D' && echo ' '"
#alias happines="echo '\e[31mShell: \e[33mHappines not found \uF119' && echo ' '"
#alias peace="echo '\e[31mShell: \e[35mPeace not found \uF0E3' && echo ' '"
#alias kill="echo '\e[32mShell: \e[31mYou need to specify whom to kill \uF05B' && echo ' '"
#alias kill-everyone="echo '\e[32mShell: \e[31mBut! Genocide is illegal Sir!! \uF05C' && echo ' '"

## View and set wallpaper with feh
alias feh-view="feh --scale-down --auto-zoom"
alias feh-set="feh --bg-fill"
#alias feh-set="echo 'Wallpaper has been set for You, very nice choice :)' && feh --bg-fill"

## Refresh font cache
alias font-refresh="fc-cache -fv"

## Misc Aliases
# Like one for opening markdown in Firefox
mcc() {
	markdown $1 > .out.html && firefox .out.html &&	rm .out.html
}
# And one to show the monthly calendar
alias calm="gcalcli calm"
alias calw="gcalcli calw"
# And for my todo lists
alias vitodo="vim ~/.todo-list"
alias catodo="cat ~/.todo-list"
rmtodo() {
	sed -i "s/$(grep -E $1 ~/.todo-list)//g" ~/.todo-list
}

alias simpleserver='python -m http.server 4204'
	
## alias for BLINK RED TEXT
function blinkred() {
	echo "\e[5m\e[31m 
RRRRRRRRRRRRRRRRR   EEEEEEEEEEEEEEEEEEEEEEDDDDDDDDDDDDD
R::::::::::::::::R  E::::::::::::::::::::ED::::::::::::DDD
R::::::RRRRRR:::::R E::::::::::::::::::::ED:::::::::::::::DD
RR:::::R     R:::::REE::::::EEEEEEEEE::::EDDD:::::DDDDD:::::D
  R::::R     R:::::R  E:::::E       EEEEEE  D:::::D    D:::::D
  R::::R     R:::::R  E:::::E               D:::::D     D:::::D
  R::::RRRRRR:::::R   E::::::EEEEEEEEEE     D:::::D     D:::::D
  R:::::::::::::RR    E:::::::::::::::E     D:::::D     D:::::D
  R::::RRRRRR:::::R   E:::::::::::::::E     D:::::D     D:::::D
  R::::R     R:::::R  E::::::EEEEEEEEEE     D:::::D     D:::::D
  R::::R     R:::::R  E:::::E               D:::::D     D:::::D
  R::::R     R:::::R  E:::::E       EEEEEE  D:::::D    D:::::D
RR:::::R     R:::::REE::::::EEEEEEEE:::::EDDD:::::DDDDD:::::D
R::::::R     R:::::RE::::::::::::::::::::ED:::::::::::::::DD
R::::::R     R:::::RE::::::::::::::::::::ED::::::::::::DDD
RRRRRRRR     RRRRRRREEEEEEEEEEEEEEEEEEEEEEDDDDDDDDDDDDD       "

}

function gogreen() {
	echo "\e[32m\
       GGGGGGGGGGGGGRRRRRRRRRRRRRRRRR   EEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEENNNNNNNN        NNNNNNNN
     GGG::::::::::::GR::::::::::::::::R  E::::::::::::::::::::EE::::::::::::::::::::EN:::::::N       N::::::N
   GG:::::::::::::::GR::::::RRRRRR:::::R E::::::::::::::::::::EE::::::::::::::::::::EN::::::::N      N::::::N
  G:::::GGGGGGGG::::GRR:::::R     R:::::REE::::::EEEEEEEEE::::EEE::::::EEEEEEEEE::::EN:::::::::N     N::::::N
 G:::::G       GGGGGG  R::::R     R:::::R  E:::::E       EEEEEE  E:::::E       EEEEEEN::::::::::N    N::::::N
G:::::G                R::::R     R:::::R  E:::::E               E:::::E             N:::::::::::N   N::::::N
G:::::G                R::::RRRRRR:::::R   E::::::EEEEEEEEEE     E::::::EEEEEEEEEE   N:::::::N::::N  N::::::N
G:::::G    GGGGGGGGGG  R:::::::::::::RR    E:::::::::::::::E     E:::::::::::::::E   N::::::N N::::N N::::::N
G:::::G    G::::::::G  R::::RRRRRR:::::R   E:::::::::::::::E     E:::::::::::::::E   N::::::N  N::::N:::::::N
G:::::G    GGGGG::::G  R::::R     R:::::R  E::::::EEEEEEEEEE     E::::::EEEEEEEEEE   N::::::N   N:::::::::::N
G:::::G        G::::G  R::::R     R:::::R  E:::::E               E:::::E             N::::::N    N::::::::::N
 G:::::G       G::::G  R::::R     R:::::R  E:::::E       EEEEEE  E:::::E       EEEEEEN::::::N     N:::::::::N
  G:::::GGGGGGGG::::GRR:::::R     R:::::REE::::::EEEEEEEE:::::EEE::::::EEEEEEEE:::::EN::::::N      N::::::::N
   GG:::::::::::::::GR::::::R     R:::::RE::::::::::::::::::::EE::::::::::::::::::::EN::::::N       N:::::::N
     GGG::::::GGG:::GR::::::R     R:::::RE::::::::::::::::::::EE::::::::::::::::::::EN::::::N        N::::::N
        GGGGGG   GGGGRRRRRRRR     RRRRRRREEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEENNNNNNNN         NNNNNNN"
}

function cht() {
	ORIG=$PS1
	TITLE="\e]2;\"$1\"\a"
	PS1=${ORIG}${TITLE}
}

## self-destruct
rm()
{
  if [ "$1" = "-rf/" ]
  then
    shift
    echo '' && echo 'Do a self destruct in 5.. 4.. 3.. 2.. 1..' && echo 'Just kidding :p' && echo '' && echo "Let's take a screenshot instead" && scrot -cd 5 "$@"
  else
    command rm "$@"
  fi
}

wal -i ~/Pictures/bg.jpg

