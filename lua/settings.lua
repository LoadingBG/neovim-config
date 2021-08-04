local utils = require "utils"

----- Editor settings
vim.o.filetype    = "off"                  -- Fire FileType autocommands
vim.o.mouse       = "a"                    -- Enable mouse
vim.o.updatetime  = 750                    -- Set the update time to 750 ms
vim.o.scrolloff   = 5                      -- Leave 5 lines above/below cursor when scrolling
vim.o.inccommand  = "nosplit"              -- Show live preview of commands
vim.o.completeopt = "menuone,noselect"     -- Required by nvim-compe
vim.o.shortmess   = vim.o.shortmess .. "c" -- Disable "Pattern Not Found" message
vim.o.clipboard   = "unnamedplus"          -- Set "+ as default copy location
vim.o.undofile    = true                   -- Save undo files

----- UI settings
vim.o.number         = true                -- Enable line numbers
vim.o.relativenumber = true                -- Enable relative numbers
vim.o.title          = true                -- Set the title of the window
vim.o.termguicolors  = true                -- Enable RGB colors
utils.exec "colorscheme one"               -- Set color scheme

--- Text settings
vim.o.fileencoding = "utf-8"               -- Set the file encoding to UTF-8
vim.o.linebreak    = true                  -- Break lines at breakable characters
vim.o.list         = true                  -- Enable trailing characters
vim.o.showbreak    = "↪"                   -- Set character to show when line is wrapped
vim.o.listchars    = table.concat({        -- Set values for trailing characters
	"space:·",
	"tab:│·",
	"lead:•",
	"trail:•",
	"extends:❯",
	"precedes:❮",
	"eol:↲",
	"nbsp:_"
}, ",")

--- Indentation settings
vim.o.smartindent = true                   -- Enable smart indentation
vim.o.tabstop     = 4                      -- Set tabulation size to 4
vim.o.shiftwidth  = 4                      -- Number of spaces for indentation
utils.augroup("indent_settings", {         -- Configuration for specific filetypes
	utils.genautocmd("FileType", { "xml", "ruby", "lua" }, "set shiftwidth=2 tabstop=2"),
	utils.genautocmd("FileType", { "json" }, "set shiftwidth=2 tabstop=2 expandtab"),
	utils.genautocmd("FileType", { "rust" }, "set noexpandtab")
})
