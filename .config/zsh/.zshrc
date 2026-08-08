#!/bin/zsh
# Primary shell config — sources modular files next to this one
# (same idea as the old ~/.zsh/*.zsh layout).

ZSH_CONFIG="${${(%):-%N}:A:h}"

export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="robbyrussell"
CASE_SENSITIVE="true"
ENABLE_CORRECTION="true"
plugins=(git)

source "$ZSH/oh-my-zsh.sh"

[[ -f "$ZSH_CONFIG/exports.zsh" ]] && source "$ZSH_CONFIG/exports.zsh"
[[ -f "$ZSH_CONFIG/aliases.zsh" ]] && source "$ZSH_CONFIG/aliases.zsh"
[[ -f "$ZSH_CONFIG/functions.zsh" ]] && source "$ZSH_CONFIG/functions.zsh"
[[ -f "$ZSH_CONFIG/nvm.zsh" ]] && source "$ZSH_CONFIG/nvm.zsh"
[[ -f "$ZSH_CONFIG/tools.zsh" ]] && source "$ZSH_CONFIG/tools.zsh"
[[ -f "$ZSH_CONFIG/plugins.zsh" ]] && source "$ZSH_CONFIG/plugins.zsh"

# -----------------------------------------------------------------------------
# zsh-only
# -----------------------------------------------------------------------------

set -o vi
bindkey -e

setopt HIST_IGNORE_SPACE
setopt HIST_IGNORE_DUPS
setopt SHARE_HISTORY
setopt CHASE_LINKS
setopt HIST_SAVE_NO_DUPS
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_FIND_NO_DUPS
setopt HIST_REDUCE_BLANKS

autoload -U compinit && compinit
