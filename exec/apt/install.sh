#!/bin/bash

# shellcheck source=/dev/null
source "$PWD"/config/ui.sh
source "$PWD"/config/config.sh
source "$PWD"/config/utils.sh

core__ui_start

core__install__apt_packages "${core__apt_packages[@]}"

core__ui_done