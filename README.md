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

`nvim` is **not** managed here — keep your own `~/.config/nvim` (e.g. kickstart). Do not put an `nvim` folder back under `.config/` in this repo.

Shell: `zsh` is primary (`.config/zsh/.zshrc`). `.config/bash/bashrc` mirrors the shared bits for rare bash use.

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

## Notes

- `Brewfile` was generated from this machine plus extras that were listed in the old `install.sh` but not installed yet. Prune what you do not want.
- VS Code extensions are in the `Brewfile` (`vscode "..."` lines); `vscode-extensions.txt` is leftover and optional.
- If you previously used nix-darwin, check that `/etc/zshrc` and `/etc/bashrc` are real files (not broken links to `/etc/static`). Determinate’s uninstaller may leave those behind.
