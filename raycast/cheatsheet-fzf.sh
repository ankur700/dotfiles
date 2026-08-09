#!/bin/bash

# Required parameters:
# @raycast.schemaVersion 1
# @raycast.title Cheatsheet (fzf)
# @raycast.mode silent
# @raycast.packageName Dotfiles

# Optional parameters:
# @raycast.icon 🔍
# @raycast.description Open Ghostty with interactive fzf cheatsheet picker

set -euo pipefail

GHOSTTY="/Applications/Ghostty.app/Contents/MacOS/ghostty"
CHEAT="$HOME/.local/bin/cheat"

if [[ ! -x "$CHEAT" ]]; then
  chmod +x "$CHEAT" 2>/dev/null || true
fi

if [[ -x "$GHOSTTY" ]]; then
  # New window running interactive picker; stays open until you quit the pager
  open -na Ghostty --args -e "$CHEAT"
else
  osascript -e 'tell application "Terminal" to do script "'"$CHEAT"'"'
fi
