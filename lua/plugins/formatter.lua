return {
	"mhartington/formatter.nvim",
	config = function()
		local util = require("formatter.util")

		--
		--
		-- Formatter
		--
		--

		-- Prettier function for formatter
		local prettier = function()
			return {
				exe = "./node_modules/.bin/prettier",
				args = { "--stdin-filepath", vim.fn.fnameescape(vim.api.nvim_buf_get_name(0)) },
				stdin = true,
				try_node_modules = true,
			}
		end

		-- local prettier = require("formatter.filetypes.javascript").prettier

		require("formatter").setup({
			--logging = false,
			filetype = {
				typescriptreact = {
					prettier,
				},
				javascriptreact = {
					prettier,
				},
				javascript = {
					prettier,
				},
				typescript = {
					prettier,
				},
				json = {
					prettier,
				},
				html = { prettier },
				css = { prettier },
				scss = { prettier },
				graphql = { prettier },
				markdown = { prettier },
				lua = {
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
			autocmd BufWritePost * FormatWrite 
		augroup END 
	]],
			true
		)
	end,
}
