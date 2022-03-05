#!/bin/bash

# shellcheck source=/dev/null
source "$PWD"/config/ui.sh
source "$PWD"/config/cfg.sh

ui_start

for i in "${_brew_k8s_packages_[@]}"
do
  if [ "$(which "$i")" != 0 ]; then
    exec=(brew install "$i")
  else
    ui_info "\"$\" command already exist. Updating.."
    exec=(brew install "$i" -y)
  fi

  ui_cmd "${exec[@]}" ; "${exec[@]}"
done

ui_done
