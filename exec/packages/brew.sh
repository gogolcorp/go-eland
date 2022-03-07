#!/bin/bash

# shellcheck source=/dev/null
source "$PWD"/config/ui.sh
source "$PWD"/config/cfg.sh

exec_b=(brew update)
exec_c=(brew upgrade)
exec_d=(brew cleanup)
exec_e=(brew doctor)

ui_start

if [ "$(which brew)" != 0 ]; then
  ui_info "installing brew executable"
  ui_cmd "NONINTERACTIVE=1 /bin/bash -c $(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)" 
  NONINTERACTIVE=1 /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  if [ -f "$HOME"/.zshrc ]; then
    ui_info "$HOME/.zshrc detected"
    if ! grep -q "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)" < "$HOME"/.zshrc ; then
      ui_info "dotfile sourcing not found"
      ui_cmd "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv) >> $HOME/.zshrc"
      printf "\n%s\n $(/home/linuxbrew/.linuxbrew/bin/brew shellenv)" >> "$HOME"/.zshrc
    else
      ui_info "sourcing already found, terminating" 
    fi
  else
    ui_error "$HOME/.zshrc not found"
  fi
else
  ui_info "\"brew\" command already exist. Exiting.."
fi



ui_cmd "eval $(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
eval $(/home/linuxbrew/.linuxbrew/bin/brew shellenv)
ui_cmd "${exec_b[@]}" ; "${exec_b[@]}"
ui_cmd "${exec_c[@]}" ; "${exec_c[@]}"
ui_cmd "${exec_d[@]}" ; "${exec_d[@]}"
ui_cmd "${exec_e[@]}" ; "${exec_e[@]}"

for i in "${_brew_packages_[@]}"
do
  if [ "$(which "$i")" != 0 ]; then
    exec=(brew install "$i")
  else
    ui_info "\"$\" command already exist. Updating.."
    exec=(brew update "$i")
  fi

  ui_cmd "${exec[@]}" ; "${exec[@]}"
done

ui_done
