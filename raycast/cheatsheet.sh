#!/bin/bash

# Required parameters:
# @raycast.schemaVersion 1
# @raycast.title Cheatsheet
# @raycast.mode fullOutput
# @raycast.packageName Dotfiles

# Optional parameters:
# @raycast.icon ⌨️
# @raycast.argument1 { "type": "dropdown", "placeholder": "App / section", "optional": false, "data": [{"title": "AeroSpace", "value": "AeroSpace"}, {"title": "Shell aliases", "value": "Shell aliases"}, {"title": "Terminal tools", "value": "Terminal tools"}, {"title": "tmux", "value": "tmux"}, {"title": "Helix", "value": "Helix"}, {"title": "Ghostty", "value": "Ghostty"}, {"title": "Cursor", "value": "Cursor"}, {"title": "Zed", "value": "Zed"}, {"title": "VS Code", "value": "VS Code"}, {"title": "Zen Browser", "value": "Zen Browser"}, {"title": "ZenNotes", "value": "ZenNotes"}, {"title": "Obsidian", "value": "Obsidian"}, {"title": "Raycast", "value": "Raycast"}, {"title": "OrbStack / Docker", "value": "OrbStack / Docker"}, {"title": "TablePlus", "value": "TablePlus"}, {"title": "macOS system", "value": "macOS system"}] }

# Documentation:
# @raycast.description Show keyboard shortcuts for a selected app from ~/dotfiles/CHEATSHEET.md
# @raycast.author ankur

set -euo pipefail

CHEAT="${HOME}/dotfiles/CHEATSHEET.md"
SECTION="${1:-}"

if [[ ! -f "$CHEAT" ]]; then
  echo "Missing $CHEAT"
  exit 1
fi

awk -v title="$SECTION" '
  BEGIN { show=0 }
  /^## / {
    if ($0 == "## " title) { show=1; next }
    if (show) exit
  }
  show { print }
' "$CHEAT"
