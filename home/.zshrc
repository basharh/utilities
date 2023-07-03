#
# /etc/zshrc is sourced in interactive shells.  It
# should contain commands to set up aliases, functions,
# options, key bindings, etc.
#

bindkey -v

# Bind ctrl-k to vi-mode switch
bindkey '^k' vi-cmd-mode

alias vi=vim
alias ls='ls -G'
alias info='info --vi-keys'
alias readelf='readelf -W'

HISTSIZE=10000
SAVEHIST=10000
HISTFILE=~/.zsh_history

autoload allopt
# function colors provides arrays $fg and $bg which
# store escape sequences for colorizing the terminal
autoload colors

#run colors to init $fg and $bg
colors

set -o sharehistory
set -o incappendhistory
set -o histignoredups
set -o histignorealldups
set -o chaselinks
set -o promptsubst

set -s escape-time 0

#PS1="%M %{${bg[default]}${fg[red]}%}%~%{${fg[default]}${bg[default]}%} %# "

# map v in vi mode to launch command line editor.
autoload -U edit-command-line
zle -N edit-command-line
bindkey -M vicmd '^e' edit-command-line

autoload -Uz compinit && compinit

export PATH="/opt/homebrew/opt/postgresql@12/bin:$PATH"
export LESS="-F -X $LESS"
