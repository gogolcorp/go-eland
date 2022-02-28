#!/bin/bash

# shellcheck source=/dev/null
source "$PWD"/config/ui.sh
source "$PWD"/config/cfg.sh

exec_a="sudo curl -fsSLo /usr/share/keyrings/kubernetes-archive-keyring.gpg https://packages.cloud.google.com/apt/doc/apt-key.gpg"
exec_b="echo 'deb [signed-by=/usr/share/keyrings/kubernetes-archive-keyring.gpg] https://apt.kubernetes.io/ kubernetes-xenial main' | sudo tee /etc/apt/sources.list.d/kubernetes.list"
exec_c="sudo apt update -y; sudo apt install kubectl -y"

ui_start

ui_info "Download the Google Cloud public signing key"
ui_cmd "$exec_a" ; sudo curl -fsSLo /usr/share/keyrings/kubernetes-archive-keyring.gpg https://packages.cloud.google.com/apt/doc/apt-key.gpg

ui_info "Add the Kubernetes apt repository"
ui_cmd "$exec_b" ; echo 'deb [signed-by=/usr/share/keyrings/kubernetes-archive-keyring.gpg] https://apt.kubernetes.io/ kubernetes-xenial main' | sudo tee /etc/apt/sources.list.d/kubernetes.list

ui_info "Install Kubectl"
ui_cmd "$exec_c" ; sudo apt update -y; sudo apt install kubectl -y

ui_done