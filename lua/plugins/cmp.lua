-- Autocompletions
return {
	"hrsh7th/nvim-cmp",
	event = "InsertEnter",
	dependencies = {
		"hrsh7th/cmp-buffer", -- source for text in buffer
		"hrsh7th/cmp-cmdline", -- command line
		"hrsh7th/cmp-nvim-lua", -- nvim config completions
		"l3mon4d3/luasnip", -- snippets completions
		"hrsh7th/cmp-path", -- source for file system paths
		"saadparwaiz1/cmp_luasnip", -- for autocompletion
		"rafamadriz/friendly-snippets", -- useful snippets
		"onsails/lspkind.nvim", -- vs-code like pictograms
	},
	config = function()
		local cmp = require("cmp")
		local luasnip = require("luasnip")
		local cmp_autopairs = require("nvim-autopairs.completion.cmp")
		local lspkind = require("lspkind")

		vim.opt.completeopt = { "menu", "menuone", "noselect" }

		require("luasnip.loaders.from_vscode").lazy_load()

		cmp.setup({
			window = {
				documentation = cmp.config.window.bordered(),
				max_height = 10,
			},
			formatting = {
				fields = { "menu", "abbr", "kind" },
				format = lspkind.cmp_format({
					maxwidth = 50,
					ellipsis_char = "...",
				}),
				-- format = function(entry, item)
				-- 	local ELLIPSIS_CHAR = "…"
				-- 	local MAX_LABEL_WIDTH = 20
				-- 	local MIN_LABEL_WIDTH = 20
				--
				-- 	local menu_icon = {
				-- 		nvim_lsp = "λ",
				-- 		luasnip = "⋗",
				-- 		buffer = "Ω",
				-- 		path = "🖫",
				-- 	}
				--
				-- 	local label = item.abbr
				-- 	local truncated_label = vim.fn.strcharpart(label, 0, MAX_LABEL_WIDTH)
				-- 	item.menu = menu_icon[entry.source.name]
				--
				-- 	-- Keep the menu at a fixed width to prevent a jarring resize
				-- 	if truncated_label ~= label then
				-- 		item.abbr = truncated_label .. ELLIPSIS_CHAR
				-- 	elseif string.len(label) < MIN_LABEL_WIDTH then
				-- 		local padding = string.rep(" ", MIN_LABEL_WIDTH - string.len(label))
				-- 		item.abbr = label .. padding
				-- 	end
				--
				-- 	return item
				-- end,
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
				{
					name = "luasnip",
					keyword_length = 2,
					max_item_count = 4,
				},
				{
					name = "buffer",
					keyword_length = 2,
					max_item_count = 5,
				},
				{
					name = "path",
					max_item_count = 5,
				},
				{
					name = "nvim_lsp",
					keyword_length = 3,
					max_item_count = 4,
				},
			}, {
				{
					name = "buffer",
					max_item_count = 4,
				},
			}),
		})

		-- Set configuration for specific filetype.
		cmp.setup.filetype("gitcommit", {
			sources = cmp.config.sources({
				{ name = "cmp_git" },
			}, {
				{ name = "buffer" },
			}),
		})

		-- Add parentheses after selecting function or method item
		cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())
	end,
}
