"" Configuration for coc-snippets - https://github.com/neoclide/coc-snippets

inoremap <silent><expr> <C-Space>
    \ pumvisible() ? coc#_select_confirm() :
    \ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump', ''])\<CR>" :
    \ coc#refresh()
let g:coc_snippet_next = '<C-j>'
let g:coc_snippet_prev = '<C-k>'
