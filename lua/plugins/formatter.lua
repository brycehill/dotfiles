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
	[[ augroup FormatAutogroup autocmd! autocmd BufWritePost *.js,*.jsx,*.ts,*.tsx,*.css,*.scss,*.md,*.html,*.lua,.*.json,*.jsonc,*.vue,*.py,*.gql,*.graphql,*.go FormatWrite augroup END ]],
	true
)
