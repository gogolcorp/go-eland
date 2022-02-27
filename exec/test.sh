#!/bin/bash

# shellcheck source=/dev/null
source "$PWD"/config/ui.sh
source "$PWD"/config/cfg.sh

ui_start

ui_info "apt packages:"


arr=_apt_packages_
for i in "${arr[@]}"
do
  echo "${arr$i]}"
done

echo "UI reference:"


ui_error "this isn't workin" 
ui_wip "this is in wip" 
ui_success "this is a success"
ui_info "some info I'm givin u"
ui_cmd "sudo apt updaye -y"

ui_done
