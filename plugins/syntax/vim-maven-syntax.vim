"" Advanced pom.xml highlighting

Plug 'NLKNguyen/vim-maven-syntax'

augroup maven
    autocmd!
    autocmd VimEnter,BufNewFile pom.xml set filetype=xml syntax=xml.maven
augroup END
