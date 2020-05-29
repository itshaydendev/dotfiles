export ZSH="$XDG_DATA_HOME/oh-my-zsh"

ZSH_THEME="zeit"

plugins=(
  git
  docker
  docker-compose
  node
  npm
  sudo
  systemd
  vscode
  web-search
  yarn
)

source $ZSH/oh-my-zsh.sh
[[ -s "$XDG_CONFIG_HOME/profile" ]] && source "$XDG_CONFIG_HOME/profile"
[[ -s "$XDG_DATA_HOME/asdf/asdf.sh" ]] && . $XDG_DATA_HOME/asdf/asdf.sh
[[ -s "$XDG_DATA_HOME/asdf/asdf.sh" ]] && fpath=(${ASDF_DIR}/completions $fpath)
autoload -Uz compinit && compinit
