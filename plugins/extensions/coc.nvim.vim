"" Conquer of completion

Plug 'neoclide/coc.nvim', { 'branch': 'release' }

let g:coc_global_extensions = [
    \ 'coc-marketplace', 'coc-pairs', 'coc-snippets',
    \ 'coc-clangd', 'coc-java', 'coc-json', 'coc-vimlsp', 'coc-xml'
\]
"runtime! ~/.config/nvim/plugins/extensions/coc/*
source ~/.config/nvim/plugins/extensions/coc/coc-snippets.vim
