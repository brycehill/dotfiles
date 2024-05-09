-- Install Lazy Plugin Manager if not already installed
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not (vim.uv or vim.loop).fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		--"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

vim.g.mapleader = " "

require("lazy").setup({ { import = "plugins" }, { import = "plugins.lsp" } })

-- Core
require("core.options")
require("core.keymaps")
require("core.colors")

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

vim.keymap.set("n", "<c-P>", "<cmd>lua require('fzf-lua').files()<CR>", {
	silent = true,
})
