syntax enable
set tabstop=3
set softtabstop=3
set shiftwidth=3
set expandtab
set list listchars=tab:»»,trail:·
set incsearch
set fillchars=fold:⋯
autocmd BufRead,BufNewFile *.elm setlocal filetype=haskell
