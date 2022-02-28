#!/bin/bash

# shellcheck source=/dev/null
source "$PWD"/config/ui.sh
source "$PWD"/config/cfg.sh

if [ "$(echo "$SHELL" | grep "zsh")" != 0 ]; then
  zsh
fi