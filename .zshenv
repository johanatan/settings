export CLICOLOR=1
export LSCOLORS=gxBxhxDxfxhxhxhxhxcxcx
export PKG_CONFIG_PATH=/opt/X11/lib/pkgconfig:$PKG_CONFIG_PATH
export EDITOR=vim
export BASH_SILENCE_DEPRECATION_WARNING=1
export RUSTC_WRAPPER=sccache

export PATH=/usr/local/scheme/bin:/usr/local/bin:/usr/local/sbin:$PATH
export PATH=/usr/local/mysql/bin:/opt/local/bin:/opt/local/sbin:/usr/local/mongodb/bin:$PATH
export PATH=$HOME/bin:$PATH
export PATH=$HOME/Library/Python/3.10/bin:$PATH
export PATH=$HOME/.cargo/bin:$PATH
export PATH=/usr/local/Cellar/emacs-mac/emacs-29.1-mac-10.0/bin/:$PATH

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH=$PATH:$HOME/.rvm/bin:$PATH
. "$HOME/.cargo/env"

# Claude Code local install (fallback if not globally installed)
export PATH="$PATH:$HOME/.local/bin"

