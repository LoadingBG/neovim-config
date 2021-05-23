"" Vim indentation plugin

Plug 'nathanaelkane/vim-indent-guides'

if &filetype != 'nerdtree' && &filetype != 'term'
    let g:indent_guides_enable_on_vim_startup = 1
endif
let g:indent_guides_guide_size = 1
