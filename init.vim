"" Setup for: WSL 2 - Ubuntu 20.04

function s:source_files(directory)
    for s:f in split(glob(a:directory .. '/*.vim'), '\n')
        execute 'source' s:f
    endfor
endfunction

let s:path = expand('<sfile>:p:h')
call <SID>source_files(s:path .. '/settings')
call <SID>source_files(s:path .. '/functions')
execute 'source' s:path .. '/plugins/plugins.vim'
