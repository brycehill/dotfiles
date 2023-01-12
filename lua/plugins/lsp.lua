--
--
-- LSP
--
--

require("mason").setup()
require("mason-lspconfig").setup({
	ensure_installed = { "sumneko_lua" },
	automatic_installation = true,
})

local on_attach = function(_, bufnr)
	vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, {})
	-- vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, {})
	--
	vim.keymap.set("n", "gd", vim.lsp.buf.definition, {})
	-- vim.keymap.set("n", "gi", vim.lsp.buf.implementation, {})
	-- vim.keymap.set("n", "gr", require("telescope.builtin").lsp_references, {})
	vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
end

local lspconfig = require("lspconfig")
local capabilities = require("cmp_nvim_lsp").default_capabilities()

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
lspconfig.sumneko_lua.setup({
	on_attach = on_attach,
	capabilities = capabilities,
})

-- ESLint
lspconfig.eslint.setup({})
