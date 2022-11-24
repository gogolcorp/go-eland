#!/bin/bash

# shellcheck source=/dev/null
source "$PWD"/config/ui.sh
source "$PWD"/config/config.sh
source "$PWD"/config/utils.sh

exec_install=(NONINTERACTIVE=1 /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)")
exec_env=("$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)")

exec_a=(brew update)
exec_b=(brew cleanup)
exec_c=(brew doctor)

ui_start

if ! command -v brew &> /dev/null; then
  ui_info "installing brew executable"
  ui_cmd "${exec_install[@]}" ; NONINTERACTIVE=1 /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  exit_code=$?
  log_cmd $exit_code "${exec_install[*]}"

  if [ -f "$HOME"/.zshrc ]; then
    ui_info "$HOME/.zshrc detected"
    if ! grep -q "${exec_env[@]}" < "$HOME"/.zshrc ; then
      ui_info "dotfile sourcing not found"
      ui_cmd "${exec_env[*]} >> $HOME/.zshrc"
      printf "\n\n%s\n$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)" >> "$HOME"/.zshrc
    exit_code=$?
    log_cmd $exit_code "${exec_env[*]}"

    else
      ui_info "sourcing already found, terminating" 
    fi
  else
    ui_error "$HOME/.zshrc not found"
  fi
else
  ui_info "\"brew\" command already exist. Exiting.."
fi

ui_info "setting env vars"
eval $(/home/linuxbrew/.linuxbrew/bin/brew shellenv)

ui_cmd "${exec_a[@]}" ; "${exec_a[@]}"
exit_code=$?
log_cmd $exit_code "${exec_a[*]}" 

ui_cmd "${exec_b[@]}" ; "${exec_b[@]}"
exit_code=$?
log_cmd $exit_code "${exec_b[*]}" 

ui_cmd "${exec_c[@]}" ; "${exec_c[@]}"
exit_code=$?
log_cmd $exit_code "${exec_c[*]}" 

ui_done
