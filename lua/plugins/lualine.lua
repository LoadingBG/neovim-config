require("lualine").setup {
	options = {
		theme = "onedark"
	},
	sections = {
		lualine_c = { "filename", "filetype" },
		lualine_x = { "encoding", "fileformat" },
	}
}
