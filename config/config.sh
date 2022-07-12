#!/bin/bash

export GOELAND_apt_packages=(
  "apt-transport-https"
  "build-essential"
  "ca-certificates"
  "curl"
  "file"
  "gcc"
  "git"
  "htop"
  "make"
  "procps"
  "software-properties-common"
  "tree"
  "virtualbox"
  "xclip"
  "zsh"
)

export GOELAND_snap_packages=(
  "code --classic"
  "discord"
  "gimp"
  "kontena-lens --classic"
  "slack"
  "spotify"
  "telegram-desktop"
  "vlc"
)

export GOELAND_brew_formulaes=(
  "thefuck"
)

export GOELAND_brew_k8s_formulaes=(
  "kubectl"
  "kubectx"
  "kubeseal"
  "helm"
)

export GOELAND_dotfiles=(
  "aliases"
  "functions"
)

export GOELAND_omz_plugins=(
  "zsh-autosuggestions"
  "zsh-completions"
  "zsh-history-substring-search"
  "zsh-syntax-highlighting"
)

export GOELAND_vscode_extensions=(
  "ms-azuretools.vscode-docker"
  "dracula-theme.theme-dracula"
  "eamodio.gitlens"
  "golang.go"
  "HashiCorp.terraform"
  "ms-kubernetes-tools.vscode-kubernetes-tools"
  "ms-vsliveshare.vsliveshare"
  "ms-vscode.makefile-tools"
  "yzhang.markdown-all-in-one"
  "PKief.material-icon-theme"
  "ext install ahmadalli.vscode-nginx-conf"
  "christian-kohler.path-intellisense"
  "timonwong.shellcheck"
  "rangav.vscode-thunder-client"
  "WakaTime.vscode-wakatime"
  "redhat.vscode-yaml"
)