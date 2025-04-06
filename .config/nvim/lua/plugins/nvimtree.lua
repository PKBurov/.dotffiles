return {
  "nvim-tree/nvim-tree.lua",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    local nvimtree = require("nvim-tree")

    -- Disable netrw (recommended by nvim-tree)
    vim.g.loaded_netrw = 1
    vim.g.loaded_netrwPlugin = 1

    -- Custom on_attach function
    local function on_attach(bufnr)
      local api = require("nvim-tree.api")

      -- Default mappings
      api.config.mappings.default_on_attach(bufnr)

      -- Change directory to selected folder
      vim.keymap.set("n", "<leader>cd", function()
        local node = api.tree.get_node_under_cursor()
        if node and node.type == "directory" then
          vim.cmd("cd " .. node.absolute_path)
          print("Changed directory to: " .. node.absolute_path)
        else
          print("Not a directory!")
        end
      end, { desc = "Change working directory", buffer = bufnr, noremap = true, silent = true })

      -- Change local directory
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

    -- Final options table
    local options = {
      disable_netrw = true,
      hijack_netrw = true,
      hijack_cursor = true,
      hijack_unnamed_buffer_when_opening = false,
      sync_root_with_cwd = true,
      update_focused_file = {
        enable = true,
        update_root = false,
      },
      filters = {
        dotfiles = false,
        custom = { ".DS_Store" },
        exclude = { vim.fn.stdpath("config") .. "/lua/custom" },
      },
      view = {
        adaptive_size = true,
        side = "left",
        width = 30,
        preserve_window_proportions = true,
      },
      git = {
        enable = false,
        ignore = true,
      },
      filesystem_watchers = {
        enable = true,
      },
      actions = {
        open_file = {
          resize_window = true,
          quit_on_open = true,
          window_picker = {
            enable = false,
          },
        },
      },
      renderer = {
        root_folder_label = false,
        highlight_git = false,
        highlight_opened_files = "none",
        indent_markers = {
          enable = false,
        },
        icons = {
          show = {
            file = true,
            folder = true,
            folder_arrow = true,
            git = false,
          },
          glyphs = {
            default = "󰈚",
            symlink = "",
            folder = {
              default = "",
              empty = "",
              empty_open = "",
              open = "",
              symlink = "",
              symlink_open = "",
              arrow_open = "",
              arrow_closed = "",
            },
            git = {
              unstaged = "✗",
              staged = "✓",
              unmerged = "",
              renamed = "➜",
              untracked = "★",
              deleted = "",
              ignored = "◌",
            },
          },
        },
      },
      on_attach = on_attach,
    }

    nvimtree.setup(options)
  end,
}
