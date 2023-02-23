#!/bin/bash

# shellcheck source=/dev/null
source "$PWD"/config/ui.sh
source "$PWD"/config/config.sh
source "$PWD"/config/utils.sh

ui_start

for i in "${!GLD_dotfiles_dist[@]}"
do

  file_src="$PWD/config/files/${GLD_dotfiles_src[$i]}"
  file_dist="$HOME/${GLD_dotfiles_dist[$i]}"
  exec_a=(mv "$file_dist" "$file_dist".old)
  exec_b=(cp "$file_src" "$file_dist")
  if [ -f "$file_dist" ]; then
    ui_info "$file_dist already exists, creating old version"
    ui_cmd "${exec_a[@]}" ; "${exec_a[@]}"
  fi
  ui_cmd "${exec_b[@]}" ; "${exec_b[@]}"
done

ui_done