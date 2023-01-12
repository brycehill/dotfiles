-- Treesitter

require("nvim-treesitter.configs").setup({
	context_commentstring = {
		enable = true,
	},
	ensure_installed = {
		"bash",
		"javascript",
		"json",
		"css",
		"lua",
		"markdown",
		"rust",
		"typescript",
		"jsdoc",
		"html",
		"graphql",
	},
	highlight = {
		enable = true,
		disable = { "html" }, -- FIX: disabled for now https://github.com/nvim-treesitter/nvim-treesitter/issues/1788
	},
	autotag = { enable = true },
	indent = {
		-- Enable once better supported
		enable = false,
	},
})
vim.opt.foldexpr = "nvim_treesitter#foldexpr"

-- FIX: for nvim-autotag - not actually working
local ts_utils = require("nvim-treesitter.ts_utils")
ts_utils.get_node_text = vim.treesitter.query.get_node_text
