#!/bin/bash

# shellcheck source=/dev/null
source "$PWD"/scripts/colors.sh
source "$PWD"/config/cfg.sh

fyellow "[-] starting..." ; sleep 1

for i in "${_DOTFILES[@]}"
do
  if [ -f ~/."$i" ]; then
    neg "[$] mv ~/.$i ~/.$i.old"
    mv ~/."$i" ~/."$i".old 
  fi
  neg "[$] cp config/$i.sh ~/.$i"
  cp "$PWD"/config/"$i".sh ~/."$i" 
done

fgreen "[!] done !" ; sleep 2