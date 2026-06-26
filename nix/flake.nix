{
  description = "My zen nix config";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    nix-darwin.url = "github:nix-darwin/nix-darwin/master";
    nix-darwin.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = inputs@{ self, nix-darwin, nixpkgs }:
  let
    configuration = { pkgs, ... }: {
      # turn off nix-darwin's management of nix installation
      nix = {
        enable = false;
        settings.experimental-features = [ "nix-command" "flakes" ];
      };

      # Allow unfree packages
      nixpkgs.config.allowUnfree = true;

      system.defaults = {
        dock.autohide = true;
        dock.mru-spaces = false;
        finder.AppleShowAllExtensions = true;
        finder.FXPreferredViewStyle = "clmv";
        loginwindow.LoginwindowText = "Less is More";
        screencapture.location = "~/Pictures/screenshots";
        screensaver.askForPasswordDelay = 10;
        spaces.spans-displays = false;
        screencapture.disable-shadow = true;
        screencapture.type = "png";
        finder.ShowExternalHardDrivesOnDesktop = false;
        finder.ShowHardDrivesOnDesktop = false;
        finder.ShowMountedServersOnDesktop = false;
        finder.ShowRemovableMediaOnDesktop = false;
        finder.AppleShowAllFiles = true;
        finder.FXDefaultSearchScope = "SCcf";
        finder.FXEnableExtensionChangeWarning = false;
        finder._FXShowPosixPathInTitle = true;
        finder.ShowStatusBar = false;
      };

      # Use fingerprint for sudo password
      security.pam.services.sudo_local.touchIdAuth = true;

      # List packages installed in system profile.
      environment.systemPackages = [];

      homebrew = {
        enable = true;
        onActivation.cleanup = "uninstall";

        # Taps
        taps = [
          "homebrew/cask-fonts"
          "jesseduffield/lazygit"
          "jorgerojas26/lazysql"
          "shaunsingh/sfmono-nerd-font-ligaturized"
        ];

        # Formulae (Removed systemPackages from Nix, everything is Homebrew)
        brews = [
          # Development Essentials
          "wget"
          "jq"
          "ripgrep"
          "mas"
          "gh"
          "ifstat"
          "switchaudio-osx"
          "sketchybar"

          # Programming & Runtimes
          "nvm"
          "go"
          "git"
          "git-delta"
          "gitleaks"
          "lua"
          "luajit"
          "stylua"
          "cmake"
          "fastfetch"

          # Editors
          "neovim"
          "helix"
          "nvim"

          # Terminal
          "starship"
          "zsh-autocomplete"
          "zsh-autosuggestions"
          "zsh-syntax-highlighting"
          "zsh-fast-syntax-highlighting"
          "zoxide"
          "zsh-vi-mode"
          "zsh"

          # Utilities & Nice to have
          "btop"
          "lazygit"
          "lazysql"
          "gitmux"
          "wireguard-go"
          "bat"
          "commitizen"
          "curl"
          "fzf"
          "gd"
          "lsusb"
          "tmux"
          "borders"
        ];

        # Casks
        casks = [
          # Terminals & Browsers
          "wezterm"
          "ghostty"
          "zen"
          "google-chrome"
          "arc"

          # Office & Media
          "onlyoffice"
          "vlc"

          # Nice to have
          "raycast"
          "keycastr"
          "spotify"
          "obsidian"

          # Fonts (cask fonts)
          "sf-symbols"
          "font-hack-nerd-font"
          "font-jetbrains-mono"
          "font-fira-code"
          "font-caskaydia-cove-nerd-font"
          "font-caskaydia-mono-nerd-font"
          "font-fira-mono-nerd-font"
          "font-iosevka-nerd-font"
          "font-meslo-lg-nerd-font"
          "font-monofur-nerd-font"
          "font-sf-mono"
          "font-sf-mono-nerd-font-ligaturized"
          "font-sf-pro"
          "font-symbols-only-nerd-font"
          "font-victor-mono-nerd-font"
        ];

        # Mac App Store Apps
        masApps = {
          "Wireguard" = 1451685025;
          "Xcode" = 497799835;
          "Vimari" = 1480933944;
          "Signal" = 874139669;
          "WhatsApp" = 1147396723;
        };
      };

      # Shell configuration
      programs.zsh = {
        enable = true;
        enableCompletion = true;
        enableBashCompletion = true;
        shellInit = ''
          # Use modern CLI alternatives
          alias ls="eza --icons --git"
          alias ll="eza -l --icons --git"
          alias tree="eza --tree"
          alias cat="bat"

          # Development shortcuts
          alias dc="docker compose"
          alias g="git"

          # Initialize helpful tools
          eval "$(direnv hook zsh)"
          eval "$(starship init zsh)"
          eval "$(zoxide init zsh)"
        '';
      };

      # Set Git commit hash for darwin-version.
      system.configurationRevision = self.rev or self.dirtyRev or null;

      # Used for backwards compatibility, please read the changelog before changing.
      # $ darwin-rebuild changelog
      system.stateVersion = 6;

      # The platform the configuration will be used on.
      nixpkgs.hostPlatform = "aarch64-darwin";
    };
  in
  {
    # Build darwin flake using:
    # $ darwin-rebuild build --flake .#Chronos
    darwinConfigurations."Chronos" = nix-darwin.lib.darwinSystem {
      modules = [ configuration ];
    };
  };
}
