#!/bin/bash

# shellcheck source=/dev/null
source "$PWD"/scripts/colors.sh

fyellow "[-] starting..." ; sleep 1

sudo apt update -y
sudo apt upgrade -y

fgreen "[-] done !" ; sleep 1