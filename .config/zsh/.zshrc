export STARSHIP_CONFIG=~/.config/starship/starship.toml

# =============================================================================
# Nix Environment Configuration
# =============================================================================

# Source the nix-darwin environment if it exists
if [ -e '/nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh' ]; then
  source '/nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh'
fi

# get machine's ip address
alias ip="ipconfig getifaddr en0"

# edit global zsh configuration
alias zshconfig="vim ~/.zshrc"
# reload zsh configuration
alias zshsource="source ~/.zshrc"
# reload zsh configuration
alias ohmyzsh="cd ~/.oh-my-zsh"

# navigate to global ssh directory
alias sshhome="cd ~/.ssh"
# edit global ssh configuration
alias sshconfig="vim ~/.ssh/config"

# edit global git configuration
alias gitconfig="vim ~/.gitconfig"

# git aliases
alias gitl="git lg"
alias gita="git add ."
alias gitc="cz commit"

alias loc="npx sloc --format cli-table --format-option head --exclude 'build|\.svg$\.xml' ./"

alias jsonencode="awk 'NF {sub(/\r/, ""); printf "%s\\n",$0;}' $0"
alias fastfetch="fastfetch; printf '\n\n'"
alias cat="bat"
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
alias ls="eza --color=always --git --icons=always"

# use vi mode
#set -o vi
bindkey -e

export VISUAL=nvim
export EDITOR=nvim
export HISTSIZE=1000000
export SAVEHIST=$HISTSIZE

setopt HIST_IGNORE_SPACE
setopt HIST_IGNORE_DUPS
setopt SHARE_HISTORY
setopt CHASE_LINKS
setopt HIST_SAVE_NO_DUPS
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_FIND_NO_DUPS
setopt HIST_REDUCE_BLANKS

export PATH=$PATH":$HOME/bin"
export PATH=$PATH":$HOME/run/current-system/sw/bin"
export PATH="/Users/ankursingh/.local/bin:$PATH"
# export PATH="$HOME/.tmuxifier/bin:$PATH"
export PATH=$PATH":$HOME/go/bin"
export PATH=$PATH":$HOME/.config/zfunc"
export PATH="$(brew --prefix)/opt/curl/bin:$PATH"
export PATH="$(brew --prefix)/opt/mysql-client/bin:$PATH"
export PATH="/$PATH:$HOME/.cargo/bin"
export PATH=$PATH:"$HOME/Library/Python/3.10/bin"
export PATH="/Applications/flameshot.app/Contents/MacOS/:$PATH"
export NVM_DIR="$HOME/.nvm"
export LESS="-XRFS"
export ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=#a89984"
export FZF_CTRL_T_OPTS="--preview 'bat -n --color=always --style=numbers {}'"
export FZF_ALT_C_OPTS="--preview 'eza --tree --color=always {} | head -200'"
# catppuccin
#export FZF_DEFAULT_OPTS=" \
#--color=spinner:#f5e0dc,hl:#f38ba8 \
#--color=fg:#cdd6f4,header:#f38ba8,info:#cba6f7,pointer:#f5e0dc \
#--color=marker:#b4befe,fg+:#cdd6f4,prompt:#cba6f7,hl+:#f38ba8 \
#--multi"
# gruvbox
export FZF_DEFAULT_OPTS=" \
 --color=spinner:#8ec07c,hl:#83a598 \
 --color=fg:#bdae93,header:#83a598,info:#fabd2f,pointer:#8ec07c \
 --color=marker:#8ec07c,fg+:#ebdbb2,prompt:#fabd2f,hl+:#83a598
 --multi"
export FZF_DEFAULT_COMMAND='fd --type f --hidden --follow'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
bindkey "ç" fzf-cd-widget # atl + c
# Advanced customization of fzf options via _fzf_comprun function
# - The first argument to the function is the name of the command.
# - You should make sure to pass the rest of the arguments to fzf.
_fzf_comprun() {
  local command=$1
  shift

  case "$command" in
    cd)           fzf --preview 'eza --tree --color=always {} | head -200' "$@" ;;
    export|unset) fzf --preview "eval 'echo $'{}"         "$@" ;;
    ssh)          fzf --preview 'dig {}'                   "$@" ;;
    *)            fzf --preview "bat -n --color=always --line-range :500 {}" "$@" ;;
  esac
}

# Herd injected PHP 8.4 configuration.
export HERD_PHP_84_INI_SCAN_DIR="/Users/ankursingh/Library/Application Support/Herd/config/php/84/"


# Herd injected PHP binary.
export PATH="/Users/ankursingh/Library/Application Support/Herd/bin/":$PATH
export PATH="$HOME/Library/Application Support/Herd/bin:$PATH"

# source $(brew --prefix nvm)/nvm.sh
source $(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh

# load zsh-completions
autoload -U compinit && compinit

# use nvm
export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm

# use starship theme (needs to be at the end)
eval "$(zoxide init zsh)"
eval "$(fzf --zsh)"
# eval "$(tmuxifier init -)"
zvm_after_init_commands+=('[ -f $HOME/.fzf.zsh ] && source $HOME/.fzf.zsh')
eval "$(starship init zsh)"


