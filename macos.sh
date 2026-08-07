#!/bin/zsh
# macOS defaults. Run explicitly: ./macos.sh
# Not part of bootstrap so a fresh machine install stays predictable.
set -euo pipefail

echo "Applying macOS defaults..."

# Network / AirDrop: browse all interfaces (not just Wi‑Fi) so AirDrop/Bonjour work over Ethernet etc.
defaults write com.apple.NetworkBrowser BrowseAllInterfaces 1

# Finder: don't create .DS_Store files on network volumes
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true

# Mission Control: each display has its own Spaces (displays don't share one big space)
defaults write com.apple.spaces spans-displays -bool false

# Dock: auto-hide
defaults write com.apple.dock autohide -bool true

# Mission Control: don't rearrange Spaces based on most recent use
defaults write com.apple.dock "mru-spaces" -bool "false"

# System: disable window open/close animations
defaults write NSGlobalDomain NSAutomaticWindowAnimationsEnabled -bool false

# Gatekeeper: skip "are you sure you want to open this?" quarantine dialogs for downloaded apps
defaults write com.apple.LaunchServices LSQuarantine -bool false

# Trackpad/mouse: "natural" scrolling off (content moves with finger direction like traditional scroll)
defaults write NSGlobalDomain com.apple.swipescrolldirection -bool false

# Keyboard: fastest key repeat rate (1 = very fast; lower is faster)
defaults write NSGlobalDomain KeyRepeat -int 1

# Keyboard: disable automatic spelling correction
defaults write NSGlobalDomain NSAutomaticSpellingCorrectionEnabled -bool false

# Finder: always show file extensions
defaults write NSGlobalDomain AppleShowAllExtensions -bool true

# Menu bar: auto-hide
defaults write NSGlobalDomain _HIHideMenuBar -bool true

# Appearance: text highlight color (RGB 0–1) — light green
defaults write NSGlobalDomain AppleHighlightColor -string "0.65098 0.85490 0.58431"

# Appearance: accent color (1 = red in Apple's accent palette)
defaults write NSGlobalDomain AppleAccentColor -int 1

# Screenshots: save to ~/Pictures/Screenshots
defaults write com.apple.screencapture location -string "$HOME/Pictures/Screenshots"

# Screenshots: no drop shadow around the captured window
defaults write com.apple.screencapture disable-shadow -bool true

# Screenshots: PNG format
defaults write com.apple.screencapture type -string "png"

# Finder: disable folder/window animations
defaults write com.apple.finder DisableAllAnimations -bool true

# Desktop icons: hide external hard drives
defaults write com.apple.finder ShowExternalHardDrivesOnDesktop -bool false

# Desktop icons: hide internal hard drives
defaults write com.apple.finder ShowHardDrivesOnDesktop -bool false

# Desktop icons: hide mounted servers
defaults write com.apple.finder ShowMountedServersOnDesktop -bool false

# Desktop icons: hide removable media (USB, SD, etc.)
defaults write com.apple.finder ShowRemovableMediaOnDesktop -bool false

# Finder: show hidden files (dotfiles)
defaults write com.apple.Finder AppleShowAllFiles -bool true

# Finder search: default scope is current folder ("SCcf"), not whole Mac
defaults write com.apple.finder FXDefaultSearchScope -string "SCcf"

# Finder: don't warn when changing a file extension
defaults write com.apple.finder FXEnableExtensionChangeWarning -bool false

# Finder window title: show full POSIX path
defaults write com.apple.finder _FXShowPosixPathInTitle -bool true

# Finder: list view by default ("Nlsv" = list; alternatives include icnv, clmv, Flwv)
defaults write com.apple.finder FXPreferredViewStyle -string "Nlsv"

# Finder: hide status bar at the bottom of windows
defaults write com.apple.finder ShowStatusBar -bool false

# Time Machine: don't prompt to use newly connected disks as backup volumes
defaults write com.apple.TimeMachine DoNotOfferNewDisksForBackup -bool YES

# Safari: don't auto-open "safe" downloaded files
defaults write com.apple.Safari AutoOpenSafeDownloads -bool false

# Safari: show Develop menu (Web Inspector, etc.)
defaults write com.apple.Safari IncludeDevelopMenu -bool true

# Safari / WebKit: enable web developer extras (Inspect Element, etc.)
defaults write com.apple.Safari WebKitDeveloperExtrasEnabledPreferenceKey -bool true
defaults write com.apple.Safari com.apple.Safari.ContentPageGroupIdentifier.WebKit2DeveloperExtrasEnabled -bool true

# Any WebKit app: enable developer extras context menu
defaults write NSGlobalDomain WebKitDeveloperExtras -bool true

# Mail: copy addresses as email only (not "Name <email>")
defaults write com.apple.mail AddressesIncludeNameOnPasteboard -bool false

# Windows: drag a window from anywhere with Ctrl+Cmd+click (gesture drag)
defaults write -g NSWindowShouldDragOnGesture YES

# Security: ignore Apple Remote Desktop authorization prompts (local admin / scripting convenience)
defaults write com.apple.security.authorization ignoreArd -bool TRUE

# Logitech MX Master 3S: hybrid Bluetooth coexistence with Wi‑Fi (reduces interference; needs sudo)
if [[ "${SKIP_SUDO:-}" != "1" ]]; then
  sudo defaults write /Library/Preferences/com.apple.airport.bt.plist bluetoothCoexMgmt Hybrid
fi

echo "Done. Some changes need a logout/restart (Dock, Finder, menu bar)."
