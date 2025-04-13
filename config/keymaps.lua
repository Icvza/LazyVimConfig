vim.keymap.set("n", "<leader>cp", ':let @+ = expand("%:p")<CR>', { silent = true, desc = "Copy file path" })
vim.keymap.set("n", "<leader>cx", ":%s/", { noremap = true })
vim.keymap.set("n", "cy", ":%y+<CR>", { silent = true, desc = "Yank all" })
vim.keymap.set("n", "-", "<cmd>Oil --float<CR>", { desc = "Open Parent Directory in Oil" })
