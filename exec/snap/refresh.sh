#!/bin/bash

# shellcheck source=/dev/null
source "$PWD"/config/ui.sh
source "$PWD"/config/config.sh
source "$PWD"/config/utils.sh

exec_a=(killall snap-store)
exec_b=(sudo snap refresh)

core__ui_start

core__ui_cmd "${exec_a[@]}"; "${exec_a[@]}"
exit_code=$?
core__log_cmd $exit_code "${exec_a[*]}"

core__ui_cmd "${exec_b[@]}"; "${exec_b[@]}"
exit_code=$?
core__log_cmd $exit_code "${exec_b[*]}"

core__ui_done