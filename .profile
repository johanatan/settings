alias ls='ls -laG'
alias lw='ls2 -G'
alias ..='cd ..'
alias ...='cd ..;cd ..'
alias mysql='/usr/local/mysql/bin/mysql -u root -p'
alias mysqladmin='/usr/local/mysql/bin/mysqladmin'
alias masch='cd /Users/jonathan/Documents/SourceCode/extempore_maschine'
alias sc='cd /Users/jonathan/Documents/SourceCode'
alias psql='sudo -u postgres psql'
alias hibernateon="sudo pmset -a hibernatemode 25"
alias hibernateoff="sudo pmset -a hibernatemode 3"
export PATH=/usr/local/scheme/bin:/usr/local/bin:/usr/local/sbin:/usr/local/mysql/bin:/opt/local/bin:/opt/local/sbin:$PATH
export PATH=/usr/local/pgsql/bin:$PATH
export PATH=/Users/jonathan/Library/Haskell/bin:$PATH
export PATH=~/.cabal/bin:$PATH
[[ -s "/Users/jonathan/.rvm/scripts/rvm" ]] && source "/Users/jonathan/.rvm/scripts/rvm"  # This loads RVM into a shell session.
export CLICOLOR=1
