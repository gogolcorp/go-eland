#!/bin/bash

# shellcheck source=/dev/null
source "$PWD"/scripts/colors.sh
source "$PWD"/config/cfg.sh

fyellow "[-] starting..." ; sleep 1
sourcing="source ~/.aliases; source ~/.functions"

if [ -f ~/.zshrc ]; then
  fblue "[?] ~/.zshrc detected"
  if ! grep -q "$sourcing" < ~/.zshrc ; then
    fblue "[?] dotfile sourcing not found"
    neg "[$] printf 'source ~/.aliases; source ~/.functions' >> ~/.zshrc"
    printf "\n%s\n" "$sourcing" >> ~/.zshrc
  else
    echo 
  fi
fi

fgreen "[!] done !" ; sleep 1
