#!/bin/bash

# shellcheck source=/dev/null
source "$PWD"/config/config.sh

function foo () {
  echo "bar"
}

function core__log_cmd () {
  if [[ ! -d "logs/" ]]; then
    core__ui_info "/logs folder not found; creating"
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



function core__install__apt_packages () {
  ARRAY=$*
  for i in $ARRAY; do
    if ! command -v "$i" &> /dev/null; then
      core__ui_info "installing \"$i\" binary"
      exec=(sudo apt install "$i" -y)
    else
      core__ui_info "upgrade \"$i\" binary because already exist"
      exec=(sudo apt upgrade "$i" -y)
    fi
    core__ui_cmd "${exec[@]}" ; "${exec[@]}"
    exit_code=$?
    core__log_cmd $exit_code "${exec[*]}"
  done
}

function core__brew_formulaes_install () {
  ARRAY=$*
  for i in $ARRAY; do
    if ! command -v "$i" &> /dev/null; then
      core__ui_info "installing \"$i\" binary"
      exec=(brew install "$i")
    else
      core__ui_info "upgrade \"$i\" binary because already exist"
      exec=(brew upgrade "$i")
    fi
    core__ui_cmd "${exec[@]}" ; "${exec[@]}"
    exit_code=$?
    core__log_cmd $exit_code "${exec[*]}"
  done
}

function core__snap_packages_install () {
  
  for ((i = 0; i < ${#core__snap_packages[@]}; i++)) ; do
    if ! command -v "${core__snap_packages[$i]}" &> /dev/null; then
      core__ui_info "installing \"${core__snap_packages[$i]}\" binary"
      exec=(sudo snap install "${core__snap_packages[$i]}")
    else
      core__ui_info "upgrade \"${core__snap_packages[$i]}\" binary because already exist"
      exec=(sudo snap refresh "${core__snap_packages[$i]}")
    fi
    core__ui_cmd "${exec[@]}" ; "${exec[@]}"
    exit_code=$?
    core__log_cmd $exit_code "${exec[*]}"
  done
}

function core__vscode_extensions_install () {
  ARRAY=$*
  for i in $ARRAY; do
    if ! command -v "$i" &> /dev/null; then
      exec=(code --install-extension "$i")
    fi
    core__ui_cmd "${exec[@]}" ; "${exec[@]}"
    exit_code=$?
    core__log_cmd $exit_code "${exec[*]}"
  done
}
