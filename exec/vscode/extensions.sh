#!/bin/bash

# shellcheck source=/dev/null
source "$PWD"/config/ui.sh
source "$PWD"/config/cfg.sh
source "$PWD"/config/utils.sh

ui_start

_vscode_secure_install_from_array_ "${_vscode_extensions_[@]}"

ui_done