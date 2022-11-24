#!/bin/bash

# shellcheck source=/dev/null
source "$PWD"/config/config.sh

function foo () {
  echo "bar"
}

function log_cmd () {
  if [[ ! -d "logs/" ]]; then
    ui_info "/logs folder not found; creating"
    mkdir "logs"
  fi
  date_format='+%Y-%m-%dT%H:%M:%S.%3NZ'
  logfile="logs/GLD-$(date '+%Y-%m-%d').log"
  exit_code=$1
  cmd=$2
  if [[ exit_code -ne 0 ]] ; then
    message="$(date $date_format) - FAIL [$exit_code] \"$cmd\""
  else
    message="$(date $date_format) - INFO \"$cmd\""
  fi
  echo "$message" >> "$logfile"
}



function GLD_apt_packages_install () {
  ARRAY=$*
  for i in $ARRAY; do
    if ! command -v "$i" &> /dev/null; then
      ui_info "installing \"$i\" binary"
      exec=(sudo apt install "$i" -y)
    else
      ui_info "upgrade \"$i\" binary because already exist"
      exec=(sudo apt upgrade "$i" -y)
    fi
    ui_cmd "${exec[@]}" ; "${exec[@]}"
    exit_code=$?
    log_cmd $exit_code "${exec[*]}"
  done
}

function GLD_brew_formulaes_install () {
  ARRAY=$*
  for i in $ARRAY; do
    if ! command -v "$i" &> /dev/null; then
      ui_info "installing \"$i\" binary"
      exec=(brew install "$i")
    else
      ui_info "upgrade \"$i\" binary because already exist"
      exec=(brew upgrade "$i")
    fi
    ui_cmd "${exec[@]}" ; "${exec[@]}"
    exit_code=$?
    log_cmd $exit_code "${exec[*]}"
  done
}

function GLD_snap_packages_install () {
  
  for ((i = 0; i < ${#GLD_snap_packages[@]}; i++)) ; do
    if ! command -v "${GLD_snap_packages[$i]}" &> /dev/null; then
      ui_info "installing \"${GLD_snap_packages[$i]}\" binary"
      exec=(sudo snap install "${GLD_snap_packages[$i]}")
    else
      ui_info "upgrade \"${GLD_snap_packages[$i]}\" binary because already exist"
      exec=(sudo snap refresh "${GLD_snap_packages[$i]}")
    fi
    ui_cmd "${exec[@]}" ; "${exec[@]}"
    exit_code=$?
    log_cmd $exit_code "${exec[*]}"
  done
}

function GLD_vscode_extensions_install () {
  ARRAY=$*
  for i in $ARRAY; do
    if ! command -v "$i" &> /dev/null; then
      exec=(code --install-extension "$i")
    fi
    ui_cmd "${exec[@]}" ; "${exec[@]}"
    exit_code=$?
    log_cmd $exit_code "${exec[*]}"
  done
}
