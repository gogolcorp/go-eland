#!/bin/bash

# shellcheck source=/dev/null
source "$PWD"/config/ui.sh
source "$PWD"/config/cfg.sh

exec_a="curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -"
exec_b=(sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu focal stable")
exec_c=(sudo apt install docker-ce -y)
exec_d=(sudo systemctl status docker)
exec_e=(sudo usermod -aG docker "${USER}")

ui_start

if [ "$(which docker)" != 0 ]; then
  ui_info "Add the GPG key for the official Docker repository"
  ui_cmd "$exec_a" ; curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

  ui_info "Add the Docker repository to APT sources"
  ui_cmd "${exec_b[@]}" ; "${exec_b[@]}"

  ui_info "Install Docker"
  ui_cmd "${exec_c[@]}" ; "${exec_c[@]}"

  ui_info "Check that Docker is running"
  ui_cmd "${exec_d[@]}" ; "${exec_d[@]}"

  ui_info "Add your username to the docker group"
  ui_cmd "${exec_e[@]}" ; "${exec_e[@]}"
else
  ui_info "\"docker\" command already exist. Exiting.."
fi

ui_done