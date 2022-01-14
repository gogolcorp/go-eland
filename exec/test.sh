#!/bin/bash

# shellcheck source=/dev/null
source "$PWD"/config/ui.sh
source "$PWD"/config/cfg.sh

ui_start

clear

ui_info "apt packages:"

for i in ${!_apt_packages_[@]}
do
  echo ${_apt_packages[$i]}
done

echo "UI reference:"


ui_error "this isn't workin" 
ui_wip "this is in wip" 
ui_success "this is a success"
ui_info "some info I'm givin u"
ui_cmd "sudo apt updaye -y"

ui_done
