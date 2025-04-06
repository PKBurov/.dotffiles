return {
  "nvim-telescope/telescope.nvim",
  dependencies = { "nvim-lua/plenary.nvim" },
  config = function()
    require("telescope").setup({
      defaults = {
        mappings = {
          i = {
            ["<C-n>"] = require("telescope.actions").cycle_history_next,
            ["<C-p>"] = require("telescope.actions").cycle_history_prev,
          },
        },
      },
    })
    
    -- Create a custom keybinding to trigger `Telescope find_files` with `hidden=true`
    vim.keymap.set("n", "FF", ":Telescope find_files hidden=true<CR>", { noremap = true, silent = true })
  end,
}
