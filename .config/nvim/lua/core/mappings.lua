local map = vim.keymap.set
local opts = { noremap = true, silent = true, desc = "Window navigation" }

-- General keybindings
map("n", ";", ":", { desc = "Enter command mode" })
map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")
map({ "n", "i", "v" }, "<C-s>", "<cmd>w<CR>", { desc = "Save file" })

-- Window navigation
keymap("n", "<leader>h", "<C-w>h", opts) -- Move left
keymap("n", "<leader>j", "<C-w>j", opts) -- Move down
keymap("n", "<leader>k", "<C-w>k", opts) -- Move up
keymap("n", "<leader>l", "<C-w>l", opts) -- Move right

-- General keybindings
map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

-- Moves highlighted text with capital J and K up and down
map("v", "J", ":m '>+1<CR>gv=gv")
map("v", "K", ":m '<-2<CR>gv=gv")

-- Appends the line below to the one uptop without moving your cursor at the back
map("n", "J", "mzJ'z")

-- Half page jumping keeping cursor in the middle
map("n", "<C-d›", "<C-d>zz")
map("n", "<C-u>", "<C-u>ZZ")

-- When searching keep cursor in the middle
map("n", "n", "nzzzv")
map("n", "N", "Nzzzv")

-- Greates remap ever, copy to not fill copy buffer with the thing that is bing replaced;
map('x', '<leader>p', "\"_dP")

-- Save file with ctr s
map({ "n", "i", "v" }, "<C-s>", "<cmd>w<CR>", { desc = "Save file" })

-- Add more mappings as needed 
