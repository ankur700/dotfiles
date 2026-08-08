# Lazy-load nvm so interactive shells stay fast.
# First use of nvm/node/npm/npx loads nvm, then runs the real command.

export NVM_DIR="${NVM_DIR:-$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "$HOME/.nvm" || printf %s "$XDG_CONFIG_HOME/nvm")}"

if [ -s "$NVM_DIR/nvm.sh" ]; then
  [ -s "$NVM_DIR/bash_completion" ] && . "$NVM_DIR/bash_completion"

  __load_nvm() {
    unset -f nvm node npm npx __load_nvm 2>/dev/null
    # shellcheck disable=SC1090
    . "$NVM_DIR/nvm.sh"
  }

  nvm()  { __load_nvm; nvm  "$@"; }
  node() { __load_nvm; node "$@"; }
  npm()  { __load_nvm; npm  "$@"; }
  npx()  { __load_nvm; npx  "$@"; }
fi
