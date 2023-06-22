# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

export ZSH="$HOME/.oh-my-zsh"

# theme
ZSH_THEME="robbyrussell"

# software update
zstyle ':omz:update' mode auto 
zstyle ':omz:update' frequency 7

# plugins
plugins=(
  zsh-syntax-highlighting
  zsh-history-substring-search
  zsh-completions
  zsh-autosuggestions
  git
)

#   - User Configuration - 

source $ZSH/oh-my-zsh.sh

# [package manager] brew
autoload -U compinit && compinit

if type brew &>/dev/null; then
  FPATH=$(brew --prefix)/share/zsh-completions:$(brew --prefix)/share/zsh/site-functions:$FPATH

  autoload -Uz compinit
  compinit
fi

eval $(/home/linuxbrew/.linuxbrew/bin/brew shellenv)

# [prompt] starship 
export STARSHIP_CONFIG=~/.config/starship.toml
eval "$(starship init zsh)"

# [language] golang 
export PATH=$PATH:/usr/local/go/bin
export PATH=$HOME/go/bin:$PATH

# [software] thefuck 
eval $(thefuck --alias)

#   - Kubernetes -

# [software] kubectl 
source <(kubectl completion zsh)

# [kubectl-plugin] krew 
export PATH="${KREW_ROOT:-$HOME/.krew}/bin:$PATH"

# [software] kubectl 
eval $(thefuck --alias)

# [package manager] nvm
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" 
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"


# [installer] go-eland
source /home/alexandredelaloy/.aliases; source /home/alexandredelaloy/.functions
