#!/bin/bash

# shellcheck source=/dev/null
source "$PWD"/config/ui.sh
source "$PWD"/config/config.sh
source "$PWD"/config/utils.sh

exec_a=(cp "$PWD"/config/files/vscode-settings.json "$HOME"/.config/Code/User/settings.json)

ui_start

ui_cmd "${exec_a[@]}" ; "${exec_a[@]}"
ui_cmd "${exec_b[@]}" ; "${exec_b[@]}"
ui_done

