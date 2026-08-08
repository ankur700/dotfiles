# Early env for all zsh invocations (login + interactive).
# Keep this file minimal — interactive stuff lives in .zshrc modules.

export EDITOR="${EDITOR:-nvim}"
export VISUAL="${VISUAL:-nvim}"

# Lightweight PATH additions that should exist even for non-interactive shells
export PATH="$HOME/.local/bin:$PATH"
export PATH="$PATH:$HOME/go/bin"

if [[ -x /opt/homebrew/bin/brew ]]; then
  eval "$(/opt/homebrew/bin/brew shellenv)"
elif [[ -x /usr/local/bin/brew ]]; then
  eval "$(/usr/local/bin/brew shellenv)"
fi
