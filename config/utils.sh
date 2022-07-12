#!/bin/bash

# shellcheck source=/dev/null
source "$PWD"/config/config.sh

function _GOELAND_apt_packages_install () {
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

function GOELAND_brew_formulaes_install () {
  ARRAY=$@
  for i in $ARRAY; do
    if ! command -v "$i" &> /dev/null; then
      exec=(brew install "$i")
    else
      ui_info "\"$i\" command already exist. Upgrading.."
      exec=(brew upgrade "$i")
    fi
    ui_cmd "${exec[@]}" ; "${exec[@]}"
  done
}

function GOELAND_snap_packages_install () {
  for ((i = 0; i < ${#GOELAND_snap_packages[@]}; i++)) ; do
    if ! command -v "${GOELAND_snap_packages[$i]}" &> /dev/null; then
      exec=(sudo snap install "${GOELAND_snap_packages[$i]}")
    else
      ui_info "\"${GOELAND_snap_packages[$i]}\" command already exist. Refreshing.."
      exec=(sudo snap refresh "${GOELAND_snap_packages[$i]}")
    fi
    ui_cmd "${exec[@]}" ; "${exec[@]}"
  done
}

function GOELAND_vscode_extensions_install () {
  ARRAY=$@
  for i in $ARRAY; do
    if ! command -v "$i" &> /dev/null; then
      exec=(code --install-extension "$i")
    fi
    ui_cmd "${exec[@]}" ; "${exec[@]}"
  done
}
