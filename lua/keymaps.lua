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
