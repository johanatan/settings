alias ls='ls -laG'
alias lw='ls2 -G'
alias ..='cd ..'
alias ...='cd ..;cd ..'
alias masch='cd /Users/jonathan/Documents/SourceCode/extempore_maschine'
alias hibernateon="sudo pmset -a hibernatemode 25"
alias hibernateoff="sudo pmset -a hibernatemode 3"
alias src='cd /Users/jonathan/Documents/SourceCode'
alias ca='src;cd clinkle/clinkle-api'
alias ijulia="ipython notebook --profile=julia"
alias julia="/Applications/Julia-*.app/Contents/Resources/julia/bin/julia"
alias first="head -n 1"
alias last="tail -n 1"
alias ccat="pygmentize -O bg=dark"

export PATH=/usr/local/scheme/bin:/usr/local/bin:/usr/local/sbin:/usr/local/mysql/bin:/opt/local/bin:/opt/local/sbin:/usr/local/arcanist/bin:/usr/local/mongodb/bin:$PATH
export CLICOLOR=1
export PKG_CONFIG_PATH=/opt/X11/lib/pkgconfig:$PKG_CONFIG_PATH
export EDITOR=vim
export JAVA_HOME=/Library/Java/JavaVirtualMachines/jdk1.7.0_45.jdk/Contents/Home
export HISTCONTROL=ignorespace

[[ -s ~/.bashrc ]] && source ~/.bashrc
