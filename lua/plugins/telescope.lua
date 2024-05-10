return {
	"nvim-telescope/telescope.nvim",
	branch = "0.1.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
		"nvim-tree/nvim-web-devicons",
		"folke/todo-comments.nvim",
	},
	config = function()
		local actions = require("telescope.actions")
		local telescope = require("telescope")
		local trouble = require("trouble")
		local trouble_telescope = require("trouble.providers.telescope")
		local transform_mod = require("telescope.actions.mt").transform_mod

		local custom_actions = transform_mod({
			open_trouble_qflist = function(prompt_bufnr)
				trouble.toggle("quickfix")
			end,
		})

		telescope.setup({
			defaults = {
				path_display = { "truncate" },
				mappings = {
					i = {
						["<C-k>"] = "move_selection_previous",
						["<C-j>"] = "move_selection_next",
						["<esc>"] = "close",
						["<C-q>"] = actions.send_selected_to_qflist + custom_actions.open_trouble_qflist,
						["<C-t>"] = trouble_telescope.smart_open_with_trouble,
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
					sort_mru = true,
					ignore_current_buffer = true,
				},
				-- grep_string = {
				-- only_sort_text = true,
				-- search = ''
				-- }
			},
		})

		telescope.load_extension("fzf")

		vim.api.nvim_set_keymap("n", "<leader>p", ":Telescope find_files hidden=true<cr>", { noremap = true })
		vim.api.nvim_set_keymap("n", "<leader>a", ":Telescope live_grep<cr>", { noremap = true })
		vim.api.nvim_set_keymap("n", "<leader>o", ":Telescope buffers<cr>", { noremap = true })
		vim.api.nvim_set_keymap("n", "<leader>t", ":Telescope help_tags<cr>", { noremap = true })

		vim.api.nvim_set_keymap("n", "gst<cr>", ":Telescope git_status<cr>", { noremap = true })
		vim.api.nvim_set_keymap("n", "gstl<cr>", ":Telescope git_stash<cr>", { noremap = true })
	end,
}
