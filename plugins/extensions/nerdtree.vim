"" File explorer

Plug 'preservim/nerdtree'

augroup nerdtree
    autocmd!
    autocmd VimEnter * NERDTree | wincmd p
    autocmd BufEnter * nested if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif
    autocmd BufWinEnter * silent NERDTreeMirror
augroup END
