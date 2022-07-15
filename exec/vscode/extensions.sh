#!/bin/bash

# shellcheck source=/dev/null
source "$PWD"/config/ui.sh
source "$PWD"/config/config.sh
source "$PWD"/config/utils.sh

ui_start

GLD_vscode_extensions_install "${GLD_vscode_extensions[@]}"

ui_done