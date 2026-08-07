#!/bin/zsh
# macOS defaults. Run explicitly: ./macos.sh
# Not part of bootstrap so a fresh machine install stays predictable.
set -euo pipefail

echo "Applying macOS defaults..."

# Prefer continuing when a domain is sandboxed / unwritable (e.g. Safari on recent macOS).
write() {
  if ! defaults write "$@" 2>/dev/null; then
    echo "skip (unwritable): defaults write $*"
  fi
}

# Network / AirDrop: browse all interfaces (not just Wi‑Fi) so AirDrop/Bonjour work over Ethernet etc.
write com.apple.NetworkBrowser BrowseAllInterfaces 1

# Finder: don't create .DS_Store files on network volumes
write com.apple.desktopservices DSDontWriteNetworkStores -bool true

# Mission Control: each display has its own Spaces (displays don't share one big space)
write com.apple.spaces spans-displays -bool false

# Dock: auto-hide
write com.apple.dock autohide -bool true

# Mission Control: don't rearrange Spaces based on most recent use
write com.apple.dock "mru-spaces" -bool "false"

# System: disable window open/close animations
write NSGlobalDomain NSAutomaticWindowAnimationsEnabled -bool false

# Gatekeeper: skip "are you sure you want to open this?" quarantine dialogs for downloaded apps
write com.apple.LaunchServices LSQuarantine -bool false

# Trackpad/mouse: "natural" scrolling off (content moves with finger direction like traditional scroll)
write NSGlobalDomain com.apple.swipescrolldirection -bool false

# Keyboard: fastest key repeat rate (1 = very fast; lower is faster)
write NSGlobalDomain KeyRepeat -int 1

# Keyboard: disable automatic spelling correction
write NSGlobalDomain NSAutomaticSpellingCorrectionEnabled -bool false

# Finder: always show file extensions
write NSGlobalDomain AppleShowAllExtensions -bool true

# Menu bar: auto-hide
write NSGlobalDomain _HIHideMenuBar -bool false

# Appearance: text highlight color (RGB 0–1) — light green
write NSGlobalDomain AppleHighlightColor -string "0.65098 0.85490 0.58431"

# Appearance: accent color (1 = red in Apple's accent palette)
write NSGlobalDomain AppleAccentColor -int 1

# Screenshots: save to ~/Pictures/Screenshots
mkdir -p "$HOME/Pictures/Screenshots"
write com.apple.screencapture location -string "$HOME/Pictures/Screenshots"

# Screenshots: no drop shadow around the captured window
write com.apple.screencapture disable-shadow -bool true

# Screenshots: PNG format
write com.apple.screencapture type -string "png"

# Finder: disable folder/window animations
write com.apple.finder DisableAllAnimations -bool true

# Desktop icons: hide external hard drives
write com.apple.finder ShowExternalHardDrivesOnDesktop -bool false

# Desktop icons: hide internal hard drives
write com.apple.finder ShowHardDrivesOnDesktop -bool false

# Desktop icons: hide mounted servers
write com.apple.finder ShowMountedServersOnDesktop -bool false

# Desktop icons: hide removable media (USB, SD, etc.)
write com.apple.finder ShowRemovableMediaOnDesktop -bool false

# Finder: show hidden files (dotfiles)
write com.apple.Finder AppleShowAllFiles -bool true

# Finder search: default scope is current folder ("SCcf"), not whole Mac
write com.apple.finder FXDefaultSearchScope -string "SCcf"

# Finder: don't warn when changing a file extension
write com.apple.finder FXEnableExtensionChangeWarning -bool false

# Finder window title: show full POSIX path
write com.apple.finder _FXShowPosixPathInTitle -bool true

# Finder: list view by default ("Nlsv" = list; alternatives include icnv, clmv, Flwv)
write com.apple.finder FXPreferredViewStyle -string "Nlsv"

# Finder: hide status bar at the bottom of windows
write com.apple.finder ShowStatusBar -bool false

# Time Machine: don't prompt to use newly connected disks as backup volumes
write com.apple.TimeMachine DoNotOfferNewDisksForBackup -bool YES

# Safari prefs live in an app container on modern macOS and usually reject `defaults write`.
# Enable Develop menu manually: Safari → Settings → Advanced → "Show features for web developers".
# These lines soft-fail if the domain is locked.
write com.apple.Safari AutoOpenSafeDownloads -bool false
write com.apple.Safari IncludeDevelopMenu -bool true
write com.apple.Safari WebKitDeveloperExtrasEnabledPreferenceKey -bool true
write com.apple.Safari com.apple.Safari.ContentPageGroupIdentifier.WebKit2DeveloperExtrasEnabled -bool true

# Any WebKit app: enable developer extras context menu
write NSGlobalDomain WebKitDeveloperExtras -bool true

# Mail: copy addresses as email only (not "Name <email>")
write com.apple.mail AddressesIncludeNameOnPasteboard -bool false

# Windows: drag a window from anywhere with Ctrl+Cmd+click (gesture drag)
write -g NSWindowShouldDragOnGesture YES

# Security: ignore Apple Remote Desktop authorization prompts (local admin / scripting convenience)
write com.apple.security.authorization ignoreArd -bool TRUE

# Logitech MX Master 3S: hybrid Bluetooth coexistence with Wi‑Fi (reduces interference; needs sudo)
if [[ "${SKIP_SUDO:-}" != "1" ]]; then
  sudo defaults write /Library/Preferences/com.apple.airport.bt.plist bluetoothCoexMgmt Hybrid
fi

echo "Done. Some changes need a logout/restart (Dock, Finder, menu bar)."
