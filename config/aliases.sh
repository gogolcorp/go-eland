#!/bin/bash

# shellcheck source=/dev/null
source ~/.functions

# MISC
alias c="clear"
alias cdc="cd ; clear"
alias del="rm -rf"
alias e="exit"
alias rf="source ~/.zshrc"
alias sn="snap"
alias t="touch"

# FUNCTIONS BIND
alias igni="_ignition"
alias mkd="_mkd"
alias o="_open"
alias vs="_code"

# NAVIGATION
alias ...= "cd ../.."
alias ....= "cd ../../.."
alias .....= "cd ../../../.."
alias ......= "cd ../../../../.."

# DIRECTORIES
alias docs="cd ~/Documents"
alias dll="cd ~/Downloads"
alias desk="cd ~/Desktop"

# APT
alias upd="sudo apt update -y"
alias upg="sudo apt upgrade -y"
alias updg="sudo apt update -y ; sudo apt upgrade -y"

# KUBECTL
alias k="kubectl"
alias wkg="watch kubectl get"

alias kd="kubectl delete"
alias ke="kubectl edit"
alias kg="kubectl get"
alias kl="kubectl logs"

