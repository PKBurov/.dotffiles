vim.g.base46_cache = vim.fn.stdpath "data" .. "/base46/"
vim.g.mapleader = " "

-- bootstrap lazy and all plugins
local lazypath = vim.fn.stdpath "data" .. "/lazy/lazy.nvim"

if not vim.uv.fs_stat(lazypath) then
  local repo = "https://github.com/folke/lazy.nvim.git"
  vim.fn.system { "git", "clone", "--filter=blob:none", repo, "--branch=stable", lazypath }
end

vim.opt.rtp:prepend(lazypath)
local lazy_config = require "configs.lazy"

-- load plugins
require("lazy").setup({
  {
    "NvChad/NvChad",
    lazy = false,
    branch = "v2.5",
    import = "nvchad.plugins",
  },

  { import = "plugins" },

}, lazy_config)

-- Ensure Telescope is loaded and working
require('telescope').setup({
  pickers = {
    find_files = {
      cwd = vim.fn.getcwd()
    }
  }
})

-- load theme
dofile(vim.g.base46_cache .. "defaults")
dofile(vim.g.base46_cache .. "statusline")

require "options"
require "nvchad.autocmds"

vim.schedule(function()
  require "plugins-mappings"
end)
vim.opt.termguicolors = true

-- Sets up C++ compiler and executable for nvim
vim.keymap.set("n", "<leader>c", ":!g++ -o %:r %<CR>")
vim.keymap.set("n", "<leader>r", ":!./%:r<CR>")
