#!/bin/zsh

# Install xCode cli tools
echo "Installing commandline tools..."
xcode-select --install

# Homebrew
## Install
echo "Installing Brew..."
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
brew analytics off

## Taps
echo "Tapping Brew..."
brew tap homebrew/cask-fonts
tap "jesseduffield/lazygit"
tap "jorgerojas26/lazysql"
tap "shaunsingh/sfmono-nerd-font-ligaturized"

## Formulae
echo "Installing Brew Formulae..."
### Essentials
brew install wget
brew install jq
brew install ripgrep
brew install mas
brew install gh
brew install ifstat
brew install switchaudio-osx
brew install sketchybar


# programming
brew install "nvm"
brew install "go"
brew install "git"
brew install "git-delta"
brew install "gitleaks"
brew install "lua"
brew install "luajit"
brew install "stylua"


### Terminal
brew install neovim
brew install helix
brew install starship
brew install "zsh-autocomplete"
brew install zsh-autosuggestions
brew install zsh-syntax-highlighting
brew install zsh-fast-syntax-highlighting
brew install "zoxide"
brew install "zsh-vi-mode"


### Nice to have
brew install btop
# brew install svim
brew install lazygit
brew install lazysql
brew install gitmux
brew install wireguard-go
brew install "bat"
brew install "cmake"
brew install "commitizen"
brew install "curl", link: true
brew install "eza"
brew install "fastfetch"
brew install "fd"
brew install "ffmpeg"
brew install "figlet"
brew install "fzf"
brew install "gd"
brew install "lsusb"
brew install "ripgrep"
brew install "tmux"


## Casks
echo "Installing Brew Casks..."
### Terminals & Browsers
brew install --cask wezterm
brew install --cask ghostty
brew install --cask zen
brew install --cask google-chrome
brew install --cask arc

### Office
brew install --cask onlyoffice
brew install --cask vlc

### Nice to have
brew install --cask raycast
brew install --cask keycastr
brew install --cask spotify
brew install --cask obsidian

### Fonts
brew install --cask sf-symbols
brew install --cask font-hack-nerd-font
brew install --cask font-jetbrains-mono
brew install --cask font-fira-code
brew install --cask "font-caskaydia-cove-nerd-font"
brew install --cask "font-caskaydia-mono-nerd-font"
brew install --cask "font-fira-mono-nerd-font"
brew install --cask "font-iosevka-nerd-font"
brew install --cask "font-meslo-lg-nerd-font"
brew install --cask "font-monofur-nerd-font"
brew install --cask "font-sf-mono"
brew install --cask "font-sf-mono-nerd-font-ligaturized"
brew install --cask "font-sf-pro"
brew install --cask "font-symbols-only-nerd-font"
brew install --cask "font-victor-mono-nerd-font"

# Mac App Store Apps
echo "Installing Mac App Store Apps..."
mas install 1451685025 #Wireguard
mas install 497799835 #xCode
mas install 1480933944 #Vimari
mas install 874139669 #Signal
mas install 1147396723 #WhatsApp


# macOS Settings
echo "Changing macOS defaults..."
defaults write com.apple.NetworkBrowser BrowseAllInterfaces 1
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true
defaults write com.apple.spaces spans-displays -bool false
defaults write com.apple.dock autohide -bool true
defaults write com.apple.dock "mru-spaces" -bool "false"
defaults write NSGlobalDomain NSAutomaticWindowAnimationsEnabled -bool false
defaults write com.apple.LaunchServices LSQuarantine -bool false
defaults write NSGlobalDomain com.apple.swipescrolldirection -bool false
defaults write NSGlobalDomain KeyRepeat -int 1
defaults write NSGlobalDomain NSAutomaticSpellingCorrectionEnabled -bool false
defaults write NSGlobalDomain AppleShowAllExtensions -bool true
defaults write NSGlobalDomain _HIHideMenuBar -bool true
defaults write NSGlobalDomain AppleHighlightColor -string "0.65098 0.85490 0.58431"
defaults write NSGlobalDomain AppleAccentColor -int 1
defaults write com.apple.screencapture location -string "$HOME/Pictures/Screenshots"
defaults write com.apple.screencapture disable-shadow -bool true
defaults write com.apple.screencapture type -string "png"
defaults write com.apple.finder DisableAllAnimations -bool true
defaults write com.apple.finder ShowExternalHardDrivesOnDesktop -bool false
defaults write com.apple.finder ShowHardDrivesOnDesktop -bool false
defaults write com.apple.finder ShowMountedServersOnDesktop -bool false
defaults write com.apple.finder ShowRemovableMediaOnDesktop -bool false
defaults write com.apple.Finder AppleShowAllFiles -bool true
defaults write com.apple.finder FXDefaultSearchScope -string "SCcf"
defaults write com.apple.finder FXEnableExtensionChangeWarning -bool false
defaults write com.apple.finder _FXShowPosixPathInTitle -bool true
defaults write com.apple.finder FXPreferredViewStyle -string "Nlsv"
defaults write com.apple.finder ShowStatusBar -bool false
defaults write com.apple.TimeMachine DoNotOfferNewDisksForBackup -bool YES
defaults write com.apple.Safari AutoOpenSafeDownloads -bool false
defaults write com.apple.Safari IncludeDevelopMenu -bool true
defaults write com.apple.Safari WebKitDeveloperExtrasEnabledPreferenceKey -bool true
defaults write com.apple.Safari com.apple.Safari.ContentPageGroupIdentifier.WebKit2DeveloperExtrasEnabled -bool true
defaults write NSGlobalDomain WebKitDeveloperExtras -bool true
defaults write com.apple.mail AddressesIncludeNameOnPasteboard -bool false
defaults write -g NSWindowShouldDragOnGesture YES
defaults write com.apple.security.authorization ignoreArd -bool TRUE

## Fix for MX Master 3S
sudo defaults write /Library/Preferences/com.apple.airport.bt.plist bluetoothCoexMgmt Hybrid

# Copying and checking out configuration files
echo "Planting Configuration Files..."
[ ! -d "$HOME/dotfiles" ] && git clone --bare git@github.com:ankur700/dotfiles.git $HOME/dotfiles
git --git-dir=$HOME/dotfiles/ --work-tree=$HOME checkout master

# Installing Fonts
git clone git@github.com:shaunsingh/SFMono-Nerd-Font-Ligaturized.git /tmp/SFMono_Nerd_Font
mv /tmp/SFMono_Nerd_Font/* $HOME/Library/Fonts
rm -rf /tmp/SFMono_Nerd_Font/

# symlinks
echo "Creating Symlinks..."

# symlink .config dir
ln -s -f ~/dotfiles/.config/aerospace ~/.config/
ln -s -f ~/dotfiles/.config/bat ~/.config/
ln -s -f ~/dotfiles/.config/btop ~/.config/

ln -s -f ~/dotfiles/.config/figlet ~/.config/
ln -s -f ~/dotfiles/.config/ghostty ~/.config/
ln -s -f ~/dotfiles/.config/helix ~/.config/
ln -s -f ~/dotfiles/.config/nvim/ ~/.config/
ln -s -f ~/dotfiles/.config/starship ~/.config/
ln -s -f ~/dotfiles/.config/tmux/ ~/.config/
ln -s -f ~/dotfiles/.config/wezterm ~/.config/

ln -s -f ~/dotfiles/.config/git/.gitconfig ~/.gitconfig
ln -s -f ~/dotfiles/.config/gitmux/.gitmux.conf ~/.gitmux.conf
ln -s -f ~/dotfiles/.config/lazygit/config.yaml ~/Library/Application\ Support/lazygit/config.yml
ln -s -f ~/dotfiles/.config/lazysql/config.yaml ~/Library/Application\ Support/lazysql/config.toml
ln -s -f ~/dotfiles/.config/tmux/.tmux.conf ~/.tmux.conf
ln -s -f ~/dotfiles/.config/tmuxifier/* ~/.tmuxifier/layouts/
ln -s -f ~/dotfiles/.config/zsh/.zshenv ~/.zshenv
ln -s -f ~/dotfiles/.config/zsh/.zshrc ~/.zshrc

source $HOME/.zshrc
cfg config --local status.showUntrackedFiles no

# Start Services
echo "Starting Services (grant permissions)..."
brew services start aerospace
brew services start borders
# brew services start svim

csrutil status

echo "Installation complete...\n"
