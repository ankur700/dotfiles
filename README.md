# Dotfiles

Simple macOS setup: **Homebrew Brewfile** + **symlink script**. No Nix.

## Layout

| Path | Role |
|------|------|
| `Brewfile` | Packages (formulae, casks, mas, vscode, …) |
| `bootstrap.sh` | Install Homebrew deps + run `link.sh` |
| `link.sh` | Symlink configs into `$HOME` |
| `macos.sh` | Optional `defaults write` tweaks |
| `.config/` | Tracked app configs |
| `mac-setup.md` | Human-readable Mac apps / settings notes |
| `VS-Code-setup.md` | VS Code themes / extensions / settings |
| `CHEATSHEET.md` | Per-app keyboard / alias cheatsheet |
| `bin/cheat` | fzf picker for `CHEATSHEET.md` |
| `raycast/` | Raycast Script Commands (Cheatsheet dropdown + fzf) |

`nvim` is **not** managed here — keep your own `~/.config/nvim` (e.g. kickstart). Do not put an `nvim` folder back under `.config/` in this repo.

Shell: `zsh` is primary. Config is modular under `.config/zsh/` (same idea as the old `~/.zsh/*.zsh` layout):

```
.config/zsh/
  .zshrc           # oh-my-zsh + sources the modules below
  .zshenv          # early PATH / brew shellenv
  exports.zsh      # PATH, EDITOR, Herd, FZF opts, …
  aliases.zsh
  functions.zsh
  nvm.zsh          # lazy-loaded nvm (faster shell start)
  tools.zsh        # fzf / zoxide / starship
  plugins.zsh      # autosuggestions / syntax highlighting / vi-mode hooks
```

`.config/bash/bashrc` sources the shared modules for rare bash use.

## Fresh machine

```sh
git clone git@github.com:ankur700/dotfiles.git ~/dotfiles
cd ~/dotfiles
./bootstrap.sh          # packages + symlinks
./macos.sh              # optional system defaults
```

Or `./bootstrap.sh --macos` to do both.

## Day to day

```sh
# After editing Brewfile or installing apps on this machine:
brew bundle dump --force --file=~/dotfiles/Brewfile

# After adding/changing tracked configs:
~/dotfiles/link.sh
```

## Cheatsheet

```sh
cheat                 # fzf → pick app → bat pager
cheat aerospace       # jump straight to a section
```

- **AeroSpace:** `Alt+Shift+/` opens Ghostty with the picker
- **Raycast:** Settings → Extensions → Script Commands → Add Script Directory → `~/dotfiles/raycast`  
  Then run **Cheatsheet**, pick an app, and optionally bind a hotkey via Configure Command  
  Or install [Keyboardy](https://www.raycast.com/daveonkels/keyboardy) and point it at `~/dotfiles/CHEATSHEET.md` for searchable UI

## Notes

- `Brewfile` was generated from this machine plus extras that were listed in the old `install.sh` but not installed yet. Prune what you do not want.
- VS Code extensions are in the `Brewfile` (`vscode "..."` lines); see `VS-Code-setup.md` for the write-up.
- If you previously used nix-darwin, check that `/etc/zshrc` and `/etc/bashrc` are real files (not broken links to `/etc/static`). Determinate’s uninstaller may leave those behind.
