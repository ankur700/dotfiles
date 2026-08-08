# Shared functions (sourced by zsh and bash)

git_stash_show() {
  git stash show stash@{"$1"}
}

git_stash_show_m() {
  git stash show -m stash@{"$1"}
}

git_stash_apply() {
  git stash apply stash@{"$1"}
}

git_stash_drop() {
  git stash drop stash@{"$1"}
}

# Print a 256-color colormap (handy when picking terminal colors)
colormap() {
  for i in {0..255}; do
    printf "\033[48;5;%sm  \033[0m\033[38;5;%sm%3d\033[0m " "$i" "$i" "$i"
    if (( (i + 1) % 6 == 0 )); then
      printf "\n"
    fi
  done
  printf "\n"
}
