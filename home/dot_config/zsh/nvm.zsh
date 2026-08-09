# Lazy-load nvm so interactive shells stay fast.
# First use of nvm/node/npm/npx loads nvm, then runs the real command.
#
# Also prepend the default Node bin to PATH so non-zsh tools (pnpm's
# /bin/sh shim, IDEs, etc.) can `exec node` without loading nvm.

export NVM_DIR="${NVM_DIR:-$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "$HOME/.nvm" || printf %s "$XDG_CONFIG_HOME/nvm")}"

if [ -s "$NVM_DIR/nvm.sh" ]; then
  [ -s "$NVM_DIR/bash_completion" ] && . "$NVM_DIR/bash_completion"

  # Resolve nvm alias → versions/node/<ver>/bin (no full nvm load).
  __nvm_default_bin() {
    local name="default" alias_file ver depth=0

    while [ "$depth" -lt 8 ]; do
      if [ -x "$NVM_DIR/versions/node/$name/bin/node" ]; then
        printf '%s\n' "$NVM_DIR/versions/node/$name/bin"
        return 0
      fi
      if [ -x "$NVM_DIR/versions/node/v${name#v}/bin/node" ]; then
        printf '%s\n' "$NVM_DIR/versions/node/v${name#v}/bin"
        return 0
      fi

      alias_file="$NVM_DIR/alias/$name"
      if [ ! -f "$alias_file" ]; then
        break
      fi

      name="$(tr -d '[:space:]' <"$alias_file")"
      # Empty / "node" / "stable" ⇒ latest installed (nvm's usual meaning)
      if [ -z "$name" ] || [ "$name" = "node" ] || [ "$name" = "stable" ]; then
        ver="$(ls -1 "$NVM_DIR/versions/node" 2>/dev/null | sort -V | tail -1)"
        if [ -n "$ver" ] && [ -x "$NVM_DIR/versions/node/$ver/bin/node" ]; then
          printf '%s\n' "$NVM_DIR/versions/node/$ver/bin"
          return 0
        fi
        break
      fi

      depth=$((depth + 1))
    done
    return 1
  }

  _nvm_bin="$(__nvm_default_bin)" || _nvm_bin=""
  if [ -n "$_nvm_bin" ]; then
    case ":$PATH:" in
      *":$_nvm_bin:"*) ;;
      *) export PATH="$_nvm_bin:$PATH" ;;
    esac
  fi
  unset _nvm_bin
  unset -f __nvm_default_bin

  __load_nvm() {
    unset -f nvm node npm npx __load_nvm 2>/dev/null
    # shellcheck disable=SC1090
    . "$NVM_DIR/nvm.sh"
  }

  nvm() { __load_nvm; nvm "$@"; }
  node() { __load_nvm; node "$@"; }
  npm() { __load_nvm; npm "$@"; }
  npx() { __load_nvm; npx "$@"; }
fi
