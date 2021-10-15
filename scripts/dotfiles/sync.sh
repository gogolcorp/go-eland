#!/bin/bash

# shellcheck source=/dev/null
source "$PWD"/scripts/colors.sh
source "$PWD"/config/cfg.sh

fyellow "[-] starting..." ; sleep 1

for i in "${_DOTFILES[@]}"
do
  if [ -f ~/."$i" ]; then
    echo "mv ~/.$i ~/.$i.old"
    mv ~/."$i" ~/."$i".old 
  fi
  echo "cp scripts/dotfiles/$i.sh ~/.$i"
  cp "$PWD"/scripts/dotfiles/"$i".sh ~/."$i" 
done

fgreen "[-] done !" ; sleep 1