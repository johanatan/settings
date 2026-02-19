alias ls='ls -laG'
alias ..='cd ..'
alias ...='cd ..;cd ..'
alias first="head -n 1"
alias last="tail -n 1"
alias cat='bat'
alias gbd='git branch | grep -v master | grep -v \* | xargs git branch -D'
alias tma='tmux attach -t'

HISTFILE=~/.zsh_history
setopt hist_ignore_space
HISTSIZE=999999999
SAVEHIST=$HISTSIZE

eval "$(/opt/homebrew/bin/brew shellenv)"
