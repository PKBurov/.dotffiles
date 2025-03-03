return {
  "nvim-tree/nvim-tree.lua",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    local nvimtree = require("nvim-tree")

    -- Disable netrw (recommended by nvim-tree)
    vim.g.loaded_netrw = 1
    vim.g.loaded_netrwPlugin = 1

    local function on_attach(bufnr)
      local api = require("nvim-tree.api")

      -- Default mappings
      api.config.mappings.default_on_attach(bufnr)

      -- Change directory to the selected folder
      vim.keymap.set("n", "<leader>cd", function()
        local node = api.tree.get_node_under_cursor()
        if node and node.type == "directory" then
          vim.cmd("cd " .. node.absolute_path)
          print("Changed directory to: " .. node.absolute_path)
        else
          print("Not a directory!")
        end
      end, { desc = "Change working directory", buffer = bufnr, noremap = true, silent = true })

      -- Change local directory (only for current window)
      vim.keymap.set("n", "<leader>lcd", function()
        local node = api.tree.get_node_under_cursor()
        if node and node.type == "directory" then
          vim.cmd("lcd " .. node.absolute_path)
          print("Changed local directory to: " .. node.absolute_path)
        else
          print("Not a directory!")
        end
      end, { desc = "Change local directory", buffer = bufnr, noremap = true, silent = true })

      -- Disable <C-e> inside NvimTree
      vim.keymap.set("n", "<C-e>", "", { buffer = bufnr, noremap = true, silent = true })
    end

    nvimtree.setup({
      view = {
        width = 30,
      },
      renderer = {
        indent_markers = { enable = false },
      },
      actions = {
        open_file = { window_picker = { enable = false } },
      },
      filters = {
        custom = { ".DS_Store" },
      },
      git = {
        ignore = true,
      },
      on_attach = on_attach, -- Attach function for custom mappings
    })
  end,
}
