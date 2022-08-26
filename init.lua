vim.g.mapleader = " "

require("plugins")

require("neoscroll").setup()

--
--
-- V I M
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

--
--
-- K E Y B I N D I N G S
--
--

local keymap = vim.api.nvim_set_keymap
local noremap = { noremap = true }

--
-- Normal Mode
--

keymap("n", "<leader>n", ":Vexplore<CR>", noremap)
keymap("n", "<leader>w", ":w<CR>", noremap)
keymap("n", "<leader>q", ":q<CR>", noremap)
keymap("n", "<leader>,", "<C-w><C-v><C-l>:e ~/.config/nvim/init.lua<CR>", noremap)
--New Vertical Split
keymap("n", "<leader>v", "<C-w>v<C-w>l", noremap)
-- Move around splits quicker
keymap("n", "<C-h>", "<C-w>h", noremap)
keymap("n", "<C-j>", "<C-w>j", noremap)
keymap("n", "<C-k>", "<C-w>k", noremap)
keymap("n", "<C-l>", "<C-w>l", noremap)
keymap("n", "<leader>d", ":bdelete<CR>", noremap)
keymap("n", "<leader>d!", ":bdelete!<CR>", noremap)
keymap("n", "<leader>gd", ":term git diff %<cr>", noremap)
-- Vertical diff splits
keymap("n", "<leader>;", ":noh<cr>", noremap)
-- Delete Buffer, but keep split open
keymap("n", "<leader>bq", ":bp<bar>bd #<CR>", noremap)
keymap("n", "<S-ENTER>", "0<Esc>", noremap)
keymap("n", "<CR>", "o<Esc>", noremap)

-- Git Shortcuts
-- keymap('n', ':gb', ':GitBlameToggle<cr>', {})
-- Disable Interactive History
keymap("n", "q:", "<nop>", {})
keymap("n", "Q", "<nop>", {})
-- Comments
keymap("n", "<leader>c", ":CommentToggle<CR>", { noremap = true, silent = true })
keymap("v", "<leader>c", ":'<,'>CommentToggle<CR>", { noremap = true, silent = true })

--
-- Insert Mode
--

keymap("i", "<c-s>", "<Esc>:w<CR>a", {})

--
-- Command Mode
--

keymap("c", "<C-a>", "<Home>", noremap)

--
-- Visual Mode
--

-- Move entire blocks of code
--keymap('v', 'J :m', '>+1<CR>gv=gv', noremap)
--keymap('v', 'K :m', '<-2<CR>gv=gv', noremap)

--
--
-- C O L O R S
--
--

-- require('onedark').setup()

-- Or if you have Neovim >= 0.1.5
vim.cmd([[colorscheme material]])
vim.g.material_style = "oceanic"

-- require('nightfox')

--require('OceanicNext').setup()
--require('edge').setup()

-- highlight RGB values with their color
require("colorizer").setup()
-- Customize whitespace to match Nova colorscheme
--highlight ExtraWhitespace guibg=#D18EC2
--syntax enable
--let &t_8f="\<Esc>[38;2;%lu;%lu;%lum"
--let &t_8b="\<Esc>[48;2;%lu;%lu;%lum"
--set termguicolors

--
-- T H E M E S
--

--vim.g.colors_name="gloombuddy"
-- One Dark
-- let g:onedark_hide_endofbuffer=1
-- let g:onedark_terminal_italics=1
-- let g:airline_theme='onedark'
-- colorscheme onedark

-- One
--let g:airline_theme='one'
--let g:one_allow_italics = 1
--colorscheme one

-- Nord
-- let g:nord_italic = 1
-- let g:nord_underline = 1
-- colorscheme nord

-- OceanicNext
-- let g:oceanic_next_terminal_bold = 1
-- let g:oceanic_next_terminal_italic = 1
-- let g:airline_theme='oceanicnext'
-- colorscheme OceanicNext

-- Neo Dark
-- let g:neodark#use_custom_terminal_theme = 1
-- let g:airline_theme='neodark'
-- colorscheme neodark

--highlight ColorColumn ctermbg=gray guibg=gray

-- highlight ColorColumn ctermbg=16

---
-- Plugin Settings
---

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

vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "nvim_treesitter#foldexpr"

-- FIX: for nvim-autotag - not actually working
local ts_utils = require("nvim-treesitter.ts_utils")
ts_utils.get_node_text = vim.treesitter.query.get_node_text

-- LSP

local lsp_installer = require("nvim-lsp-installer")
lsp_installer.setup({
	automatic_installation = true,
})

local signs = { Error = "● ", Warn = "● ", Hint = "● ", Info = "● " }
for type, icon in pairs(signs) do
	local hl = "DiagnosticSign" .. type
	vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end
vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
	border = "rounded",
})

vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
	border = "rounded",
})

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

--
-- L A N G U A G E  S E R V E R S
--

local lspconfig = require("lspconfig")

lspconfig.tsserver.setup({
	diagnostics = {
		-- "Could not find declaration file for module"
		ignoredCodes = 7016,
	},
	filetypes = {
		"javascript",
		"javascriptreact",
		"javascript.jsx",
		"typescript",
		"typescriptreact",
		"typescript.tsx",
	},
	cmd = { "typescript-language-server", "--stdio" },
	root_dir = function()
		return vim.loop.cwd()
	end,
})
require("lspconfig").eslint.setup({})

-- Telescope

local actions = require("telescope.actions")
require("telescope").setup({
	pickers = {
		buffers = {
			sort_lastused = true,
		},
	},
})

local telescope = require("telescope")
telescope.setup({
	defaults = {
		mappings = {
			i = {
				["<C-k>"] = "move_selection_previous",
				["<C-j>"] = "move_selection_next",
				["<esc>"] = "close",
			},
		},
	},
	pickers = {
		find_files = {
			theme = "dropdown",
		},
		live_grep = {
			theme = "dropdown",
			mappings = {
				i = { ["<c-f>"] = actions.to_fuzzy_refine },
			},
		},
		buffers = {
			theme = "dropdown",
		},
		-- grep_string = {
		-- only_sort_text = true,
		-- search = ''
		-- }
	},
})

telescope.load_extension("fzf")

keymap("n", "<leader>p", ":Telescope find_files hidden=true<cr>", noremap)
keymap("n", "<leader>a", ":Telescope live_grep<cr>", noremap)
keymap("n", "<leader>o", ":Telescope buffers<cr>", noremap)
keymap("n", "<leader>t", ":Telescope help_tags<cr>", noremap)
keymap("n", "gst<cr>", ":Telescope git_status<cr>", noremap)
keymap("n", "gstl<cr>", ":Telescope git_stash<cr>", noremap)

vim.cmd([[highlight ColorColumn ctermbg=gray guibg=gray]])
vim.cmd([[highlight ExtraWhitespace guibg=#D18EC2]])

require("gitsigns").setup()
require("nvim-autopairs").setup({})

require("lualine").setup({
	options = {
		icons_enabled = true,
		theme = "onedark",
		component_separators = { left = "", right = "" },
		section_separators = { left = "", right = "" },
		disabled_filetypes = {},
		always_divide_middle = true,
		globalstatus = false,
	},
	sections = {
		lualine_a = { "mode" },
		lualine_b = { "branch", "diff", "diagnostics" },
		lualine_c = { "filename" },
		lualine_x = { "encoding", "fileformat", "filetype" },
		lualine_y = { "progress" },
		lualine_z = { "location" },
	},
	inactive_sections = {
		lualine_a = {},
		lualine_b = {},
		lualine_c = { "filename" },
		lualine_x = { "location" },
		lualine_y = {},
		lualine_z = {},
	},
})

local cmp = require("cmp")

cmp.setup({
	window = {
		documentation = cmp.config.window.bordered(),
	},
	snippet = {
		expand = function(args)
			luasnip.lsp_expand(args.body)
		end,
	},
	experimental = {
		ghost_text = true,
	},
	mapping = cmp.mapping.preset.insert({
		["<C-j>"] = cmp.mapping.select_next_item(),
		["<C-k>"] = cmp.mapping.select_prev_item(),
		["<C-space>"] = cmp.mapping.complete(),
		["<C-e>"] = cmp.mapping.abort(),
		["<esc>"] = cmp.mapping(function(fallback)
			cmp.mapping.abort()
			fallback()
		end),
		["<Tab>"] = cmp.mapping(function(fallback)
			if cmp.visible() then
				cmp.select_next_item()
			elseif luasnip.expand_or_jumpable() then
				luasnip.expand_or_jump()
			elseif has_words_before() then
				cmp.complete()
			else
				fallback()
			end
		end),
		["<CR>"] = cmp.mapping.confirm({ select = true }),
	}),
	sources = cmp.config.sources({
		{ name = "nvim_lsp" },
		{ name = "buffer" },
	}),
})

-- Set configuration for specific filetype.
cmp.setup.filetype("gitcommit", {
	sources = cmp.config.sources({
		-- You can specify the `cmp_git` source if you were installed it.
		{ name = "cmp_git" },
	}, {
		{ name = "buffer" },
	}),
})

--- Formatting

-- Prettier function for formatter
local prettier = function()
	return {
		exe = "prettier",
		args = { "--stdin-filepath", vim.fn.fnameescape(vim.api.nvim_buf_get_name(0)) },
		stdin = true,
	}
end

require("formatter").setup({
	--logging = false,
	filetype = {
		typescriptreact = { prettier },
		javascriptreact = { prettier },
		javascript = { prettier },
		typescript = { prettier },
		json = { prettier },
		html = { prettier },
		css = { prettier },
		scss = { prettier },
		graphql = { prettier },
		markdown = { prettier },
		lua = {
			-- Stylua
			function()
				return {
					exe = "stylua",
					args = {},
					stdin = false,
				}
			end,
		},
	},
})

-- Runs Formatter on save
vim.api.nvim_exec(
	[[
  augroup FormatAutogroup
  autocmd!
  autocmd BufWritePost *.js,*.jsx,*.ts,*.tsx,*.css,*.scss,*.md,*.html,*.lua,.*.json,*.jsonc,*.vue,*.py,*.gql,*.graphql,*.go FormatWrite
  augroup END
]],
	true
)

-- Comments
require("nvim_comment").setup({})

-- Save on Focus out
vim.cmd([[au FocusLost * :wa]])

--autocmd CursorHold * lua vim.lsp.util.show_line_diagnostics(c
