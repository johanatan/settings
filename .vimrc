syntax enable
filetype plugin indent on
set so=5
set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab
set list listchars=tab:»»,trail:·
set incsearch
set hlsearch
:let mapleader = "\\"
nnoremap <leader><space> :nohlsearch<CR>
set fillchars=fold:⋯
set number
set relativenumber
set cursorline
set wildmenu
nnoremap <leader>u :GundoToggle<CR>
autocmd BufRead,BufNewFile *.elm setlocal filetype=haskell
autocmd BufRead,BufNewFile *.xtm setlocal filetype=scheme
call pathogen#infect()
