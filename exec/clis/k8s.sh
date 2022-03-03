#!/bin/bash

# shellcheck source=/dev/null
source "$PWD"/config/ui.sh
source "$PWD"/config/cfg.sh


ui_start

for i in "${_brew_k8s_packages_[@]}"
do
  exec=(brew install $i -y)

  ui_info "installing $i package"
  ui_cmd "${exec[@]}" ; "${exec[@]}"
done


ui_done
