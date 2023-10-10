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

bindkey -M vicmd '^e' edit-command-line

autoload -Uz compinit && compinit

export LESS="-F -X $LESS"

export LS_COLORS="ow=01;90:di=01;90"
export LSCOLORS='gxfxcxdxbxegedabagacad'
export EDITOR='vim'

_fzf_compgen_dir() {
  fd --type d --hidden --follow -E ".git" -E node_modules . "$1"
}

go_to_git_root() {
  cd $(git rev-parse --show-toplevel)
  zle push-line
  zle accept-line
  #zle reset-prompt
  #zle redisplay
  #echo -ne '\n'
}

zle -N go_to_git_root
bindkey -M vicmd '^[g' go_to_git_root
bindkey -M viins '^[g' go_to_git_root

_fzf_comprun() {
  local command=$1
  shift

  case "$command" in
    cd)           fzf --preview 'tree -C {} | head -200'   "$@" ;;
    export|unset) fzf --preview "eval 'echo \$'{}"         "$@" ;;
    ssh)          fzf --preview 'dig {}'                   "$@" ;;
    *)            fzf --preview 'bat -n --color=always {}' "$@" ;;
  esac
}
