#!/bin/zsh
# Primary shell config. bashrc mirrors the shared parts below.

export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="robbyrussell"
CASE_SENSITIVE="true"
ENABLE_CORRECTION="true"
plugins=(git)

source "$ZSH/oh-my-zsh.sh"

# -----------------------------------------------------------------------------
# Shared with bashrc (keep in sync; prefer this file when they differ)
# -----------------------------------------------------------------------------

export STARSHIP_CONFIG="$HOME/.config/starship/starship.toml"
export VISUAL=nvim
export EDITOR=nvim
export HISTSIZE=1000000
export SAVEHIST=$HISTSIZE
export LESS="-XRFS"
export FZF_CTRL_T_OPTS="--preview 'bat -n --color=always --style=numbers {}'"
export FZF_ALT_C_OPTS="--preview 'eza --tree --color=always {} | head -200'"

# Ghostty: force a widely supported TERM
if [[ "$TERM_PROGRAM" == "ghostty" ]]; then
  export TERM=xterm-256color
fi

# PATH
export PATH="$PATH:$HOME/bin"
export PATH="$HOME/.local/bin:$PATH"
export PATH="$PATH:$HOME/go/bin"
export PATH="$PATH:$HOME/.config/zfunc"
export PATH="$(brew --prefix)/opt/curl/bin:$PATH"
export PATH="$(brew --prefix)/opt/mysql-client/bin:$PATH"
export PATH="$PATH:$HOME/Library/Python/3.10/bin"
export PATH="$HOME/Library/Application Support/Herd/bin:$PATH"

# Herd PHP ini scan dirs
export HERD_PHP_83_INI_SCAN_DIR="$HOME/Library/Application Support/Herd/config/php/83/"
export HERD_PHP_84_INI_SCAN_DIR="$HOME/Library/Application Support/Herd/config/php/84/"
export HERD_PHP_85_INI_SCAN_DIR="$HOME/Library/Application Support/Herd/config/php/85/"

# nvm
export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "$HOME/.nvm" || printf %s "$XDG_CONFIG_HOME/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && . "$NVM_DIR/bash_completion"

# pnpm
export PNPM_HOME="$HOME/Library/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME/bin:"*) ;;
  *) export PATH="$PNPM_HOME/bin:$PATH" ;;
esac

# Aliases
alias ip="ipconfig getifaddr en0"
alias zshconfig="nvim ~/.zshrc"
alias bashconfig="nvim ~/.bashrc"
alias zr="source ~/.zshrc"
alias br="source ~/.bashrc"
alias ohmyzsh="cd ~/.oh-my-zsh"
alias sshhome="cd ~/.ssh"
alias sshconfig="nvim ~/.ssh/config"
alias gitconfig="nvim ~/.config/git/config"

alias gitl="git lg"
alias gita="git add ."
alias gitc="cz commit"
alias gdf="git diff"
alias gc="git checkout"
alias gs="git status"
alias ga="git add"
alias gp="git push origin"
alias gpl="git pull origin"
alias gsp="git stash pop"
alias gst="git stash"
alias gsts="git_stash_show"
alias gstsm="git_stash_show_m"
alias gstd="git_stash_drop"
alias gstl="git stash list"
alias gsta="git_stash_apply"

alias dup="docker-compose up -d"
alias dbuild="docker-compose build"
alias dstop="docker stop"
alias dc="docker compose"

alias ls="eza --color=always --git --icons=always"
alias ll="eza -l --color=always --git --icons=always"
alias tree="eza --tree"
alias cat="bat"
alias fastfetch="fastfetch; printf '\n\n'"

alias loc="npx sloc --format cli-table --format-option head --exclude 'build|\.svg$\.xml' ./"
alias jsonencode="awk 'NF {sub(/\r/, \"\"); printf \"%s\\\\n\",\$0;}'"

alias mv="mv -vi"
alias cpv="rsync -avh --info=progress2"
alias cl="clear"
alias c="clear"

alias ..="cd .."
alias cd..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."

alias theme-tokyo-night="starship preset tokyo-night -o ~/dotfiles/.config/starship/starship.toml --force && source ~/.zshrc"
alias theme-gruvbox="starship preset gruvbox-rainbow -o ~/dotfiles/.config/starship/starship.toml --force && source ~/.zshrc"
alias theme-jetpack="starship preset jetpack -o ~/dotfiles/.config/starship/starship.toml --force && source ~/.zshrc"
alias theme-nerdfont="starship preset nerd-font-symbols -o ~/dotfiles/.config/starship/starship.toml --force && source ~/.zshrc"

# Tools
eval "$(fzf --zsh)"
eval "$(zoxide init zsh)"
eval "$(starship init zsh)"

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

export ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=#a89984"

source "$(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"
source "$(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh"

autoload -U compinit && compinit

zvm_after_init_commands+=('[ -f $HOME/.fzf.zsh ] && source $HOME/.fzf.zsh')
