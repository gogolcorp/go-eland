#!/bin/bash

# shellcheck source=/dev/null
source "$PWD"/config/ui.sh
source "$PWD"/config/cfg.sh

exec_cmd() {
  git clone https://github.com/zsh-users/"$1".git "${ZSH_CUSTOM:-~/.oh-my-zsh/custom}"/plugins/"$1"
}

ui_start

for i in "${_omz_plugins_[@]}"
do
  exec=(sed -i.old "s/^plugins=(.*/plugins=(\n  $i/g" "$HOME"/.zshrc)

  ui_info "installing $i plugin"
  ui_cmd exec_cmd "$i"; exec_cmd "$i"

  ui_info "write new plugin in ~/.zshrc"
  ui_cmd "${exec[@]}" ; "${exec[@]}"
done

ui_done