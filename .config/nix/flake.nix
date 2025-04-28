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
        # Core utilities
        pkgs.tmux
        pkgs.oh-my-zsh
        pkgs.starship
        pkgs.neofetch
        
        # Development tools
        pkgs.gh
        pkgs.git
        pkgs.lazygit
        pkgs.volta
        pkgs.pnpm
        pkgs.yarn
        pkgs.python3
        pkgs.gnumake
        pkgs.cmake
        
        # Editors
        pkgs.neovim
        pkgs.code-cursor
        pkgs.zed-editor

        # Container tools
        pkgs.docker
        pkgs.docker-compose
        pkgs.lazydocker
        
        # Database tools
        pkgs.sqlite
        pkgs.postgresql_15
        
        # Search and navigation
        pkgs.ripgrep
        pkgs.fzf
        pkgs.fd
        pkgs.zoxide
        pkgs.bat
        pkgs.eza
        
        # Network and API tools
        pkgs.curl
        pkgs.wget
        pkgs.httpie
        pkgs.jq
        
        # System utilities
        pkgs.localsend
        pkgs.keycastr
        pkgs.xz
        pkgs.zsh-autocomplete
        pkgs.openssl
        pkgs.direnv
      ];

      homebrew = {
        enable = true;
        onActivation.cleanup = "uninstall";

        brews = [
          "watchman"     # React Native development
          "mkcert"      # Local SSL certificates
        ];
        casks = [
          # Development
          "visual-studio-code"
          "ghostty"
          "warp"
          "orbstack"
          "tableplus"   # Database GUI
          
          # Browsers
          "google-chrome"
	  "zen-browser"
          
          # Utilities
          "raycast"     # Spotlight replacement
          "rectangle"   # Window management
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
