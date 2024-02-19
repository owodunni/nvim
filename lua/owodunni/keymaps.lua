local opts = { noremap = true, silent = true }

local term_opts = { silent = true }

-- Shorten function name
local keymap = vim.api.nvim_set_keymap

-- Remap space as leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = ";"
vim.g.maplocalleader = ";"

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

-- Normal --
-- Better window navigation
keymap("n", "<Down>", "<C-w>j", opts)
keymap("n", "<Up>", "<C-w>k", opts)
keymap("n", "<Right>", "<C-w>l", opts)
keymap("n", "<Left>", "<C-w>h", opts)

keymap("n", "<S-l>", "<C-w>l", opts)
keymap("n", "<S-h>", "<C-w>h", opts)

-- Resize with arrows
keymap("n", "<A-k>", ":resize +2<CR>", opts)
keymap("n", "<A-j>", ":resize -2<CR>", opts)
keymap("n", "<A-h>", ":vertical resize -2<CR>", opts)
keymap("n", "<A-l>", ":vertical resize +2<CR>", opts)

-- Navigate buffers
keymap("n", "<C-l>", ":bnext<CR>", opts)
keymap("n", "<C-h>", ":bprevious<CR>", opts)

-- Visual --
-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Move text up and down
keymap("v", "<Down>", ":m .+1<CR>==", opts)
keymap("v", "<Up>", ":m .-2<CR>==", opts)
keymap("x", "<Down>", ":move '>+1<CR>gv-gv", opts)
keymap("x", "<Up>", ":move '<-2<CR>gv-gv", opts)

-- Keep buffer when replacing text
keymap("v", "p", '"_dP', opts)

-- Visual Block --
-- Move text up and down

-- Terminal --
-- Better terminal navigation
--keymap("t", "<Left>", "<C-\\><C-N><C-w>h", term_opts)
--keymap("t", "<Down>", "<C-\\><C-N><C-w>j", term_opts)
--keymap("t", "<Up>", "<C-\\><C-N><C-w>k", term_opts)
--keymap("t", "<Right>", "<C-\\><C-N><C-w>l", term_opts)

-- Telescope
keymap("n", "<leader>f", "<cmd>Telescope find_files hidden=true<cr>", opts)
keymap("n", "<leader>a", "<cmd>Telescope live_grep<cr>", opts)

-- Conform formatting
-- keymap("n", "<leader>l", "<cmd>Format<cr>", opts)

-- Nvimtree
keymap("n", "<leader>e", ":NvimTreeToggle<cr>", opts)

-- Fugitive
keymap("n", "<leader>gs", ":Git<cr>", opts)
keymap("n", "<leader>gb", ":Git blame<cr>", opts)

-- Copy paste to system clipboard
keymap("v", "<leader>p", '"_dp', opts)
keymap("v", "<leader>y", '"+y', opts)
keymap("n", "<leader>y", '"+y', opts)
keymap("n", "<leader>Y", 'gg"+yG', opts)
keymap("v", "<leader>d", '"_d', opts)
keymap("n", "<leader>d", '"_d', opts)
