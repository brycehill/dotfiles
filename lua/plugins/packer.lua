-- Ensure packer is setup on new machines
local ensure_packer = function()
	local fn = vim.fn
	local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
	if fn.empty(fn.glob(install_path)) > 0 then
		fn.system({ "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path })
		vim.cmd([[packadd packer.nvim]])
		return true
	end
	return false
end

local packer_bootstrap = ensure_packer()

vim.cmd([[packadd packer.nvim]])

-- Automatically run PackerCompile when this file changes
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerCompile
  augroup end
]])

return require("packer").startup(function()
	-- Packer can manage itself
	use("wbthomason/packer.nvim")

	use("nvim-treesitter/nvim-treesitter")
	use("sheerun/vim-polyglot")

	use({
		"nvim-tree/nvim-tree.lua",
		requires = {
			"nvim-tree/nvim-web-devicons",
		},
		tag = "nightly", -- optional, updated every week. (see issue #1193)
	})

	use("kyazdani42/nvim-web-devicons")

	-- Formatting
	use("mhartington/formatter.nvim")

	-- LSP
	use({
		"williamboman/mason.nvim", -- LSP Package Manager
		"williamboman/mason-lspconfig.nvim",
		"neovim/nvim-lspconfig",
	})

	-- Autocomplete
	use({
		"hrsh7th/nvim-cmp",
		requires = {
			"hrsh7th/cmp-cmdline", -- command line
			"hrsh7th/cmp-buffer", -- buffer completions
			"hrsh7th/cmp-nvim-lua", -- nvim config completions
			"hrsh7th/cmp-nvim-lsp", -- lsp completions
			"hrsh7th/cmp-path", -- file path completions
			"L3MON4D3/LuaSnip", -- snippets completions
			"saadparwaiz1/cmp_luasnip",
			"rafamadriz/friendly-snippets", -- Built-in Snippets
			"onsails/lspkind.nvim",
		},
	})

	-- lua
	use({
		"ckipp01/stylua-nvim",
		run = "cargo install stylua",
	})

	-- better quickfix
	use({ "kevinhwang91/nvim-bqf" })

	-- Comments
	-- use("terrortylor/nvim-comment")
	use("JoosepAlviste/nvim-ts-context-commentstring")
	use("numToStr/Comment.nvim")

	use({
		"nvim-telescope/telescope.nvim",
		requires = { { "nvim-lua/plenary.nvim" } },
	})

	use({ "stevearc/dressing.nvim" })

	use({
		"nvim-telescope/telescope-fzf-native.nvim",
		run = "make",
	})

	use({
		"ibhagwan/fzf-lua",
		-- optional for icon support
		requires = { "nvim-tree/nvim-web-devicons" },
	})

	use("BurntSushi/ripgrep")

	-- git
	use("tpope/vim-fugitive")
	use("lewis6991/gitsigns.nvim")

	use("windwp/nvim-autopairs")
	use("windwp/nvim-ts-autotag")
	use("tpope/vim-surround")

	-- Colors
	use("tjdevries/colorbuddy.nvim")
	--use 'bkegley/gloombuddy'
	use("EdenEast/nightfox.nvim")
	use("ful1e5/onedark.nvim")
	use("mhartington/oceanic-next")
	use("sainnhe/edge")
	use("Th3Whit3Wolf/onebuddy")
	use("RRethy/nvim-base16")
	use("marko-cerovac/material.nvim")

	-- Markdown preview
	use({
		"ellisonleao/glow.nvim",
		config = function()
			require("glow").setup()
		end,
	})

	use({
		"nvim-lualine/lualine.nvim",
		requires = { "kyazdani42/nvim-web-devicons", opt = true },
	})

	use("norcalli/nvim-colorizer.lua")

	-- tmux
	-- use("christoomey/vim-tmux-navigator")
	-- Make focus events work in tmux
	-- use("tmux-plugins/vim-tmux-focus-events")

	if packer_bootstrap then
		require("packer").sync()
	end
end)
