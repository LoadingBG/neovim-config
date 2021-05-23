map <C-d> :call <SID>SendToDesktop()<CR>
function! s:SendToDesktop()
    exec 'w'
    exec '!cpdt %:p'
endfunction
