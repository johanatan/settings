alias ls='ls -laG'
alias lw='ls2 -G'
alias ..='cd ..'
alias ...='cd ..;cd ..'
alias masch="cd /Users/$(whoami)/Documents/SourceCode/extempore_maschine"
alias hibernateon="sudo pmset -a hibernatemode 25"
alias hibernateoff="sudo pmset -a hibernatemode 3"
alias src="cd /Users/$(whoami)/Documents/SourceCode"
alias ijulia="ipython notebook --profile=julia"
alias julia="/Applications/Julia-*.app/Contents/Resources/julia/bin/julia"
alias first="head -n 1"
alias last="tail -n 1"
alias ccat="pygmentize -O bg=dark"
alias gphm="git push heroku master"
alias gpfhm="git push -f heroku master"

PATH=/usr/local/scheme/bin:/usr/local/bin:/usr/local/sbin:$PATH
PATH=/usr/local/mysql/bin:/opt/local/bin:/opt/local/sbin:/usr/local/mongodb/bin:$PATH
PATH=$HOME/bin:$PATH
PATH=$HOME/activator:$PATH
PATH=$HOME/Library/Python/2.7/bin:$PATH

export CLICOLOR=1
export LSCOLORS=gxBxhxDxfxhxhxhxhxcxcx
export PKG_CONFIG_PATH=/opt/X11/lib/pkgconfig:$PKG_CONFIG_PATH
export EDITOR=vim

export HISTCONTROL=ignorespace
export HISTSIZE=""
export HISTFILESIZE=""
shopt -s histappend

[[ -s ~/.bashrc ]] && source ~/.bashrc

[ -f /usr/local/etc/bash_completion ] && . /usr/local/etc/bash_completion
[ -f /Library/Developer/CommandLineTools/usr/share/git-core/git-completion.bash ] && \
  . /Library/Developer/CommandLineTools/usr/share/git-core/git-completion.bash

if [ -f "/usr/local/opt/bash-git-prompt/share/gitprompt.sh" ]; then
  __GIT_PROMPT_DIR="/usr/local/opt/bash-git-prompt/share"
  source "/usr/local/opt/bash-git-prompt/share/gitprompt.sh"
fi

export NVM_DIR="$HOME/.nvm"
. "/usr/local/opt/nvm/nvm.sh"

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH=$PATH:$HOME/.rvm/bin
