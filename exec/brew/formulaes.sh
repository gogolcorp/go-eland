#!/bin/bash

# shellcheck source=/dev/null
source "$PWD"/config/ui.sh
source "$PWD"/config/config.sh
source "$PWD"/config/utils.sh

ui_start

eval $(/home/linuxbrew/.linuxbrew/bin/brew shellenv)

GLD_brew_formulaes_install "${GLD_brew_formulaes[@]}"

ui_done
