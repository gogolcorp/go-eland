#!/bin/bash

# shellcheck source=/dev/null
source "$PWD"/config/ui.sh
source "$PWD"/config/config.sh
source "$PWD"/config/utils.sh

core__ui_start

sourcing="source $HOME/.aliases; source $HOME/.functions"


if [ -f "$HOME"/.zshrc ]; then
  core__ui_info "$HOME/.zshrc detected"
  if ! grep -q "$sourcing" < "$HOME"/.zshrc ; then
    core__ui_info "dotfile sourcing not found"
    core__ui_cmd "$sourcing >> $HOME/.zshrc"
    printf "\n%s\n" "$sourcing" >> "$HOME"/.zshrc
  else
    core__ui_info "sourcing already found, terminating" 
  fi
else
  core__ui_error "$HOME/.zshrc not found"
fi

core__ui_done
