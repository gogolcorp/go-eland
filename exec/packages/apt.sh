#!/bin/bash

# shellcheck source=/dev/null
source "$PWD"/config/ui.sh
source "$PWD"/config/cfg.sh

exec_a=(sudo apt update -y)
exec_b=(sudo apt upgrade -y)

ui_start

ui_cmd "${exec_a[@]}" ; "${exec_a[@]}"
ui_cmd "${exec_b[@]}" ; "${exec_b[@]}"

for i in "${_apt_packages_[@]}"
do
  exec=(sudo apt install "$i" -y)

  ui_info "installing $i package"
  ui_cmd "${exec[@]}" ; "${exec[@]}"
done



ui_done