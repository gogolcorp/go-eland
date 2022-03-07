#!/bin/bash

# shellcheck source=/dev/null
source "$PWD"/config/ui.sh
source "$PWD"/config/cfg.sh

exec_a=(git clone https://github.com/spaceship-prompt/spaceship-prompt.git "$HOME/.oh-my-zsh/custom/themes/spaceship-prompt" --depth=1)
exec_b=(ln -s "$HOME/.oh-my-zsh/custom/themes/spaceship-prompt/spaceship.zsh-theme" "$HOME/.oh-my-zsh/themes/spaceship.zsh-theme")
exec_c=(sed -i.old "s/^ZSH_THEME=\".*/ZSH_THEME=\"spaceship\"/g" "$HOME"/.zshrc)

ui_start

if [ -d "$HOME"/.oh-my-zsh/custom/plugins/"$i" ]; then
  ui_info "$i folder exists; skipping plugin"
else
  ui_info "installing 'spaceship-prompt' theme"
  ui_cmd "${exec_a[@]}" ; "${exec_a[@]}"

  ui_info "create symlink"
  ui_cmd "${exec_b[@]}" ; "${exec_b[@]}"

  ui_info "update .zshrc with current prompt"
  ui_cmd "${exec_c[@]}" ; "${exec_c[@]}"
fi


ui_done