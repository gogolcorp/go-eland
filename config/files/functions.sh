#!/bin/bash

# base64 encode with clipboard copy
function ___base64_encode___() {
  STR=$(echo -n "$*" | base64 -w0)
  echo "$STR"
  echo "$STR" | xclip -sel clip
}

# base64 decode with clipboard copy
function ___base64_decode___() {
  STR=$(echo -n "$*" | base64 -d -w0)
  echo "$STR"
  echo "$STR" | xclip -sel clip
}

# copy the command output
function ___clipboard___ () {
  STR=$("$*")
  echo "$STR"
  echo "$STR" | xclip -sel clip
}

# delete all Docker ressources
function ___docker_purge___() {
  sleep 1; clear; echo -e "\e[33m[#] ANNIHILATION IN 3 [#]\e[0m"
  sleep 1; clear; echo -e "\e[33m[#] ANNIHILATION IN 2 [#]\e[0m"
  sleep 1; clear; echo -e "\e[31m[#] ANNIHILATION IN 1 [#]\e[0m"
  sleep 1; clear; echo -e "\e[1;33;41m[!] I G N I T I O N [!]\e[0m"
  sleep 1; clear; echo -e "\e[34m[1] STOPING CONTAINERS [1]\e[0m"
  docker stop $(docker ps -a -q)
  sleep 1; clear; echo -e "\e[34m[2] REMOVING CONTAINERS [2]\e[0m"
  docker rm $(docker ps -a -q)
  sleep 1; clear; echo -e "\e[34m[3] REMOVING IMAGES [3]\e[0m"
  docker rmi $(docker images -q)
  sleep 1; clear; echo -e "\e[34m[4] REMOVING VOLUMES [4]\e[0m"
  docker system prune --all --volumes --force
  sleep 1; clear; echo -e "\e[32m[5] SHOW OUTPUT [5]\e[0m"
  docker ps -a ; docker images
  sleep 1; clear; echo -e "\e[1;33;42m[<] ANNIHILATION DONE [>]\e[0m"
  return
}

# find a specific string in environment variables
function ___find_in_aliases___ () {
  alias | grep "$*"
}

# find a specific string in environment variables
function ___find_in_env___ () {
  env | grep "$*"
}

# find a specific string in zsh/bash history
function ___find_in_history___ () {
  history | grep "$*"
}

# config git profile for specific workspace
function ___git_config___ () {
  if [ "$1" = "pro" ] ; then
    git config user.name "alexandre.delaloy"
    git config user.email "alexandre.delaloy@alteia.com"
    echo "git configured [alexandre.delaloy@alteia.com]"
  else
    git config --global user.name "blyndusk" &    git config --global user.email "alexandre.delaloy.pro@gmail.com"
    echo "git configured [alexandre.delaloy.pro@gmail.com]"
  fi
}
function ___git_sync___ () {
  git fetch origin
  if git branch -l | grep -q "master"; then
    git checkout master
  else 
    git checkout main
  fi
  git pull
}

# run Goeland soft
function ___goeland___() {
  cd "$(find ~/go/src/ -type d -name "go-eland" | head -n 1)" || exit
  make run
}

# make directory then change into it
function ___mkdir_cd___() { 
  mkdir -p "$@"
  cd "$_" || exit
  return
}

# open file explorer with given folder
function ___open_fe___() {
	if [ $# -eq 0 ] ; then 
    xdg-open .
	else 
    xdg-open "$@"
  fi
  return
}

# open VSCode with given folder
function ___open_vscode___() {
	if [ $# -eq 0 ] ; then 
    code .
	else 
    code "$@"
  fi
  return
}

# de-sops template
function ___super_sops___() {
  sops -d $1.sops.yaml | gomplate -d "main-config=merge:platform|main" -d main=main-config.yaml -d platform=stdin:///platform.yaml -f ./values.yaml.tpl -o ./values.yaml
}

function ___alteia_ctx___() {
  if [ "$1" = "d" ]; then
    kubectx Alteia-dev
  elif [ "$1" = "s" ]; then
    kubectx Alteia-staging
  elif [ "$1" = "p" ]; then
    kubectx Alteia-prod
  elif [ "$1" = "ges" ]; then
    kubectx GE-preprod
  elif [ "$1" = "gep" ]; then
    kubectx GE-prod
  else
    echo "Invalid flag."
  fi
}
