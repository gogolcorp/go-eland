#!/bin/bash

# shellcheck source=/dev/null
source "$PWD"/config/ui.sh
source "$PWD"/config/config.sh
source "$PWD"/config/utils.sh

exec=(sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended)

core__ui_start

if [ ! -d "$HOME"/.oh-my-zsh/ ]; then
  core__ui_cmd "${exec[@]}" ; "${exec[@]}"
else
  core__ui_info "$HOME/.oh-my-zsh/ folder exists; skipping.."
fi

core__ui_done