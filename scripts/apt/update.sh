#!/bin/bash

# shellcheck source=/dev/null
source "$PWD"/scripts/colors.sh

fyellow "[-] starting..." ; sleep 1

neg "[$] sudo apt update -y"
sudo apt update -y
neg "[$] sudo apt upgrade -y"
sudo apt upgrade -y

fgreen "[!] done !" ; sleep 1