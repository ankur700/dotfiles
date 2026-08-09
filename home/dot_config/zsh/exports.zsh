# Shared exports (sourced by zsh and bash)

export STARSHIP_CONFIG="$HOME/.config/starship/starship.toml"
export VISUAL=nvim
export EDITOR=nvim
export HISTSIZE=1000000
export SAVEHIST=$HISTSIZE
export HISTFILESIZE=$HISTSIZE
export LESS="-XRFS"
export FZF_CTRL_T_OPTS="--preview 'bat -n --color=always --style=numbers {}'"
export FZF_ALT_C_OPTS="--preview 'eza --tree --color=always {} | head -200'"

# Ghostty: force a widely supported TERM
if [[ "${TERM_PROGRAM:-}" == "ghostty" ]]; then
  export TERM=xterm-256color
fi

# PATH
export PATH="$PATH:$HOME/bin"
export PATH="$HOME/.local/bin:$PATH"
export PATH="$PATH:$HOME/go/bin"
export PATH="$PATH:$HOME/.config/zfunc"
export PATH="$PATH:$HOME/Library/Python/3.10/bin"
export PATH="$HOME/Library/Application Support/Herd/bin:$PATH"

if command -v brew &>/dev/null; then
  export PATH="$(brew --prefix)/opt/curl/bin:$PATH"
  export PATH="$(brew --prefix)/opt/mysql-client/bin:$PATH"
fi

# Herd PHP ini scan dirs
export HERD_PHP_83_INI_SCAN_DIR="$HOME/Library/Application Support/Herd/config/php/83/"
export HERD_PHP_84_INI_SCAN_DIR="$HOME/Library/Application Support/Herd/config/php/84/"
export HERD_PHP_85_INI_SCAN_DIR="$HOME/Library/Application Support/Herd/config/php/85/"

# pnpm
export PNPM_HOME="$HOME/Library/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME/bin:"*) ;;
  *) export PATH="$PNPM_HOME/bin:$PATH" ;;
esac
