#!/bin/bash

# shellcheck source=/dev/null
source "$PWD"/scripts/colors.sh
source "$PWD"/config/config.sh

fyellow "[-] starting..." ; sleep 1

sudo apt install "${__APT[*]}" -y

fgreen "[-] done !" ; sleep 1