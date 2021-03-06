require("nvim-treesitter.configs").setup {
	ensure_installed = {
		"c",
		"cpp",
		"python",
		"rust",
		"lua",
		"yaml",
		"bash",
		"fish",
		"tsx",
		"javascript",
		"json",
		"haskell",
		"typescript",
		"toml",
		"html",
		"css"
	},
	highlight = { enable = true },
	autopairs = { enable = true },
	indent    = { enable = true },
	autotag   = { enable = true },
	highlight = {
		disable = { "java" }
	}
}
