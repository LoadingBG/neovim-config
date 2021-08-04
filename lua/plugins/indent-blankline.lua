local utils = require "utils"

require("indent_blankline").setup {
	char = "│",
	buftype_exclude = { "terminal" },
	char_highlight_list = { "One", "Two", "Three", "Four", "Five", "Six", "Seven" },
	show_trailing_blankline_indent = false,
	show_current_context = true
}

utils.exec "highlight One   guifg=#BF616A guibg=NONE gui=nocombine"
utils.exec "highlight Two   guifg=#D08770 guibg=NONE gui=nocombine"
utils.exec "highlight Three guifg=#EBCB8B guibg=NONE gui=nocombine"
utils.exec "highlight Four  guifg=#A3BE8C guibg=NONE gui=nocombine"
utils.exec "highlight Five  guifg=#5E81AC guibg=NONE gui=nocombine"
utils.exec "highlight Six   guifg=#88C0D0 guibg=NONE gui=nocombine"
utils.exec "highlight Seven guifg=#B48EAD guibg=NONE gui=nocombine"
utils.augroup("indent_blankline", {
	utils.genautocmd("CursorMoved", { "*" }, "IndentBlanklineRefresh")
})
