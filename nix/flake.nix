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
        loginwindow.LoginwindowText = "You miss 100% of the shots you don't take.";
        screencapture.location = "~/Pictures/screenshots";
        screensaver.askForPasswordDelay = 10;
      };

      # Use fingerprint for sudo password
      security.pam.services.sudo_local.touchIdAuth = true;

      # List packages installed in system profile.
      environment.systemPackages = [

        # Development tools
        pkgs.volta
        pkgs.pnpm
        pkgs.yarn
        pkgs.python3
        pkgs.gnumake
        pkgs.cmake

        # Productivity
        pkgs.obsidian

        # Editors
        pkgs.neovim

        # Container tools
        pkgs.docker
        pkgs.docker-compose
        pkgs.lazydocker

        # Search and navigation
        pkgs.fd

        # Network and API tools
        pkgs.curl
        pkgs.httpie

        # System utilities
        pkgs.localsend
        pkgs.keycastr
        pkgs.xz
        pkgs.openssl
        pkgs.direnv
      ];

      homebrew = {
        enable = true;
        onActivation.cleanup = "uninstall";

        brews = [
          "watchman"     # React Native development
          "mkcert"      # Local SSL certificates
          "lua"
          "luarocks"
          "wget"
          "jq"
          "eza"
          "bat"
          "fzf"
          "gh"
          "git"
          "lazygit"
          "ripgrep"
          "mas"
          "gh"
          "ifstat"
          "switchaudio-osx"
          "skhd"
          "sketchybar"
          "borders"
          "neovim"
          "starship"
          "zsh-autosuggestions"
          "zsh-fast-syntax-highlighting"
          "lulu"
          "lazygit"
          "btop"
        ];
        casks = [
          # Development
          "visual-studio-code"
          "ghostty"
          "warp"
          "orbstack"
          "herd"
          "signal"
          "lm-studio"
          "spotify"
          "tableplus"   # Database GUI
          "libreoffice"
          "zoom"
          "meetingbar"
          "vlc"

          # Browsers
          "arc"
          "google-chrome"
	        "zen-browser"
          "orion"

          # Utilities
          "raycast"     # Spotlight replacement
          "alt-tab"    # Window switcher
          "imageoptim"
          "signal"
          "vlc"

          # Fonts
          "font-jetbrains-mono-nerd-font"
          "font-caskaydia-cove-nerd-font"
          "font-fira-code-nerd-font"
        ];

        masApps = {
          # Add specific apps here with their IDs
          # Example: "Xcode" = 497799835;
          "WhatsApp" = 310633997;
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
