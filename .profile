alias ls='ls -laG'
alias lw='ls2 -G'
alias ..='cd ..'
alias ...='cd ..;cd ..'
alias masch='cd /Users/jonathan/Documents/SourceCode/extempore_maschine'
alias hibernateon="sudo pmset -a hibernatemode 25"
alias hibernateoff="sudo pmset -a hibernatemode 3"

export PATH=/usr/local/scheme/bin:/usr/local/bin:/usr/local/sbin:/usr/local/mysql/bin:/opt/local/bin:/opt/local/sbin:$PATH
export CLICOLOR=1
export PKG_CONFIG_PATH=/opt/X11/lib/pkgconfig:$PKG_CONFIG_PATH

[[ -s ~/.bashrc ]] && source ~/.bashrc
