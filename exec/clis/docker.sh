#!/bin/bash

# shellcheck source=/dev/null
source "$PWD"/config/ui.sh
source "$PWD"/config/cfg.sh

exec_a=$(curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -)
exec_b=(sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu focal stable")
exec_c=(sudo apt install docker-ce)
exec_d=(sudo systemctl status docker)
exec_e=(sudo usermod -aG docker "${USER}")
exec_f=(su - "${USER}")

ui_start

ui_info "Add the GPG key for the official Docker repository"
ui_cmd "${exec_a[@]}" ; "${exec_a[@]}"

ui_info "Add the Docker repository to APT sources"
ui_cmd "${exec_b[@]}" ; "${exec_b[@]}"

ui_info "Install Docker"
ui_cmd "${exec_c[@]}" ; "${exec_c[@]}"

ui_info "Check that Docker is running"
ui_cmd "${exec_d[@]}" ; "${exec_d[@]}"

ui_info "Add your username to the docker group"
ui_cmd "${exec_e[@]}" ; "${exec_e[@]}"

ui_info "Rfresh groups"
ui_cmd "${exec_f[@]}" ; "${exec_f[@]}"

ui_done