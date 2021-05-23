"" Editor settings
syntax on
filetype off
filetype plugin indent on
set autoread
set backspace=indent,eol,start
set mouse=a
set updatetime=300
set hlsearch
set shortmess+=c
set regexpengine=0
augroup shiftwidth_settings
    autocmd!
    autocmd FileType xml,ruby set shiftwidth=2 tabstop=2
augroup END
let g:asmsyntax = 'nasm'
let g:python_host_prog = '/usr/bin/python2'
let g:python3_host_prog = '/usr/bin/python3'
