-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here
-- vim.api.nvim_create_autocmd({ "BufEnter", "BufRead" }, {
vim.api.nvim_create_autocmd({ "BufEnter", "BufRead" }, {
  pattern = { ".env", ".env.*", ".md" },
  callback = function(event)
    -- Using the newer API format
    vim.diagnostic.enable(false, { bufnr = event.buf })
  end,
})
