#!/bin/bash

# shellcheck source=/dev/null
source "$PWD"/config/ui.sh
source "$PWD"/config/config.sh
source "$PWD"/config/utils.sh

core__ui_start

exec="printf source $HOME/.aliases; source $HOME/.functions >> $HOME/.zshrc "


if [ -f "$HOME"/.zshrc ]; then
  core__ui_info "$HOME/.zshrc detected"
  if ! grep -q "$exec" < "$HOME"/.zshrc ; then
    core__ui_info "dotfile sourcing not found"
    core__ui_cmd "printf \"$exec\" >> $HOME/.zshrc" ; printf "\n%s\n" "$exec" >> "$HOME"/.zshrc

    exit_code=$?
    core__log_cmd $exit_code "printf \"$exec\" >> $HOME/.zshrc"
    # printf "\n%s\n" "$exec" >> "$HOME"/.zshrc
  else
    core__ui_info "sourcing already found, terminating" 
  fi
else
  core__ui_error "$HOME/.zshrc not found"
fi

core__ui_done
