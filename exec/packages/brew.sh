#!/bin/bash

# shellcheck source=/dev/null
source "$PWD"/config/ui.sh
source "$PWD"/config/cfg.sh

exec_a=(/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)")

ui_start

ui_info "installing brew executable"
ui_cmd "${exec_a[@]}" ; "${exec_a[@]}"

for i in "${_brew_packages_[@]}"
do
  exec=(brew install $i -y)

  ui_info "installing $i package"
  ui_cmd "${exec[@]}" ; "${exec[@]}"
done


ui_done
