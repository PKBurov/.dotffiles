local map = vim.keymap.set
local opts = { noremap = true, silent = true, desc = "Window navigation" }

-- General keybindings
map("n", ";", ":", { desc = "Enter command mode" })
map("i", "jk", "<ESC>")
map({ "n", "i", "v" }, "<C-s>", "<cmd>w<CR>", { desc = "Save file" })

-- Window navigation
map("n", "<leader>h", "<C-w>h", opts)
map("n", "<leader>j", "<C-w>j", opts)
map("n", "<leader>k", "<C-w>k", opts)
map("n", "<leader>l", "<C-w>l", opts)

-- Move selected text up and down (works in visual and block mode)
map("v", "J", ":m '>+1<CR>gv=gv")
map("v", "K", ":m '<-2<CR>gv=gv")

-- Join lines without moving cursor
map("n", "J", "mzJ`z")

-- Half-page jumps while keeping cursor centered
map("n", "<C-d>", "<C-d>zz")
map("n", "<C-u>", "<C-u>zz")

-- Search navigation keeps cursor centered
map("n", "n", "nzzzv")
map("n", "N", "Nzzzv")

-- Paste without replacing register
map("x", "<leader>p", "\"_dP")

-- Save file with Ctrl+S
map({ "n", "i", "v" }, "<C-s>", "<cmd>w<CR>", { desc = "Save file" })

-- Sets up C++ compiler and executable for nvim
map("n", "<leader>c", ":!clang++ -std=c++17 -g % -o %:r<CR>")
map("n", "<leader>r", ":!./%:r<CR>")

