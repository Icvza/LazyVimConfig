return {
  "mbbill/undotree",
  keys = {
    { "<leader>u", vim.cmd.UndotreeToggle, desc = "Toggle undotree" },
  },
  config = function()
    vim.g.undotree_WindowLayout = 2
    vim.g.undotree_SplitWidth = 40
  end,
}
