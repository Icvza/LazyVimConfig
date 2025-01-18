-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
vim.g.root_spec = { "cwd" }
vim.g.lazyvim_picker = "fzf"
vim.env.FZF_DEFAULT_COMMAND = "fd --type f --hidden --follow --exclude .git --exclude node_modules"
vim.cmd([[
  autocmd BufEnter * let &titlestring = expand('%:t') . ' (' . expand('%:p:h:t') . ')'
  set title
]])
