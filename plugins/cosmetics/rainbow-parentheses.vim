"" Rainbow parentheses

Plug 'junegunn/rainbow_parentheses.vim'

let g:rainbow#pairs = [['(', ')'], ['[', ']'], ['{', '}']]
let g:rainbow#max_level = 100
let g:rainbow#blacklist = []

augroup rainbow_parens
    autocmd!
    autocmd FileType java            let g:rainbow#pairs = [['{', '}']] | :RainbowParentheses
    autocmd FileType clojure,lisp,hy RainbowParentheses
augroup END
