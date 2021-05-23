"" Clipboard settings

" Set win32yank.exe as clipboard tool
let g:clipboard = {
    \'name': 'win32yank',
    \'copy': {
        \'+': 'win32yank.exe -i',
	\'*': 'win32yank.exe -i'
    \},
    \'paste': {
        \'+': 'win32yank.exe -o',
	\'*': 'win32yank.exe -o'
    \},
    \'cache_enabled': 0
\}
set clipboard=unnamedplus " Use "+ register for clipboard
