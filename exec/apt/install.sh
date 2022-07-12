#!/bin/bash

# shellcheck source=/dev/null
source "$PWD"/config/ui.sh
source "$PWD"/config/config.sh
source "$PWD"/config/utils.sh

ui_start

GOELAND_apt_packages_install "${GOELAND_apt_packages[@]}"

ui_done