require "nvchad.mappings"

-- add yours here
local harpoon = require("harpoon")
local map = vim.keymap.set

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

-- Custom keymaps for nvim-tree
map("n", "<C-]>", ":lua require('nvim-tree.api').tree.change_root_to_node()<CR>", { noremap = true, silent = true })
map("n", "<C-[>", ":lua require('nvim-tree.api').tree.change_root_to_parent()<CR>", { noremap = true, silent = true })

-- Toggle nvim-tree:
map("n","<leader>e", ":NvimTreeToggle<cr>")

-- Custom Harpoon keymaps
-- REQUIRED
harpoon:setup()

-- REQUIRED
map("n", "<leader>a", function() harpoon:list():add() end)
map("n", "<C-e>", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end)

map("n", "<C-h>", function() harpoon:list():select(1) end)
map("n", "<C-t>", function() harpoon:list():select(2) end)
map("n", "<C-n>", function() harpoon:list():select(3) end)
map("n", "<C-s>", function() harpoon:list():select(4) end)

-- Toggle previous & next buffers stored within Harpoon list
map("n", "<C-S-P>", function() harpoon:list():prev() end)
map("n", "<C-S-N>", function() harpoon:list():next() end)

-- Toggle UndotreeToggled
map("n", "‹leader>u", vim. cmd. UndotreeToggled)
