require "nvchad.mappings"

local harpoon = require("harpoon")
local map = vim.keymap.set

-- Custom keymaps for nvim-tree
map("n", "<C-]>", ":lua require('nvim-tree.api').tree.change_root_to_node()<CR>", { noremap = true, silent = true })
map("n", "<C-[>", ":lua require('nvim-tree.api').tree.change_root_to_parent()<CR>", { noremap = true, silent = true })

-- Toggle nvim-tree:
map("n","<leader>e", ":NvimTreeToggle<cr>")

-- Custom keymaps for copilot:
map("n", "<leader>ccb", function()
  local input = vim.fn.input "Chat with buffer: "
  if input ~= "" then
    require("CopilotChat").ask(input, { selection = require("CopilotChat.select").buffer })
  end
end, { desc = "Copilot chat with buffer" })

map("v", "<leader>cc", function()
  local input = vim.fn.input "Chat with selection: "
  if input ~= "" then
    require("CopilotChat").ask(input, { selection = require("CopilotChat.select").visual })
  end
end, { desc = "Copilot chat with visual selection" })

map("n", "<leader>ccp", function()
  local actions = require "CopilotChat.actions"
  require("CopilotChat.integrations.telescope").pick(actions.prompt_actions())
end, { desc = "Copilot prompt actions" })

map("n", "<leader>cca", function()
  local input = vim.fn.input "Chat with all files: "
  if input ~= "" then
    require("CopilotChat").ask(input, { context = { "buffers", "files:full", "register:+" } })
  end
end, { desc = "Copilot ask about all files" })


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
map("n", "‹leader>u", vim.cmd.UndotreeToggled)
