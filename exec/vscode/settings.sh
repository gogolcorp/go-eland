#!/bin/bash

# shellcheck source=/dev/null
source "$PWD"/config/ui.sh
source "$PWD"/config/config.sh
source "$PWD"/config/utils.sh

exec=(cp "$PWD"/config/files/vscode-settings.json "$HOME"/.config/Code/User/settings.json)

core__ui_start

core__ui_cmd "${exec[@]}"; "${exec[@]}"
exit_code=$?
core__log_cmd $exit_code "${exec[*]}"

core__ui_done