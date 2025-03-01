vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = "*",
  callback = function()
    -- Example: Trim trailing whitespace before saving
    vim.cmd [[%s/\s\+$//e]]
  end,
})
