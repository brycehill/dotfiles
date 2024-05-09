return {
	"nvim-treesitter/nvim-treesitter",
	event = { "BufReadPre", "BufNewFile" },
	build = ":TSUpdate",
	dependencies = {
		"windwp/nvim-ts-autotag",
	},
	config = function()
		require("ts_context_commentstring").setup()
		require("nvim-treesitter.configs").setup({
			ensure_installed = {
				"bash",
				"css",
				"javascript",
				"jsdoc",
				"json",
				"gitignore",
				"graphql",
				"html",
				"lua",
				"markdown",
				"styled",
				"tsx",
				"typescript",
				"vim",
				"vimdoc",
			},
			highlight = {
				enable = true,
			},
			autotag = {
				enable = true,
			},
			indent = {
				enable = true,
			},
			incremental_selection = {
				enable = true,
				keymaps = {
					init_selection = "<C-space>",
					node_incremental = "<C-space>",
					scope_incremental = false,
					node_decremental = "<bs>",
				},
			},
		})

		vim.opt.foldexpr = "nvim_treesitter#foldexpr"

		-- FIX: for nvim-autotag - not actually working
		local ts_utils = require("nvim-treesitter.ts_utils")
		ts_utils.get_node_text = vim.treesitter.query.get_node_text
	end,
}
