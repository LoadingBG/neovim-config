local utils = require "utils"

utils.exec "packadd packer.nvim"
require("packer").startup(function()
	use {                                                         -- packer.nvim itself
		"wbthomason/packer.nvim",
		event = "VimEnter",
		opt = true
	}
	--- Autocompletion and linting
	use {                                                         -- Autocompletion
		"hrsh7th/nvim-compe",
		config = function() require "plugins/nvim-compe" end,
		event  = "InsertEnter"
	}
	use {                                                         -- LSP configurations
		"neovim/nvim-lspconfig",
		config = function() require "plugins/nvim-lspconfig" end
	}
	use "kabouzeid/nvim-lspinstall"                               -- LSP installer
	use {                                                         -- Snippets solution
		"hrsh7th/vim-vsnip",
		event = "InsertCharPre"
	}
	use {                                                         -- Collection of snippets
		"rafamadriz/friendly-snippets",
		event = "InsertCharPre"
	}
	use {                                                         -- Linting engine
		"dense-analysis/ale",
		config = function() require "plugins/ale" end
	}
	--- Cosmetics
	-- TODO: maybe replace later?
	require "plugins/vim-airline"
	use {                                                         -- Status, buffer and tabline
		"vim-airline/vim-airline",
		after = "packer.nvim"
	}
	use {                                                         -- Extension to vim-airline
		"ntpeters/vim-airline-colornum",
		after = "vim-airline"
	}
	use "rakr/vim-one"                                            -- Colorscheme
	use {                                                         -- Indentation guides
		"lukas-reineke/indent-blankline.nvim",
		config = function() require "plugins/indent-blankline" end
	}
----- Extensions
	use {                                                         -- Multiple cursors support
		"mg979/vim-visual-multi",
		event = "BufRead"
	}
	use {                                                         -- Startup time calculator
		"tweekmonster/startuptime.vim",
		cmd = "StartupTime"
	}
----- Highlighting
	use {                                                         -- Color highlighter
		"norcalli/nvim-colorizer.lua",
		config = function() require "plugins/nvim-colorizer" end,
		after = "nvim-treesitter"
	}
	use {                                                         -- Syntax highlighter
		"nvim-treesitter/nvim-treesitter",
		config = function() require "plugins/nvim-treesitter" end,
		run = ":TSUpdate",
		event = "BufEnter"
	}
	--- Compile
	utils.exec "PackerCompile"
end)
