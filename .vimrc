syntax enable
set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab
set list listchars=tab:»»,trail:·
set incsearch
set fillchars=fold:⋯
set number
set relativenumber
autocmd BufRead,BufNewFile *.elm setlocal filetype=haskell
autocmd BufRead,BufNewFile *.xtm setlocal filetype=scheme
call pathogen#infect()
