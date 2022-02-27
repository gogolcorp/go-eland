#!/bin/bash

# shellcheck source=/dev/null
source "$PWD"/config/ui.sh
source "$PWD"/config/cfg.sh

exec=(sudo apt install "${_apt_packages_[*]}" -y)

ui_start

ui_cmd "${exec[@]}" ; "${exec[@]}"

ui_done