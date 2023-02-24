#!/bin/bash

export core__dotfiles_src=(
  ".gitconfig"
  "aliases.sh"
  "functions.sh"
  "starship.toml"
  "terminator.toml"
  # ".zshrc"
  # "vscode-settings.json"
)
export core__dotfiles_dist=(
  ".gitconfig"
  ".aliases"
  ".functions"
  ".config/starship.toml"
  ".config/terminator/config"
  # ".zshrc"
  # ".config/Code/User/settings.json"
)

export core__apt_packages=(
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
  "shellcheck"
  "software-properties-common"
  "tree"
  "virtualbox"
  "xclip"
  "zsh"
)

export core__snap_packages=(
  "code --classic"
  "discord"
  "gimp"
  "kontena-lens --classic"
  "slack"
  "spotify"
  "telegram-desktop"
  "vlc"
)

export core__brew_formulaes=(
  "thefuck"
)

export core__brew_k8s_formulaes=(
  "kubectl"
  "kubectx"
  "kubeseal"
  "helm"
)

export core__omz_plugins=(
  "zsh-autosuggestions"
  "zsh-completions"
  "zsh-history-substring-search"
  "zsh-syntax-highlighting"
)

export core__vscode_extensions=(
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