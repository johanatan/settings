alias ls='ls -laG'
alias lw='ls2 -G'
alias ..='cd ..'
alias ...='cd ..;cd ..'
alias masch='cd /Users/jonathan/Documents/SourceCode/extempore_maschine'
alias hibernateon="sudo pmset -a hibernatemode 25"
alias hibernateoff="sudo pmset -a hibernatemode 3"
export PATH=/usr/local/scheme/bin:/usr/local/bin:/usr/local/sbin:/usr/local/mysql/bin:/opt/local/bin:/opt/local/sbin:$PATH
export PATH=/usr/local/pgsql/bin:$PATH
export PATH=/Users/jonathan/Library/Haskell/bin:$PATH
export PATH=~/.cabal/bin:$PATH
[[ -s "/Users/jonathan/.rvm/scripts/rvm" ]] && source "/Users/jonathan/.rvm/scripts/rvm"  # This loads RVM into a shell session.
export CLICOLOR=1
export PKG_CONFIG_PATH=/opt/X11/lib/pkgconfig:$PKG_CONFIG_PATH

[[ -s ~/.bashrc ]] && source ~/.bashrc
