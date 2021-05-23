""" Plugins initialization

"" Get all plugin files
let s:all_dirs     = filter(split(glob('~/.config/nvim/plugins/*'), '\n'), 'isdirectory(v:val)')   " Get all files in current directory
let s:plugin_files = map(s:all_dirs, 'split(globpath(v:val, "*.vim"), "\n")') " Get all plugin files

"" Initialize plugins
call plug#begin('~/.vim/bundle') " Initialize Vim-plug
" Source every file
for s:files in s:plugin_files
    for s:file in s:files
        execute 'source' s:file
    endfor
endfor
call plug#end()                  " End Vim-plug
