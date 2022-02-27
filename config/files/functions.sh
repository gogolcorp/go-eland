#!/bin/bash

# make directory then change into it
function _mkd() { 
  mkdir -p "$@"
  cd "$_" || exit
  return
}

# open file explorer with given folder
function _open() {
	if [ $# -eq 0 ] ; then 
    xdg-open .
	else 
    xdg-open "$@"
  fi
  return
}

# open VSCode with given folder
function _code() {
	if [ $# -eq 0 ] ; then 
    code .
	else 
    code "$@"
  fi
  return
}

# delete all Docker ressources
function _docker_purge() {
  containers=$(docker ps -a -q)
  images=$(docker images -q)

  clear
  echo -e "\e[33m[#] ANNIHILATION IN 3 [#]\e[0m"
  sleep 1; clear
  echo -e "\e[33m[#] ANNIHILATION IN 2 [#]\e[0m"
  sleep 1; clear
  echo -e "\e[31m[#] ANNIHILATION IN 1 [#]\e[0m"
  sleep 1; clear
  echo -e "\e[1;33;41m[!] I G N I T I O N [!]\e[0m"
  sleep 1; clear
  echo -e "\e[34m[1] STOPING CONTAINERS [1]\e[0m"
  docker stop "$containers"
  sleep 1; clear
  echo -e "\e[34m[2] REMOVING CONTAINERS [2]\e[0m"
  docker rm "$containers"
  sleep 1; clear
  echo -e "\e[34m[3] REMOVING IMAGES [3]\e[0m"
  docker rmi "$images"
  sleep 1; clear
  echo -e "\e[34m[4] REMOVING VOLUMES [4]\e[0m"
  docker system prune --all --volumes --force
  sleep 1; clear
  echo -e "\e[32m[5] SHOW OUTPUT [5]\e[0m"
  docker ps -a ; docker images
  sleep 1; clear
  echo -e "\e[1;33;42m[<] ANNIHILATION DONE [>]\e[0m"
  return
}

# kill process by name
function _kp () {
  ps aux | grep "$1" > /dev/null
  mypid=$(pidof "$1")
  if [ "$mypid" != "" ]; then
    kill -9 "$(pidof "$1")"
    if [[ "$?" == "0" ]]; then
      echo "[$1] (PID: $mypid) killed."
    fi
  else
    echo "None killed."
  fi
  return;
}