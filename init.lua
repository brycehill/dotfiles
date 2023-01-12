vim.g.mapleader = " "

-- Core
require('options')
require('keymaps')
require('colors')

require("plugins.packer")

-- My Plugin Settings
require('plugins.cmp')
require('plugins.formatter')
require('plugins.lsp')
require('plugins.lualine')
require('plugins.telescope')
require('plugins.treesitter')

require("gitsigns").setup()
require("nvim-autopairs").setup({})
require("nvim_comment").setup({})
require("nvim-tree").setup()

-- where do these go?
vim.cmd([[highlight ColorColumn ctermbg=gray guibg=gray]])
vim.cmd([[highlight ExtraWhitespace guibg=#D18EC2]])
-- Save on Focus out
vim.cmd([[au FocusLost * :wa]])

vim.diagnostic.config({
	virtual_text = false,
	float = {
		source = "if_many",
	},
	signs = true,
	underline = false,
})

-- vim.o.updatetime = 250
-- vim.cmd [[
--   autocmd! CursorHold,CursorHoldI * lua vim.diagnostic.open_float({ header='' }, {focus=false})
--  ]]

vim.api.nvim_create_autocmd("CursorHold", {
	buffer = bufnr,
	callback = function()
		local opts = {
			focusable = false,
			close_events = { "BufLeave", "CursorMoved", "InsertEnter", "FocusLost" },
			border = "rounded",
			source = "always",
			prefix = "■",
			scope = "cursor",
		}
		vim.diagnostic.open_float(nil, opts)
	end,
})
