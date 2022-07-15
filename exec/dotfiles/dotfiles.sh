#!/bin/bash

# shellcheck source=/dev/null
source "$PWD"/config/ui.sh
source "$PWD"/config/config.sh
source "$PWD"/config/utils.sh

ui_start

for i in "${GLD_dotfiles[@]}"
do
  file="$HOME/.$i"
  exec_a=(mv "$HOME"/."$i" "$HOME"/."$i".old)
  exec_b=(cp "$PWD"/config/files/"$i".sh "$HOME"/."$i")
  if [ -f "$file" ]; then
    ui_info "$file already exists, creating old version"
    ui_cmd "${exec_a[@]}" ; "${exec_a[@]}"
  fi
  ui_cmd "${exec_b[@]}" ; "${exec_b[@]}"
done

ui_done