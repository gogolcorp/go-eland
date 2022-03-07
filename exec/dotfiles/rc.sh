#!/bin/bash

# shellcheck source=/dev/null
source "$PWD"/config/ui.sh
source "$PWD"/config/cfg.sh

ui_start

sourcing="source $HOME/.aliases; source $HOME/.functions"


if [ -f "$HOME"/.zshrc ]; then
  ui_info "$HOME/.zshrc detected"
  if ! grep -q "$sourcing" < "$HOME"/.zshrc ; then
    ui_info "dotfile sourcing not found"
    ui_cmd "$sourcing >> $HOME/.zshrc"
    printf "\n%s\n" "$sourcing" >> "$HOME"/.zshrc
  else
    ui_info "sourcing already found, terminating" 
  fi
else
  ui_error "$HOME/.zshrc not found"
fi

ui_done
