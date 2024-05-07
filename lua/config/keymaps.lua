-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- Mapping for bufferline go_to function
local function setBufferlineKey(key, buf_index)
  vim.keymap.set("n", "<Space>" .. key, function()
    require("bufferline").go_to(buf_index, true)
  end, { silent = true, desc = "Tab " .. buf_index })
end

-- Set mappings for each tab
setBufferlineKey("1", 1)
setBufferlineKey("2", 2)
setBufferlineKey("3", 3)
setBufferlineKey("4", 4)
setBufferlineKey("5", 5)
setBufferlineKey("6", 6)
setBufferlineKey("7", 7)
setBufferlineKey("8", 8)
setBufferlineKey("9", 9)

-- Mapping for switching between last two tabs
vim.keymap.set("n", "`", ":e #<CR>", { silent = true, desc = "Switch Tab" })

-- Mapping for switching between last two tabs
vim.keymap.set("n", "`", ":e #<CR>", { silent = true, desc = "Switch Tab" })

-- Change from Leader ff to leader f
vim.keymap.set("n", "<leader>f", ":Telescope find_files<CR>", { noremap = true, silent = true })

-- Mapping for saving the file when pressing esc
vim.keymap.set("i", "<esc>", "<esc>:w<CR>", { noremap = true, silent = true, desc = "Save and exit insert mode" })

-- Replace all occurrences of the word under the cursor in the entire file
vim.keymap.set("n", "<leader>u", function()
  local current_pos = vim.api.nvim_win_get_cursor(0)
  local word = vim.fn.expand("<cword>")
  local replacement = vim.fn.input("Replace " .. word .. " with: ")

  vim.api.nvim_win_set_cursor(0, { 1, 0 }) -- Move cursor to the beginning of the file
  vim.cmd("%s/\\<" .. word .. "\\>/" .. replacement .. "/g")
  vim.api.nvim_win_set_cursor(0, current_pos) -- Return cursor to the original position
end, { silent = true, desc = "Replace all occurrences of word under cursor in entire file" })
