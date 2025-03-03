local map = vim.keymap.set
local opts = { noremap = true, silent = true, desc = "Window navigation" }

-- General keybindings
map("n", ";", ":", { desc = "Enter command mode" })
map("i", "jk", "<ESC>")
map({ "n", "i", "v" }, "<C-s>", "<cmd>w<CR>", { desc = "Save file" })

-- Window navigation
keymap("n", "<leader>h", "<C-w>h", opts) -- Move left
keymap("n", "<leader>j", "<C-w>j", opts) -- Move down
keymap("n", "<leader>k", "<C-w>k", opts) -- Move up
keymap("n", "<leader>l", "<C-w>l", opts) -- Move right

-- Add more mappings as needed 
