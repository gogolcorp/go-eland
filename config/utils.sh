#!/bin/bash

# shellcheck source=/dev/null
source "$PWD"/config/cfg.sh

function _brew_secure_install_from_array_ () {
  ARRAY=$@
  for i in $ARRAY; do
    if ! command -v "$i" &> /dev/null; then
      exec=(brew install "$i")
    else
      ui_info "\"$i\" command already exist. Updating.."
      exec=(brew upgrade "$i")
    fi
    ui_cmd "${exec[@]}" ; "${exec[@]}"
  done
}


function _apt_secure_install_from_array_ () {
  ARRAY=$@
  for i in $ARRAY; do
    if ! command -v "$i" &> /dev/null; then
      exec=(sudo apt install "$i" -y)
    else
      ui_info "\"$i\" command already exist. Skipping.."
    fi
    ui_cmd "${exec[@]}" ; "${exec[@]}"
  done
}

function _snap_secure_install_from_array_ () {
  for ((i = 0; i < ${#_snap_packages_[@]}; i++)) ; do
    if ! command -v "${_snap_packages_[$i]}" &> /dev/null; then
      exec=(sudo snap install "${_snap_packages_[$i]}")
    else
      ui_info "\"${_snap_packages_[$i]}\" command already exist. Refreshing.."
      exec=(sudo snap refresh "${_snap_packages_[$i]}")
    fi
    ui_cmd "${exec[@]}" ; "${exec[@]}"
  done
}

function _vscode_secure_install_from_array_ () {
  ARRAY=$@
  for i in $ARRAY; do
    if ! command -v "$i" &> /dev/null; then
      exec=(code --install-extension "$i")
    fi
    ui_cmd "${exec[@]}" ; "${exec[@]}"
  done
}