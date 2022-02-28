#!/bin/bash

# shellcheck source=/dev/null
source "$PWD"/config/ui.sh
source "$PWD"/config/cfg.sh

exec_a=(sudo curl -L "https://github.com/docker/compose/releases/download/1.26.0/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose)
exec_b=(sudo chmod +x /usr/local/bin/docker-compose)

ui_start

ui_info "Download Docker Compose"
ui_cmd "${exec_a[@]}" ; "${exec_a[@]}"

ui_info "Set permissions"
ui_cmd "${exec_b[@]}" ; "${exec_b[@]}"

ui_done