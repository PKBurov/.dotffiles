local map = vim.keymap.set

-- General keybindings
map("n", ";", ":", { desc = "Enter command mode" })
map("i", "jk", "<ESC>")
map({ "n", "i", "v" }, "<C-s>", "<cmd>w<CR>", { desc = "Save file" })

-- Add more mappings as needed 
