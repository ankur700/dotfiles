#!/bin/zsh
# Fresh (or re-)setup: Homebrew packages + config symlinks.
# Usage:
#   ./bootstrap.sh           # brew bundle + link
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
  # Apple Silicon default prefix
  if [[ -x /opt/homebrew/bin/brew ]]; then
    eval "$(/opt/homebrew/bin/brew shellenv)"
  fi
fi
brew analytics off

echo "==> brew bundle (Brewfile)"
# --no-upgrade: install missing packages only; leave already-installed apps as-is
# (without this, brew bundle upgrades outdated formulae/casks and looks like a reinstall)
brew bundle --file="$DOTFILES/Brewfile" --no-upgrade

echo "==> Symlinks"
"$DOTFILES/link.sh"

if [[ "$APPLY_MACOS" -eq 1 ]]; then
  echo "==> macOS defaults"
  "$DOTFILES/macos.sh"
else
  echo "==> Skipping macOS defaults (run ./macos.sh or ./bootstrap.sh --macos)"
fi

echo ""
echo "Bootstrap complete."
echo "  nvim: kept separate at ~/.config/nvim (not linked from this repo)"
echo "  Update packages later with: brew bundle --file=$DOTFILES/Brewfile"
echo "  Re-link configs with:       $DOTFILES/link.sh"
