export CLICOLOR=1
export LSCOLORS=gxBxhxDxfxhxhxhxhxcxcx
export EDITOR=vim
export RUSTC_WRAPPER=sccache

export PATH=$HOME/bin:$PATH
export PATH=$HOME/.cargo/bin:$PATH
. "$HOME/.cargo/env"

# Claude Code local install (fallback if not globally installed)
export PATH="$PATH:$HOME/.local/bin"

export NVM_DIR="$HOME/.nvm"
  [ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"
  [ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"
