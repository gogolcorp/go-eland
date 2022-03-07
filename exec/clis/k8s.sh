#!/bin/bash

# shellcheck source=/dev/null
source "$PWD"/config/ui.sh
source "$PWD"/config/cfg.sh
source "$PWD"/config/utils.sh

ui_start

_brew_secure_install_from_array_ "$_brew_k8s_packages_"

ui_done
