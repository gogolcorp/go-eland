#!/bin/bash

# shellcheck source=/dev/null
source "$PWD"/config/ui.sh
source "$PWD"/config/cfg.sh

exec_a=(mkdir -p ~/.docker/cli-plugins/)
exec_b=(curl -SL https://github.com/docker/compose/releases/download/v2.2.3/docker-compose-linux-x86_64 -o ~/.docker/cli-plugins/docker-compose)
exec_c=(chmod +x ~/.docker/cli-plugins/docker-compose)
exec_d=(sudo chown "$USER" /var/run/docker.sock)

ui_start

ui_info "Create docker plugins folder"
ui_cmd "${exec_a[@]}" ; "${exec_a[@]}"

ui_info "Download Docker Compose"
ui_cmd "${exec_b[@]}" ; "${exec_b[@]}"

ui_info "Set permissions [1/2]"
ui_cmd "${exec_c[@]}" ; "${exec_c[@]}"

ui_info "Set permissions [2/2]"
ui_cmd "${exec_d[@]}" ; "${exec_d[@]}"

ui_done