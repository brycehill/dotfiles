--
--
-- LSP
--
--
--
--
return {
	"neovim/nvim-lspconfig",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = {
		"hrsh7th/cmp-nvim-lsp",
		{ "antosha417/nvim-lsp-file-operations", config = true },
		{ "folke/neodev.nvim", opts = {} },
	},
	config = function()
		local lspconfig = require("lspconfig")
		local capabilities = require("cmp_nvim_lsp").default_capabilities()

		local on_attach = function(_, bufnr)
			vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, {})
			-- vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, {})
			--
			vim.keymap.set("n", "gd", vim.lsp.buf.definition, {})
			-- vim.keymap.set("n", "gi", vim.lsp.buf.implementation, {})
			-- vim.keymap.set("n", "gr", require("telescope.builtin").lsp_references, {})
			vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
		end

		-- Typescript
		lspconfig.tsserver.setup({
			on_attach = on_attach,
			capabilities = capabilities,
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

		-- Lua
		lspconfig.lua_ls.setup({
			on_attach = on_attach,
			capabilities = capabilities,
			settings = {
				Lua = {
					diagnostics = {
						globals = { "vim", "use" },
					},
				},
			},
		})

		-- CSS
		lspconfig.cssls.setup({
			capabilities = capabilities,
			on_attach = on_attach,
		})

		-- ESLint
		lspconfig.eslint.setup({})

		-- Stylelint
		lspconfig.stylelint_lsp.setup({
			filetypes = { "css", "javascript" },
			root_dir = lspconfig.util.root_pattern("package.json", ".git"),
			settings = {
				stylelintplus = {
					autoFixOnFormat = true,
					autoFixOnSave = true,
					validateOnSave = true,
					validateOnType = false,
				},
			},
		})
	end,
}
