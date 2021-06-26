"" Custom status bar

Plug 'vim-airline/vim-airline'
Plug 'ntpeters/vim-airline-colornum'

let g:airline_powerline_fonts                    = 1
let g:airline_theme                              = 'one'
let g:airline#extensions#branch#enabled          = 1
let g:airline#extensions#tabline#enabled         = 1
let g:airline#extensions#tabline#buffer_nr_show  = 0
let g:airline#extensions#tabline#buffer_idx_mode = 1
let g:airline#extensions#tabline#current_first   = 0
let g:airline#extensions#tabline#show_splits     = 1
let g:airline#extensions#hunks#enabled           = 1
let g:airline#extensions#whitespace#enabled      = 0
nmap [b <Plug>AirlineSelectPrevTab
nmap ]b <Plug>AirlineSelectNextTab
