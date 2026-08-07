#!/bin/zsh
# Symlink tracked configs into $HOME. Safe to re-run.
set -euo pipefail

DOTFILES="${DOTFILES:-$(cd "$(dirname "$0")" && pwd)}"
CONFIG="$DOTFILES/.config"

link() {
  local src="$1"
  local dest="$2"

  if [[ ! -e "$src" ]]; then
    echo "skip (missing): $src"
    return 0
  fi

  mkdir -p "$(dirname "$dest")"

  if [[ -L "$dest" ]]; then
    ln -sfn "$src" "$dest"
    echo "relink: $dest -> $src"
  elif [[ -e "$dest" ]]; then
    echo "skip (exists, not a symlink): $dest"
  else
    ln -sfn "$src" "$dest"
    echo "link:   $dest -> $src"
  fi
}

echo "Linking from $DOTFILES ..."

# ~/.config/*
link "$CONFIG/aerospace" "$HOME/.config/aerospace"
link "$CONFIG/bat" "$HOME/.config/bat"
link "$CONFIG/btop" "$HOME/.config/btop"
link "$CONFIG/fastfetch" "$HOME/.config/fastfetch"
link "$CONFIG/ghostty" "$HOME/.config/ghostty"
link "$CONFIG/helix" "$HOME/.config/helix"
link "$CONFIG/starship" "$HOME/.config/starship"
link "$CONFIG/tmux" "$HOME/.config/tmux"

# Home / app support
link "$CONFIG/bash/bashrc" "$HOME/.bashrc"
link "$CONFIG/git/.gitconfig" "$HOME/.gitconfig"
link "$CONFIG/tmux/.tmux.conf" "$HOME/.tmux.conf"
link "$CONFIG/zsh/.zshenv" "$HOME/.zshenv"
link "$CONFIG/zsh/.zshrc" "$HOME/.zshrc"
link "$CONFIG/lazygit/config.yml" "$HOME/Library/Application Support/lazygit/config.yml"

# nvim lives outside this repo (~/.config/nvim)

echo "Done."
