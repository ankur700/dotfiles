## My Mac Setup

This repo’s companion notes for the apps, tools, and settings I use on my Mac.
The installable source of truth is [`Brewfile`](./Brewfile) + [`bootstrap.sh`](./bootstrap.sh).

<!-- START doctoc generated TOC please keep comment here to allow auto update -->
<!-- DON'T EDIT THIS SECTION, INSTEAD RE-RUN doctoc TO UPDATE -->

- [What Macbook do I have?](#what-macbook-do-i-have)
- [OS Settings](#os-settings)
  - [Desktop](#desktop)
  - [Finder](#finder)
  - [Dock](#dock)
- [Quick Launching](#quick-launching)
- [Homebrew](#homebrew)
- [Window Management](#window-management)
- [Menu Bar Utilities](#menu-bar-utilities)
- [Web Browser](#web-browser)
- [Other Apps I Use Daily](#other-apps-i-use-daily)
  - [Containers](#containers)
- [Terminal](#terminal)
  - [Shell](#shell)
  - [Github SSH Setup](#github-ssh-setup)
  - [Other command line tools I use](#other-command-line-tools-i-use)
- [Node.js](#nodejs)
- [PHP / Laravel](#php--laravel)
- [VS Code](#vs-code)

<!-- END doctoc generated TOC please keep comment here to allow auto update -->

## What Macbook do I have?

I am using a **MacBook Air (M4)** for personal / day-to-day work.

Specs:

* Apple M4
* 16GB RAM
* macOS 26 (Tahoe)

## OS Settings

Preferred `Desktop`, `Finder`, and `Dock` behaviour. Most of this is also encoded in [`macos.sh`](./macos.sh).

### Desktop

I keep the desktop clean — no clutter icons.

* System Settings → Desktop & Dock
  * Show Items → On Desktop → off (external / hard drives / removable / servers off)
  * Stage Manager → off

### Finder

* Finder → Settings
  * General → Show these on the desktop → none
  * General → New Finder windows show → Home
  * Advanced → Show all filename extensions → Yes
  * Advanced → Show warning before changing an extension → No
  * Advanced → When performing a search → Search the Current Folder
* View
  * Show Path Bar (optional)
  * Default view → List

`macos.sh` also enables showing hidden files and full POSIX paths in the title bar.

### Dock

I barely use the Dock. Raycast launches apps; AeroSpace tiles windows.

* Desktop & Dock
  * Automatically hide and show the Dock → Yes
  * Size → as small as comfortable
  * Don’t rearrange Spaces based on most recent use

## Quick Launching

Spotlight is fine, but [Raycast](https://www.raycast.com/) is faster for apps, snippets, window actions, and Homebrew search.

```sh
brew install --cask raycast
```

Useful: [Raycast Homebrew extension](https://www.raycast.com/nhojb/brew).

Add `~/dotfiles/raycast` as a Raycast **Script Directory** for the Cheatsheet commands. Bind a hotkey on **Cheatsheet** (dropdown by app) or use AeroSpace `Alt+Shift+/` for the fzf picker. Full sheet: [`CHEATSHEET.md`](./CHEATSHEET.md).

## Homebrew

[Homebrew](https://brew.sh/) installs almost everything.

```sh
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

Then from this repo:

```sh
cd ~/dotfiles
./bootstrap.sh          # brew bundle + chezmoi apply
./macos.sh              # optional defaults
```

Day to day:

```sh
chezmoi apply -v
chezmoi update -v
brew bundle dump --force --file=~/dotfiles/Brewfile
```

## Window Management

I use [AeroSpace](https://github.com/nikitabobko/AeroSpace) (i3-like tiling for macOS) instead of Rectangle.

```sh
brew install --cask nikitabobko/tap/aerospace
```

Config lives in [`home/dot_config/aerospace/aerospace.toml`](./home/dot_config/aerospace/aerospace.toml).

## Menu Bar Utilities

### Hidden Bar

[Hidden Bar](https://github.com/dwarvesf/hidden) tucks excess menu-bar icons away.

```sh
brew install --cask hiddenbar
```

### Vorssaint / calendar

Vorssaint for menu-bar tooling. [Itsycal](https://www.mowglii.com/itsycal/) for a calendar popover if you want the date out of the system clock.

### Caffeine

[Caffeine](https://www.caffeine-app.net/) keeps the machine awake when presenting / streaming.

```sh
brew install --cask caffeine
```

## Web Browser

Primary browsers:

* [Zen](https://zen-browser.app/) — Gecko-based daily driver
* Google Chrome — when something needs Chromium
* Safari — for Apple-only bits / testing

## Other Apps I Use Daily

Install via Brewfile / `brew install --cask …`:

| App | Why |
|-----|-----|
| [Ghostty](https://ghostty.org/) | GPU terminal |
| [Visual Studio Code](https://code.visualstudio.com/) | Main GUI editor |
| [Cursor](https://cursor.com/) | AI-assisted coding |
| [Zed](https://zed.dev/) | Fast native editor |
| [Herd](https://herd.laravel.com/) | PHP / Laravel local stack |
| [OrbStack](https://orbstack.dev/) | Docker replacement |
| [Obsidian](https://obsidian.md/) | Notes |
| [ZenNotes](https://zennotes.app/) | Vim-first Markdown notes |
| [TablePlus](https://tableplus.com/) | Databases |
| [Telegram](https://telegram.org/) / WhatsApp | Messaging |
| [Spotify](https://spotify.com/) | Music |
| [VLC](https://www.videolan.org/) | Video |
| [Keka](https://www.keka.io/) | Archives |
| [LuLu](https://objective-see.org/products/lulu.html) | Outbound firewall |
| [KeyCastr](https://github.com/keycastr/keycastr) | Keystroke overlay when presenting |
| [ONLYOFFICE](https://www.onlyoffice.com/) | Docs |
| Slack / Discord | Chat when needed |

Mac App Store (`mas`):

* Boop
* LocalSend
* WhatsApp
* Xcode

### Containers

Prefer OrbStack over Docker Desktop:

```sh
brew install --cask orbstack
```

## Terminal

I use [Ghostty](https://ghostty.org/) — fast, native, GPU-accelerated.

```sh
brew install --cask ghostty
```

Config: [`home/dot_config/ghostty/config.ghostty`](./home/dot_config/ghostty/config.ghostty).

Fonts: JetBrains Mono Nerd Font (and a few other Nerd Fonts in the Brewfile).

tmux config lives under [`home/dot_config/tmux/`](./home/dot_config/tmux/).

### Shell

Default shell is **zsh** with [Oh My Zsh](https://ohmyz.sh/), plus Homebrew plugins:

* `zsh-autosuggestions`
* `zsh-syntax-highlighting`
* `zsh-vi-mode`

Prompt: [Starship](https://starship.rs/) — [`home/dot_config/starship/starship.toml`](./home/dot_config/starship/starship.toml).

Dotfiles are managed with [chezmoi](https://www.chezmoi.io/). Shell modules live under `home/dot_config/zsh/` (applied to `~/.config/zsh/`):

```
home/dot_config/zsh/
  dot_zshrc            # → ~/.config/zsh/.zshrc
  dot_zshenv
  exports.zsh
  aliases.zsh
  functions.zsh
  nvm.zsh              # lazy-loaded nvm
  tools.zsh            # fzf / zoxide / starship
  plugins.zsh
```

Home wrappers (`~/.zshrc`, `~/.zshenv`) just source those files. Edit with `chezmoi edit ~/.config/zsh/.zshrc`.

### Github SSH Setup

* [Generate an SSH key](https://docs.github.com/en/authentication/connecting-to-github-with-ssh/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent)
* [Add it to GitHub](https://docs.github.com/en/authentication/connecting-to-github-with-ssh/adding-a-new-ssh-key-to-your-github-account)

### Other command line tools I use

From the Brewfile (highlights):

* `bat` `eza` `fd` `fzf` `ripgrep` `zoxide` — everyday CLI
* `gh` `lazygit` `lazydocker` `git-delta` — git / containers UI
* `neovim` `helix` `tmux` — editors / multiplexer
* `ffmpeg` `imagemagick` — media
* `btop` `fastfetch` — system info
* `opencode` / `omp` — terminal AI agents

```sh
brew bundle --file=~/dotfiles/Brewfile
```

## Node.js

[nvm](https://github.com/nvm-sh/nvm) manages Node versions. It is **lazy-loaded** in the shell so startup stays fast (`nvm` / `node` / `npm` / `npx` load on first use).

```sh
brew install nvm
nvm install --lts
```

Globals I care about (also in Brewfile `npm` lines): `pnpm`, `typescript`, `tree-sitter-cli`, etc.

## PHP / Laravel

[Laravel Herd](https://herd.laravel.com/) for PHP binaries, nginx, and per-version ini dirs. PATH / `HERD_PHP_*_INI_SCAN_DIR` are set in `.config/zsh/exports.zsh`.

```sh
brew install --cask herd
```

## VS Code

See [VS-Code-setup.md](./VS-Code-setup.md) for themes, extensions, and `settings.json`.
Extensions are also listed as `vscode "..."` lines in the Brewfile.
