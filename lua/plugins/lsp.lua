--
--
-- LSP
--
--

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

--
-- L A N G U A G E  S E R V E R S
--

local lspconfig = require("lspconfig")
local capabilities = require("cmp_nvim_lsp").default_capabilities()

lspconfig.tsserver.setup({
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

lspconfig.sumneko_lua.setup({
	capabilities = capabilities,
})
lspconfig.eslint.setup({})
