#!/bin/bash

export _apt_packages_=(
  "apt-transport-https"
  "build-essential"
  "ca-certificates"
  "curl"
  "git"
  "software-properties-common"
  "zsh"
)

export _brew_packages_=(
  "gcc"
  "htop"
  "make"
  "tree"
  "xclip"
)

export _brew_k8s_packages_=(
  "kubectl"
  "kubectx"
  "kubeseal"
  "helm"
)

export _dotfiles_=(
  "aliases"
  "functions"
)

export _omz_plugins_=(
  "zsh-autosuggestions"
  "zsh-completions"
  "zsh-history-substring-search"
  "zsh-syntax-highlighting"
)