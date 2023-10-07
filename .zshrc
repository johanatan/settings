[ -f ~/.cargo/env ] && source ~/.cargo/env

if type brew &>/dev/null; then
  FPATH=$(brew --prefix)/share/zsh-completions:$FPATH

  autoload -Uz compinit
  compinit
fi

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

source /usr/local/share/antigen/antigen.zsh
antigen bundle zsh-users/zsh-completions
antigen apply

bindkey -e
