#!/bin/bash

export _apt_packages_=(
  "apt-transport-https"
  "build-essential"
  "ca-certificates"
  "software-properties-common"
)

export _brew_packages_=(
  "curl"
  "gcc"
  "git"
  "htop"
  "make"
  "tree"
  "xclip"
  "zsh"
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
  "zsh-syntax-highlighting"
  "zsh-autosuggestions"
)