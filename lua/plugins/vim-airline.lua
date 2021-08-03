local utils = require "utils"

vim.g.airline_powerline_fonts                       = 1     -- Allow powerline symbols
vim.g["airline#extensions#branch#enabled"]          = 1     -- Enable branch
vim.g["airline#extensions#tabline#enabled"]         = 1     -- Enable tabline
vim.g["airline#extensions#tabline#buffer_nr_show"]  = 0     -- Don't show buffer number
vim.g["airline#extensions#tabline#buffer_idx_mode"] = 1     -- Show buffer index
vim.g["airline#extensions#tabline#current_first"]   = 0     -- Don't place the current buffer first in the list
vim.g["airline#extensions#tabline#show_splits"]     = 1     -- Show splits
vim.g["airline#extensions#hunks#enabled"]           = 1     -- Enable hunks
vim.g["airline#extensions#whitespace#enabled"]      = 0     -- Disable whitespace warnings

utils.nmap("[b", "<Plug>AirlineSelectPrevTab", {})
utils.nmap("]b", "<Plug>AirlineSelectNextTab", {})
