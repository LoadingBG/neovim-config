" Commands:
" haxe:       npm install haxe-repl
" dart:       (none)
" java:       (installed)
" kotlin:     (installed)
" scala:      (installed)
" groovy:     (insatlled)
" clojure:    sudo apt install leiningen
" lisp:       (installed)
" hy:         (installed)
" python:     (preinstalled)
" r:          (installed)
" julia:      (installed)
" nim:        (installed)
" c:          (none)
" cpp:        wget https://root.cern.ch/download/cling//cling_2020-11-05_ROOT-ubuntu2004.tar.bz2
"             tar -xf cling_2020-11-05_ROOT-ubuntu2004.tar.bz2
"             export PATH=$PATH:(/path/to/cling_2020-11-05_ROOT-ubuntu2004)/bin
" cs:         (installed)
" d:          sudo apt-get update -y
"             sudo apt-get install -y dub
" rust:       rustup toolchain add nightly
"             cargo +nightly install papyrus
" go:         go install -i https://github.com/sbinet/igo
"             sudo mv (/path/to/$GOROOT)/bin/igo /usr/bin
" fortran:    gem install frepl (requires Ruby)
" pascal:     (none)
" haskell:    (installed)
" ocaml:      (installed)
" lua:        (insatlled)
" dosbatch:   (installed for WSL)
" powershell: (installed for WSL)
" sh:         (preinstalled)
" perl:       (preinstalled)
" lua:        (installed)
" php:        (installed)
" javascript: (installed)
" typescript: (installed)
" coffee:     (installed)
" ruby:       (installed)
" crystal:    git clone https://github.com/crystal-community/icr.git
"             cd icr
"             make (requires Make)
"             sudo make install (requires Make)
" elixir:     (installed)
" erlang:     (installed)
" st:         (preinstalled)
" nasm:       sudo apt install libedit-dev
"             git clone https://github.com/yrp604/rappel.git
"             cd rappel
"             CC=clang make (requires Clang)
"             sudo mv bin/rappel /usr/bin
" apl:        (installed)
" html:       (none)

let s:code_repl_nrs = {}
let s:last_leaved_buffer_nr = -1
augroup repl
    autocmd!
    autocmd BufLeave,BufDelete * let s:last_leaved_buffer_nr = bufnr('%')
    autocmd BufUnload * call <SID>StopREPL(s:last_leaved_buffer_nr)
    autocmd BufWinEnter * call s:StartREPL()
augroup END
function! s:StartREPL()
    let l:command_map = {
        \'haxe'      : 'npx haxe-repl',
        \'dart'      : '',
        \'java'      : 'jshell',
        \'kotlin'    : 'kotlin',
        \'scala'     : 'scala',
        \'groovy'    : 'groovysh',
        \'clojure'   : 'lein repl',
        \'lisp'      : 'clisp',
        \'hy'        : 'hy',
        \'python'    : 'python3',
        \'r'         : 'R',
        \'julia'     : 'julia',
        \'nim'       : 'nim secret',
        \'c'         : '',
        \'cpp'       : 'cling',
        \'cs'        : 'charp',
        \'d'         : 'dub run drepl',
        \'rust'      : 'papyrus',
        \'go'        : 'igo',
        \'fortran'   : 'frepl',
        \'pascal'    : '',
        \'haskell'   : 'ghci',
        \'ocaml'     : 'ocaml',
        \'lua'       : 'lua',
        \'dosbatch'  : 'cmd.exe',
        \'powershell': 'powershell.exe',
        \'sh'        : 'bash',
        \'perl'      : 'perl -de1',
        \'php'       : 'php -a',
        \'javascript': 'node',
        \'typescript': 'ts-node',
        \'coffee'    : 'npx coffee',
        \'ruby'      : 'irb',
        \'crystal'   : 'icr',
        \'elixir'    : 'iex',
        \'erlang'    : 'erl',
        \'st'        : 'gst',
        \'nasm'      : 'rappel',
        \'apl'       : 'apl --noColor',
        \'html'      : ''
    \}
    let l:command = get(l:command_map, &filetype, '')
    if l:command != ''
        let l:code_nr = bufnr('%')
        exec 'belowright ' . (&lines / 4) . ' new'
        let s:code_repl_nrs[l:code_nr] = bufnr('%')
        exec 'term ' . l:command
        exec 'wincmd p'
    endif
endfunction

function! s:StopREPL(buffer_nr)
    let l:repl_nr = get(s:code_repl_nrs, a:buffer_nr . '', -1)
    if l:repl_nr != -1
        exec l:repl_nr . 'bdelete!'
    endif
endfunction
