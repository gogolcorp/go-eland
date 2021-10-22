#!/bin/bash

# shellcheck source=/dev/null
source ~/.functions

# MISC -------------------------------------------------------------------
alias c="clear"
alias cdc="cd ; clear"
alias del="rm -rf"
alias e="exit"
alias rf="source ~/.zshrc"
alias sn="snap"
alias t="touch"

# FUNCTIONS BIND ---------------------------------------------------------
alias igni="_ignition"
alias mkd="_mkd"
alias o="_open"
alias vs="_code"

# NAVIGATION -------------------------------------------------------------
alias ...= "cd ../.."
alias ....= "cd ../../.."
alias .....= "cd ../../../.."
alias ......= "cd ../../../../.."

# DIRECTORIES ------------------------------------------------------------
alias docs="cd ~/Documents"
alias dll="cd ~/Downloads"
alias desk="cd ~/Desktop"

# APT --------------------------------------------------------------------
alias upd="sudo apt update -y"
alias upg="sudo apt upgrade -y"
alias updg="sudo apt update -y ; sudo apt upgrade -y"

# GIT --------------------------------------------------------------------
alias gmc="git commit -m"
alias ghst="git log --graph --oneline --decorate --all"
alias grh="git reset --hard" 
alias gsst="git status -s -b"

# KUBECTL ----------------------------------------------------------------
alias k="kubectl"
alias wkg="watch kubectl get"

alias kd="kubectl delete"
alias ke="kubectl edit"
alias kg="kubectl get"
alias kl="kubectl logs"

# TERRAFORM --------------------------------------------------------------
alias tf="terraform"

alias tfa="terraform apply"
alias tfd="terraform destroy"
alias tfi="terraform init"
alias tfp="terraform plan"

# NPM --------------------------------------------------------------------
alias n="npm"

alias ni="npm i"
alias nid="npm i --save-dev"
alias nig="npm i -g"
alias nu="npm uninstall"
alias nug="npm uninstall -g"

alias nb="npm run build"
alias nd="npm run dev"
alias nl="npm run lint"
alias nlf="npm run lint:fix"
alias nst="npm run start"
alias nsr="npm run serve"
alias nt="npm run test"
alias nw="npm run watch"

# YARN -------------------------------------------------------------------
alias y="yarn"

alias ya="yarn add"
alias yad="yarn add --dev"
alias yga="yarn global add"
alias yr="yarn remove"
alias ygr="yarn global remove"

alias yb="yarn build"
alias yd="yarn dev"
alias yl="yarn lint"
alias ylf="yarn lint:fix"
alias yst="yarn start"
alias ysr="yarn serve"
alias yt="yarn test"
alias yw="yarn watch"
