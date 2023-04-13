#!/bin/bash

# shellcheck source=/dev/null
source "$PWD"/config/ui.sh
source "$PWD"/config/config.sh
source "$PWD"/config/utils.sh

ui_start

eval $(/home/linuxbrew/.linuxbrew/bin/brew shellenv)

core__brew_formulaes_install "${core__brew_formulaes[@]}"

ui_done
