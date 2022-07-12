#!/bin/bash

# shellcheck source=/dev/null
source "$PWD"/config/ui.sh
source "$PWD"/config/config.sh
source "$PWD"/config/utils.sh

exec=(sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended)

ui_start

if [ ! -d "$HOME"/.oh-my-zsh/ ]; then
  ui_cmd "${exec[@]}" ; "${exec[@]}"
else
  ui_info "$HOME/.oh-my-zsh/ folder exists; skipping.."
fi

ui_done