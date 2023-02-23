#!/bin/bash

# shellcheck source=/dev/null
source "$PWD"/config/ui.sh
source "$PWD"/config/config.sh
source "$PWD"/config/utils.sh

core__ui_start

for i in "${core__dotfiles[@]}"
do
  file="$HOME/.$i"
  exec_a=(mv "$HOME"/."$i" "$HOME"/."$i".old)
  exec_b=(cp "$PWD"/config/files/"$i".sh "$HOME"/."$i")
  if [ -f "$file" ]; then
    core__ui_info "$file already exists, creating old version"

    core__ui_cmd "${exec_a[@]}"; "${exec_a[@]}"
    exit_code=$?
    core__log_cmd $exit_code "${exec_a[*]}"
  fi
  core__ui_cmd "${exec_b[@]}"; "${exec_b[@]}"
  exit_code=$?
  core__log_cmd $exit_code "${exec_b[*]}"
done

core__ui_done