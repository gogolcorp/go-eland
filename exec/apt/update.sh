#!/bin/bash

# shellcheck source=/dev/null
source "$PWD"/config/ui.sh
source "$PWD"/config/config.sh
source "$PWD"/config/utils.sh

exec_a=(sudo apt update -y)
exec_b=(sudo apt upgrade -y)

ui_start

ui_cmd "${exec_a[@]}" ; "${exec_a[@]}"
ui_cmd "${exec_b[@]}" ; "${exec_b[@]}"

ui_done