# Cheatsheet

Personal shortcuts for this machine. Sourced from `~/.config/zsh`, AeroSpace, tmux, helix, and common defaults for GUI apps.

**How to open quickly**

| Method | How |
| --- | --- |
| Terminal | `cheat` then pick an app (fzf) · `cheat aerospace` for one section |
| Raycast | Add `~/dotfiles/raycast` as a Script Directory → run **Cheatsheet** → pick app · bind a hotkey in Configure Command |
| AeroSpace | `Alt+Shift+/` opens Ghostty running `cheat` |
| Keyboardy | Install [Keyboardy](https://www.raycast.com/daveonkels/keyboardy) → set path to `~/dotfiles/CHEATSHEET.md` |
| chezmoi | Configs live in `~/dotfiles/home/` · `chezmoi apply` · `chezmoi edit ~/.zshrc` |

---

## AeroSpace

Workspaces: `1–5` general · `B` browser · `C` code · `T` terminal · `M` notes · `E` media · `W` utils/agent

### Focus / move / resize

| Key | Description |
| --- | --- |
| Alt+H/J/K/L | Focus left / down / up / right |
| Alt+Shift+H/J/K/L | Move window left / down / up / right |
| Alt+- | Resize smart −50 |
| Alt+= | Resize smart +50 |
| Alt+/ | Layout tiles (toggle H/V) |
| Alt+, | Layout accordion (toggle H/V) |

### Workspaces

| Key | Description |
| --- | --- |
| Alt+1…5 | Switch workspace 1–5 |
| Alt+B | Workspace B (browser) |
| Alt+C | Workspace C (code) |
| Alt+T | Workspace T (terminal) |
| Alt+M | Workspace M (notes) |
| Alt+E | Workspace E (media/social) |
| Alt+W | Workspace W (utils / Cursor Agent) |
| Alt+Shift+1…5 / B/C/E/M/T/W | Move focused window to that workspace |
| Alt+Tab | Workspace back-and-forth |
| Alt+Shift+Tab | Move workspace to next monitor |

### Service mode

| Key | Description |
| --- | --- |
| Alt+Shift+; | Enter service mode |
| Esc (service) | Reload config → main |
| R (service) | Flatten / reset workspace tree |
| F (service) | Toggle floating ↔ tiling |
| Backspace (service) | Close all windows but current |
| Alt+Shift+H/J/K/L (service) | Join with left/down/up/right |

### Misc

| Key | Description |
| --- | --- |
| Alt+Enter | Open Terminal (legacy binding in config) |
| Alt+Shift+/ | Open this cheatsheet picker (Ghostty + `cheat`) |

---

## Shell aliases

### Config / navigation

| Key | Description |
| --- | --- |
| `zr` | Reload `~/.zshrc` |
| `br` | Reload `~/.bashrc` |
| `zshconfig` | Edit zshrc modules |
| `bashconfig` | Edit bashrc |
| `sshconfig` | Edit `~/.ssh/config` |
| `gitconfig` | Edit git config |
| `sshhome` | `cd ~/.ssh` |
| `ohmyzsh` | `cd ~/.oh-my-zsh` |
| `..` `...` `....` | Up 1 / 2 / 3 directories |
| `c` / `cl` | Clear |
| `ip` | Print LAN IP (`en0`) |
| `cheat` | Interactive cheatsheet (fzf) |

### Git

| Key | Description |
| --- | --- |
| `gs` | `git status` |
| `ga` | `git add` |
| `gita` | `git add .` |
| `gc` | `git checkout` |
| `gdf` | `git diff` |
| `gitl` | `git lg` (log alias) |
| `gitc` | `cz commit` (Commitizen) |
| `gp` | `git push origin` |
| `gpl` | `git pull origin` |
| `gst` | `git stash` |
| `gstl` | `git stash list` |
| `gsp` | `git stash pop` |
| `gsts N` | Show stash@{N} |
| `gstsm N` | Show stash@{N} (-m) |
| `gsta N` | Apply stash@{N} |
| `gstd N` | Drop stash@{N} |

### Docker / files / tools

| Key | Description |
| --- | --- |
| `dc` | `docker compose` |
| `dup` | `docker-compose up -d` |
| `dbuild` | `docker-compose build` |
| `dstop` | `docker stop` |
| `ls` / `ll` / `tree` | `eza` (icons + git) |
| `cat` | `bat` |
| `mv` | `mv -vi` (interactive) |
| `cpv` | `rsync -avh --info=progress2` |
| `loc` | SLOC table for current dir |
| `jsonencode` | Escape stdin as `\n`-joined JSON string |
| `colormap` | Print 256-color map |
| `dots` | `chezmoi cd` (open source repo) |
| `zshconfig` | `chezmoi edit ~/.config/zsh/.zshrc` |
| `bashconfig` | `chezmoi edit ~/.config/bash/bashrc` |
| `theme-tokyo-night` | Starship Tokyo Night + re-add + reload |
| `theme-gruvbox` | Starship Gruvbox + re-add + reload |
| `theme-jetpack` | Starship Jetpack + re-add + reload |
| `theme-nerdfont` | Starship Nerd Font + re-add + reload |

---

## chezmoi

| Key | Description |
| --- | --- |
| `chezmoi diff` | Preview pending changes |
| `chezmoi apply -v` | Apply source → `$HOME` |
| `chezmoi update -v` | `git pull` + apply |
| `chezmoi edit PATH` | Edit source for a target file |
| `chezmoi re-add PATH` | Capture target edits back into source |
| `chezmoi cd` / `dots` | Shell in `~/dotfiles` |
| `chezmoi managed` | List managed targets |
| `./bootstrap.sh` | Brewfile + chezmoi apply |

---

## Terminal tools

### fzf

| Key | Description |
| --- | --- |
| Ctrl+R | Fuzzy history search |
| Ctrl+T | Fuzzy find file → insert path |
| Alt+C | Fuzzy cd into directory |
| Tab | Multi-select (when enabled) |

### zoxide

| Key | Description |
| --- | --- |
| `z foo` | Jump to frecent dir matching `foo` |
| `zi` | Interactive zoxide picker |

### bat / eza / ripgrep / fd

| Key | Description |
| --- | --- |
| `bat file` | Syntax-highlighted file (`cat` aliased) |
| `eza` / `ll` | Modern `ls` |
| `rg pattern` | Fast search |
| `fd name` | Fast find by name |

### lazygit / lazydocker / gh

| Key | Description |
| --- | --- |
| `lazygit` / `lg` | TUI git (if aliased) |
| `c` (lazygit files) | Commitizen commit (custom) |
| `lazydocker` | TUI for Docker/OrbStack |
| `gh pr create` | Create PR |
| `gh pr checkout` | Checkout PR |

### btop / fastfetch / tldr

| Key | Description |
| --- | --- |
| `btop` | Resource monitor |
| `fastfetch` | System info splash |
| `tldr cmd` | Short man pages |

---

## tmux

Prefix: **Ctrl+S** (not Ctrl+B). Vi copy-mode keys.

### Sessions / popups

| Key | Description |
| --- | --- |
| Prefix then `r` | Reload `~/.tmux.conf` |
| Prefix then `f` | Floating popup session |
| Prefix then `q` | Session picker popup |
| Prefix then `o` | `tmux-sessionizer` popup |
| Alt+Space | Switch to last client/session |
| Alt+S then `n`/`d`/`p` | Session attach: never-ending-hole / dotfiles / private |

### Panes / windows

| Key | Description |
| --- | --- |
| Prefix then `;` | Split horizontal (same cwd) |
| Prefix then `'` | Split vertical (same cwd) |
| Prefix then `t` | New window (same cwd) |
| Prefix then `x` | Kill pane |
| Prefix then Ctrl+D | Detach |
| Prefix then `c` | Swap pane down |
| Prefix then `,` / `.` | Resize pane L / R |
| Prefix then `-` / `=` | Resize pane D / U |
| Prefix then H/J/K/L | Vim-aware pane focus |
| Ctrl+Space | Next pane (or pass through in Vim) |
| Ctrl+L | Clear screen + tmux history |

### Copy mode

| Key | Description |
| --- | --- |
| Prefix then `[` | Enter copy mode (default) |
| `v` (copy-mode-vi) | Begin selection |
| `y` | Yank (tmux-yank plugin) |

---

## Helix

Custom Colemak-ish / EU layout: **J K L Ö** instead of H J K L.

### Movement (normal)

| Key | Description |
| --- | --- |
| J | Left |
| K | Down |
| L | Up |
| Ö | Right |
| 0 | Line start |
| ß | Line end |
| G then J/Ö | Goto line start / end |
| Z then K/L | Scroll down / up |

### Edit

| Key | Description |
| --- | --- |
| A | Insert after char |
| D | Delete (no yank) |
| C | Change (no yank) |
| Y / P / R | Yank / paste / replace via **clipboard** |
| Space then C | Toggle comments |
| G then A | Code action |
| G then Q | Reflow (`:reflow`) |
| Ctrl+N / Ctrl+P | Search next / prev |

---

## Ghostty

| Key | Description |
| --- | --- |
| Cmd+N | New window |
| Cmd+T | New tab |
| Cmd+D | Split right |
| Cmd+Shift+D | Split down |
| Cmd+W | Close surface |
| Cmd+Enter | Toggle fullscreen |
| Cmd+, | Preferences |
| Cmd+Shift+, | Relocate config |

Font: JetBrainsMono NFM 14 · themes Catppuccin Latte/Mocha.

**Note:** Do not set `window-width` / `window-height` — fixed sizes make new tabs shrink/resize the window (Ghostty bug). Config uses `window-save-state = always` instead.

**AeroSpace:** macOS native tabs look like separate windows to AeroSpace, so Cmd+T tiles half-screen. Ghostty is set to **float on open**; after launch, tile once with `Alt+Shift+;` then `f`. Prefer `Cmd+D` splits when you want panes without that dance.

---

## Cursor

| Key | Description |
| --- | --- |
| Cmd+L | AI Chat |
| Cmd+I | Inline / Composer edit |
| Cmd+K | Inline generate (editor) |
| Cmd+Shift+P | Command palette |
| Cmd+P | Quick open file |
| Cmd+Shift+E | Explorer |
| Cmd+B | Toggle sidebar |
| Cmd+J | Toggle panel |
| Cmd+` | Terminal |
| Cmd+Shift+` | New terminal |
| Cmd+/ | Toggle line comment |
| Option+Cmd+↑/↓ | Add cursor above/below |
| Cmd+D | Select next match |
| Cmd+Shift+L | Select all matches |
| F2 | Rename symbol |
| F12 | Go to definition |
| Option+F12 | Peek definition |
| Shift+F12 | Find references |
| Cmd+. | Quick fix |
| Cmd+Shift+O | Go to symbol in file |

Agent windows land on AeroSpace workspace **W**.

---

## Zed

| Key | Description |
| --- | --- |
| Cmd+Shift+P | Command palette |
| Cmd+P | File finder |
| Cmd+Shift+F | Project search |
| Cmd+B | Toggle left dock |
| Cmd+J | Toggle bottom dock |
| Cmd+Alt+B | Toggle right dock |
| Cmd+` | Terminal panel |
| Cmd+Shift+E | Project panel |
| Cmd+Shift+X | Extensions |
| Cmd+K Cmd+S | Open keymap |
| Cmd+/ | Toggle comments |
| Cmd+Enter | Confirm / run (context) |
| Cmd+Alt+Enter | Assistant / AI (default map) |
| F2 | Rename |
| F8 / Shift+F8 | Next / prev diagnostic |
| Cmd+Click | Go to definition |

---

## VS Code

| Key | Description |
| --- | --- |
| Cmd+Shift+P | Command palette |
| Cmd+P | Quick open |
| Cmd+Shift+E | Explorer |
| Cmd+B | Toggle sidebar (yours is on the **right**) |
| Cmd+J | Toggle panel |
| Cmd+` | Terminal |
| Cmd+/ | Comment |
| Option+↑/↓ | Move line |
| Option+Shift+↑/↓ | Copy line |
| Cmd+D | Multi-cursor next |
| F2 | Rename |
| F12 | Definition |
| Cmd+K V | Markdown preview side |

Settings: Catppuccin Macchiato · JetBrainsMono Nerd Font · tabs hidden · see `VS-Code-setup.md`.

---

## Zen Browser

Firefox-based — classic Firefox chords apply.

| Key | Description |
| --- | --- |
| Cmd+L | Focus address bar |
| Cmd+T | New tab |
| Cmd+W | Close tab |
| Cmd+Shift+T | Reopen closed tab |
| Cmd+Option+←/→ | Back / forward |
| Ctrl+Tab | Next tab |
| Cmd+1…8 | Jump to tab |
| Cmd+9 | Last tab |
| Cmd+Shift+N | New private window |
| Cmd+F | Find in page |
| Cmd+G / Cmd+Shift+G | Find next / prev |
| Cmd+Shift+A | Add-ons |
| Cmd+, | Settings |
| Space / Shift+Space | Page down / up |

Workspace **B** via AeroSpace.

---

## ZenNotes

Vim-first Markdown notes (workspace **M**). Exact chords depend on your ZenNotes keymap; defaults lean Vim.

| Key | Description |
| --- | --- |
| Esc | Normal mode |
| I / A | Insert / append |
| H J K L | Move (Vim) |
| `/` | Search |
| `dd` | Delete line |
| `yy` / `p` | Yank / paste |
| Cmd+N | New note (typical) |
| Cmd+O | Open / quick switch |
| Cmd+S | Save |
| Cmd+P | Command palette (if enabled) |

---

## Obsidian

| Key | Description |
| --- | --- |
| Cmd+O | Quick switcher |
| Cmd+Shift+F | Search in all files |
| Cmd+P | Command palette |
| Cmd+N | New note |
| Cmd+E | Toggle edit / reading |
| Cmd+G | Open graph |
| Cmd+Option+←/→ | Navigate back / forward |
| Cmd+Click | Follow link |
| [[ | Insert wikilink |
| Cmd+Shift+I | Insert template (with Templates core) |
| Option+Enter | Open link in new tab (common community default) |

Workspace **M**. Pair with ZenNotes however you like (drafting vs long-form vault).

---

## Raycast

| Key | Description |
| --- | --- |
| Option+Space | Open Raycast (common default — use yours) |
| Enter | Run selected |
| Cmd+K | Actions on selection |
| Cmd+, | Raycast settings |
| Tab | Move to argument field |

Pin **Cheatsheet** and assign a global hotkey under Configure Command.

---

## OrbStack / Docker

| Key | Description |
| --- | --- |
| `orb` | OrbStack CLI |
| `docker …` | Docker API via OrbStack |
| `dup` / `dc` | Compose up / compose |
| `lazydocker` | TUI |

Floats on workspace **T**.

---

## TablePlus

| Key | Description |
| --- | --- |
| Cmd+N | New connection / query (context) |
| Cmd+Enter | Run query |
| Cmd+Shift+Enter | Run current statement |
| Cmd+/ | Comment |
| Cmd+R | Refresh |
| Cmd+P | Open anything / search |

Workspace **C**.

---

## macOS system

| Key | Description |
| --- | --- |
| Cmd+Space | Spotlight (Raycast usually replaces) |
| Cmd+Tab | App switcher |
| Cmd+` | Cycle windows of app |
| Cmd+Ctrl+F | Full screen |
| Cmd+Shift+4 | Screenshot selection |
| Cmd+Shift+5 | Screenshot / record UI |
| Ctrl+Cmd+Click | Drag window from anywhere (`macos.sh`) |

Screenshots save to `~/Pictures/Screenshots`.
