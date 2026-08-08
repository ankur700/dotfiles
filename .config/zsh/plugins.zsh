# zsh plugins via Homebrew

export ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=#a89984"

if command -v brew &>/dev/null; then
  _brew_prefix="$(brew --prefix)"
  [[ -f "$_brew_prefix/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" ]] &&
    source "$_brew_prefix/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"
  [[ -f "$_brew_prefix/share/zsh-autosuggestions/zsh-autosuggestions.zsh" ]] &&
    source "$_brew_prefix/share/zsh-autosuggestions/zsh-autosuggestions.zsh"
  unset _brew_prefix
fi

# zsh-vi-mode: re-bind fzf after its init (if the plugin is loaded)
typeset -ga zvm_after_init_commands
zvm_after_init_commands+=('[ -f $HOME/.fzf.zsh ] && source $HOME/.fzf.zsh')

# Copy yanks to the macOS clipboard when using zsh-vi-mode
zvm_vi_yank() {
  zvm_yank
  echo -n "${CUTBUFFER}" | pbcopy
  zvm_exit_visual_mode
}
