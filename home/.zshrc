#
# /etc/zshrc is sourced in interactive shells.  It
# should contain commands to set up aliases, functions,
# options, key bindings, etc.
#

bindkey -v

# Bind ctrl-k to vi-mode switch
bindkey '^k' vi-cmd-mode

# Run on the way out of the shell
TRAPEXIT(){

}

alias vi=vim
alias ls='ls --color=auto'
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

#Set the escape time to zero
set -s escape-time 0

#The following PS1 is an example on how to print
#the status of the last command if it was not zero
#PS1='%(?..(%?%))%# '

#Print %~ in red
VIMODE='i'
PS1="%M %{${bg[default]}${fg[red]}%}%~%{${fg[default]}${bg[default]}%} ${VIMODE} %# "

# Very convoluted way of setting PS1. I couldn't get PS1 to read a dynamic variable
# by setting $VIMODE insdie zle-keymap-select inside the function !!
function zle-keymap-select() {
    #VIMODE=$KEYMAP;
    VIMODE="${${KEYMAP/vicmd/c}/(main|viins)/i}"
    PS1="%M %{${bg[default]}${fg[red]}%}%~%{${fg[default]}${bg[default]}%} ${VIMODE} %# "
    zle reset-prompt
}

zle -N zle-keymap-select
