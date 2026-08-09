#!/bin/zsh
# Fresh (or re-)setup: Homebrew packages + chezmoi apply.
# Usage:
#   ./bootstrap.sh           # brew bundle + chezmoi apply
#   ./bootstrap.sh --macos   # also apply macos.sh defaults
set -euo pipefail

DOTFILES="$(cd "$(dirname "$0")" && pwd)"
cd "$DOTFILES"

APPLY_MACOS=0
for arg in "$@"; do
  case "$arg" in
    --macos) APPLY_MACOS=1 ;;
    -h|--help)
      echo "Usage: ./bootstrap.sh [--macos]"
      exit 0
      ;;
  esac
done

echo "==> Xcode Command Line Tools"
if ! xcode-select -p &>/dev/null; then
  xcode-select --install || true
  echo "Finish the CLT install UI, then re-run ./bootstrap.sh"
  exit 1
fi

echo "==> Homebrew"
if ! command -v brew &>/dev/null; then
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  if [[ -x /opt/homebrew/bin/brew ]]; then
    eval "$(/opt/homebrew/bin/brew shellenv)"
  fi
fi
brew analytics off

echo "==> brew bundle (Brewfile)"
brew bundle --file="$DOTFILES/Brewfile" --no-upgrade

echo "==> chezmoi"
if ! command -v chezmoi &>/dev/null; then
  brew install chezmoi
fi

# Point chezmoi at this repo (idempotent)
mkdir -p "${XDG_CONFIG_HOME:-$HOME/.config}/chezmoi"
cat > "${XDG_CONFIG_HOME:-$HOME/.config}/chezmoi/chezmoi.toml" <<EOF
sourceDir = "$DOTFILES"
EOF

chezmoi init --source="$DOTFILES"
chezmoi apply -v

if [[ "$APPLY_MACOS" -eq 1 ]]; then
  echo "==> macOS defaults"
  "$DOTFILES/macos.sh"
else
  echo "==> Skipping macOS defaults (run ./macos.sh or ./bootstrap.sh --macos)"
fi

echo ""
echo "Bootstrap complete."
echo "  nvim: kept separate at ~/.config/nvim (not managed here)"
echo "  Update packages:  brew bundle --file=$DOTFILES/Brewfile"
echo "  Update configs:   chezmoi apply -v"
echo "  Pull + apply:     chezmoi update -v"
echo "  Edit a file:      chezmoi edit ~/.zshrc"
echo "  Source dir:       chezmoi cd   (or: $DOTFILES)"
