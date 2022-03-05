#!/bin/bash

# shellcheck source=/dev/null
source "$PWD"/config/ui.sh
source "$PWD"/config/cfg.sh

function ui() {
  echo "UI REFERENCE:"
  echo "============="
  ui_error "this isn't workin" 
  ui_wip "this is in wip" 
  ui_success "this is a success"
  ui_info "some info I'm givin u"
  ui_cmd "sudo apt update -y"
}

function apt() {
  echo "APT PACKAGES:"
  echo "============="
  for i in "${_apt_packages_[@]}"
  do
    echo "$i"
  done
}

ui_start

ui; echo; apt

ui_done
