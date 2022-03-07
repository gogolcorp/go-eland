#!/bin/bash

function _brew_secure_install_from_array_ () {
  ARRAY=$@
  CASK=$2
  echo $ARRAY
  for i in $ARRAY; do
    if ! command -v "$i" &> /dev/null; then
    temp=" $i"
      exec=(brew install"$CASK""$temp")
    else
      ui_info "\"$i\" command already exist. Updating.."
      exec=(brew upgrade"$CASK""$temp")
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
