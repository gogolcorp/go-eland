#!/bin/bash

# shellcheck source=/dev/null
source "$PWD"/config/ui.sh
source "$PWD"/config/config.sh


exec_a=(git clone https://github.com/spaceship-prompt/spaceship-prompt.git "$HOME/.oh-my-zsh/custom/themes/spaceship-prompt" --depth=1)
exec_b=(ln -s "$HOME/.oh-my-zsh/custom/themes/spaceship-prompt/spaceship.zsh-theme" "$HOME/.oh-my-zsh/themes/spaceship.zsh-theme")
exec_c=(sed -i.old "s/^ZSH_THEME=\".*/ZSH_THEME=\"spaceship\"/g" "$HOME"/.zshrc)

core__ui_start

if [ ! -d "$HOME"/.oh-my-zsh/oh-my-zsh/custom/themes/spaceship-prompt ]; then
  core__ui_info "installing 'spaceship-prompt' theme"
  core__ui_cmd "${exec_a[@]}" ; "${exec_a[@]}"

  core__ui_info "create symlink"
  core__ui_cmd "${exec_b[@]}" ; "${exec_b[@]}"

  core__ui_info "update .zshrc with current prompt"
  core__ui_cmd "${exec_c[@]}" ; "${exec_c[@]}"
else
  core__ui_info "folder exists; skipping.."
fi


core__ui_done