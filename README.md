# Dotfiles

Managed with **[chezmoi](https://www.chezmoi.io/)**. Packages via **Homebrew Brewfile**. No Nix.

## Layout

| Path | Role |
|------|------|
| `home/` | chezmoi source state (applied into `$HOME`) |
| `.chezmoiroot` | Points chezmoi at `home/` so docs stay at repo root |
| `Brewfile` | Packages (formulae, casks, mas, vscode, …) |
| `bootstrap.sh` | Install Homebrew deps + `chezmoi apply` |
| `macos.sh` | Optional `defaults write` tweaks |
| `CHEATSHEET.md` | Per-app keyboard / alias cheatsheet |
| `mac-setup.md` / `VS-Code-setup.md` | Human-readable setup notes |
| `raycast/` | Raycast Script Commands (add as Script Directory) |

`nvim` is **not** managed here — keep your own `~/.config/nvim`.

### What chezmoi installs

```
~/.zshrc  ~/.zshenv  ~/.bashrc  ~/.gitconfig  ~/.tmux.conf
~/.config/{aerospace,bash,bat,btop,fastfetch,ghostty,helix,starship,tmux,zsh}/
~/.local/bin/cheat
~/Library/Application Support/lazygit/config.yml
```

Shell modules live under `~/.config/zsh/` (aliases, exports, nvm, …). Home wrappers just `source` them.

## Fresh machine

```sh
# one-liner (after chezmoi is available), or:
git clone git@github.com:ankur700/dotfiles.git ~/dotfiles
cd ~/dotfiles
./bootstrap.sh          # brew bundle + chezmoi apply
./macos.sh              # optional system defaults
```

Or with chezmoi only (once brew/chezmoi exist):

```sh
chezmoi init --apply git@github.com:ankur700/dotfiles.git
```

If the clone is already at `~/dotfiles`:

```sh
chezmoi init --source=~/dotfiles
chezmoi apply -v
```

## Day to day

```sh
chezmoi cd                 # open a shell in the source repo
chezmoi edit ~/.zshrc      # edit source for a target file
chezmoi diff               # preview drift
chezmoi apply -v           # write target state
chezmoi re-add ~/.gitconfig  # capture local edits back into source
chezmoi update -v          # git pull + apply

# After editing Brewfile or installing apps:
brew bundle dump --force --file=~/dotfiles/Brewfile
```

## Cheatsheet

```sh
cheat                 # fzf → pick app → bat pager
cheat aerospace
```

- AeroSpace: `Alt+Shift+/` opens Ghostty with the picker
- Raycast: add `~/dotfiles/raycast` as a Script Directory

## Notes

- Source directory is **`~/dotfiles`** (configured in `~/.config/chezmoi/chezmoi.toml` by bootstrap).
- `gh` CLI config is left unmanaged (`_unmanaged/`, gitignored).
- Old `link.sh` symlink workflow is replaced by `chezmoi apply`.
