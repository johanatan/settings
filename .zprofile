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
alias cat='bat'
alias canary='/Applications/Google\ Chrome\ Canary.app/Contents/MacOS/Google\ Chrome\ Canary --user-data-dir="$HOME/Library/Application Support/Google/Chrome"'
alias chrome='/Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome --disable-web-security --user-data-dir="$HOME/Library/Application Support/Google/Chrome-Canary"'
alias gbd='git branch | grep -v master | grep -v \* | xargs git branch -D'
alias figpid="ps aux | grep java | grep figwheel.main |  tr -s ' ' | cut -d ' ' -f 2 | head -n 1"
alias killfig="sudo kill -9 $(figpid)"

PATH=/usr/local/scheme/bin:/usr/local/bin:/usr/local/sbin:$PATH
PATH=/usr/local/mysql/bin:/opt/local/bin:/opt/local/sbin:/usr/local/mongodb/bin:$PATH
PATH=$HOME/bin:$PATH
PATH=$HOME/activator:$PATH
PATH=$HOME/Library/Python/2.7/bin:$PATH
PATH=$HOME/Library/Python/3.10/bin:$PATH
PATH=$HOME/.cargo/bin:$PATH

export CLICOLOR=1
export LSCOLORS=gxBxhxDxfxhxhxhxhxcxcx
export PKG_CONFIG_PATH=/opt/X11/lib/pkgconfig:$PKG_CONFIG_PATH
export EDITOR=vim
export BASH_SILENCE_DEPRECATION_WARNING=1

HISTFILE=~/.zsh_history
setopt hist_ignore_space
HISTSIZE=999999999
SAVEHIST=$HISTSIZE

if [ -f "/usr/local/opt/bash-git-prompt/share/gitprompt.sh" ]; then
  __GIT_PROMPT_DIR="/usr/local/opt/bash-git-prompt/share"
  source "/usr/local/opt/bash-git-prompt/share/gitprompt.sh"
fi

export NVM_DIR="$HOME/.nvm"
[ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"  # This loads nvm
[ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH=$PATH:$HOME/.rvm/bin

# Source chtf
if [[ -f /usr/local/share/chtf/chtf.sh ]]; then
    source "/usr/local/share/chtf/chtf.sh"
fi

eval "$(/opt/homebrew/bin/brew shellenv)"
