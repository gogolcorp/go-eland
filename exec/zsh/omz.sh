#!/bin/bash

# shellcheck source=/dev/null
source "$PWD"/config/ui.sh
source "$PWD"/config/cfg.sh

exec=(sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended)

ui_start

if [ -d "$HOME"/.oh-my-zsh/ ]; then
  ui_info "$HOME/.oh-my-zsh/ folder exists; skipping.."
else
  ui_cmd "${exec[@]}" ; "${exec[@]}"
fi

ui_done