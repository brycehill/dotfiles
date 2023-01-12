--
--
-- Telescope
--
--

local actions = require("telescope.actions")
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
