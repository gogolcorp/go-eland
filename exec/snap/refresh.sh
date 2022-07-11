#!/bin/bash

# shellcheck source=/dev/null
source "$PWD"/config/ui.sh
source "$PWD"/config/cfg.sh
source "$PWD"/config/utils.sh

exec=(sudo snap refresh)

ui_start

ui_cmd "${exec[@]}" ; "${exec[@]}"

ui_done
