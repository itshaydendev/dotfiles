if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

export ZSH="$XDG_DATA_HOME/oh-my-zsh"

ZSH_THEME="powerlevel10k/powerlevel10k"

plugins=(
  asdf
  archlinux
  composer
  docker
  docker-compose
  extract
  fzf
  git
  gnu-utils
  gpg-agent
  laravel
  last-working-dir
  node
  npm
  npx
  sudo
  systemd
  zsh-syntax-highlighting
  zsh-z
)

source $ZSH/oh-my-zsh.sh

[[ -s "$XDG_DATA_HOME/asdf" ]] && . $XDG_DATA_HOME/asdf/asdf.sh
fpath=(${ASDF_DIR}/completions $fpath)
autoload -Uz compinit && compinit

source $XDG_CONFIG_HOME/profile

[[ ! -f ~/.config/zsh/.p10k.zsh ]] || source ~/.config/zsh/.p10k.zsh
