syntax enable
set tabstop=3
set softtabstop=3
set shiftwidth=3
set expandtab
set list listchars=tab:»»,trail:·
set incsearch
set fillchars=fold:⋯
set number
set relativenumber
autocmd BufRead,BufNewFile *.elm setlocal filetype=haskell
autocmd BufRead,BufNewFile *.xtm setlocal filetype=scheme
call pathogen#infect()
