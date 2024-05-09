--
--
-- V I M  OPTIONS
--
--

vim.opt.expandtab = true
vim.opt.diffopt = "vertical"
vim.opt.shiftwidth = 2
vim.opt.guifont = "Hasklug Nerd Font:h13 Bold"
-- set clipboard=unnamed
vim.opt.gdefault = true
vim.opt.cursorline = true
vim.opt.ruler = true
vim.opt.autoread = true
vim.opt.synmaxcol = 200
vim.opt.colorcolumn = "80"
vim.opt.tabstop = 4
vim.opt.number = true
vim.opt.shiftwidth = 2
vim.opt.softtabstop = 2
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.shortmess = "atIiA"
vim.opt.signcolumn = "yes"
vim.opt.scrolloff = 10
-- For gf to find require/imports
vim.opt.suffixesadd:append(".js")
-- So gf finds node_modules
vim.opt.path:append("$PWD/node_modules")
vim.opt.mouse = "niv"
vim.opt.relativenumber = true
-- Maintain undo history between sessions
vim.opt.undofile = true
--vim.opt.undodir="~/.config/nvim/undodir"
-- Folding
vim.opt.foldmethod = "syntax"
vim.opt.foldlevelstart = 99
-- Emojis
vim.opt.completefunc = "emoji#complete"
vim.opt.wrap = false
vim.opt.termguicolors = true
vim.opt.foldmethod = "expr"

vim.filetype.add({
	-- Detect and assign filetype based on the extension of the filename
	extension = {
		-- 	env = "sh",
		["local"] = "sh",
	},
	-- Detect and apply filetypes based on the entire filename
	filename = {
		-- [".env"] = "sh",
		-- ["env"] = "sh",
		[".env.local"] = "sh",
		[".stylelintrc"] = "json",
	},
	-- Detect and apply filetypes based on certain patterns of the filenames
	pattern = {
		-- INFO: Match filenames like - ".env.example", ".env.local" and so on
		--["%.env%.[%w_.-]+"] = "sh",
		[".stylelintrc"] = "json",
	},
})
