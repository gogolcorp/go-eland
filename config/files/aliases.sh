#!/bin/bash

# IMPORTS ----------------------------------------------------------------

# shellcheck source=/dev/null
source "$HOME/.functions"

# SINGLE COMMAND ---------------------------------------------------------
alias b="brew"
alias c="clear"
alias del="rm -rf"
alias e="exit"
alias m="make"
alias s="snap"
alias t="touch"
alias x="killall" 

alias cb="xclip -sel clip"
alias cdc="cd ; clear"
alias cpwd="pwd | xclip -sel clip"
alias lgh="sudo brightnessctl --device='tpacpi::kbd_backlight' set 2"
alias rf='source $HOME/.zshrc'
alias upkg='sudo dpkg -i'

# FUNCTIONS BIND ---------------------------------------------------------
alias be="___base64_encode___"
alias bd="___base64_decode___"
alias dkpg="___docker_purge___"
alias gld="___goeland___"
alias gcfg="___git_config___"
alias fih="___find_in_history___"
alias fie="___find_in_env___"
alias mkd="___mkdir_cd___"
alias o="___open_fe___"
alias ssops="___super_sops___"
alias vs="___open_vscode___"

# DIRECTORIES ------------------------------------------------------------
alias alt='clear; cd $HOME/go/src/gitlab.corporate.delair-stack.com/infra'
alias docs='clear; cd $HOME/Documents'
alias dll='clear; cd $HOME/Downloads'

# APT --------------------------------------------------------------------
alias upd="sudo apt update -y"
alias upg="sudo apt upgrade -y"
alias updg="sudo apt update -y ; sudo apt upgrade -y"

# GIT --------------------------------------------------------------------
alias gmc="git commit -m"
alias ghst="git log --graph --oneline --decorate --all"
alias grh="git reset --hard" 
alias gsst="git status -s -b"
alias gsync="___git_sync___"

# KUBE -------------------------------------------------------------------
alias k="kubectl"

# kubectl plugins
alias kcx="kubectl ctx"
alias acx="___alteia_ctx___"
alias kfz="kubectl fuzzy"
alias kkr="kubectl krew"
alias kns="kubectl ns"
alias kst="kubectl stern"
alias kvs="kubectl view-secret"
alias kpf="kubectl port-forward"

alias wkg="watch kubectl get"
alias kg="kubectl get"
alias kd="kubectl fuzzy describe"
alias kl="kubectl fuzzy logs"
alias kk="kubectl delete"
alias ke="kubectl edit"

# HELM -------------------------------------------------------------------
alias h="helm"

alias hu="helm upgrade --install -f values.yaml -n"

alias hdpb="helm dependency build"
alias hdpl="helm dependency list"
alias hdpu="helm dependency update"

alias hd="helm diff"
alias hdu="helm diff upgrade --install -f values.yaml -n"

alias ht="helm template"
alias htu="helm template -f values.yaml --output-dir tmp -n"

# TERRAFORM --------------------------------------------------------------
alias tf="terraform"

alias tfa="terraform apply"
alias tfd="terraform destroy"
alias tfi="terraform init"
alias tfp="terraform plan"

# DOCKER -----------------------------------------------------------------
alias dk="docker"

alias dkb="docker build -t"
alias dki="docker images -a"
alias dkps="docker ps -a"
alias dkr="docker run --rm"

# DOCKER COMPOSE ---------------------------------------------------------
alias dkc="docker compose"

alias dkcu="docker compose up"
alias dkcub="docker compose up --build"
alias dkcuf="docker compose up --build --remove-orphans --force-recreate"

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
