return {
  "stevearc/oil.nvim",
  ---@module 'oil'
  ---@type oil.SetupOpts
  opts = { skip_confirm_for_simple_edits = true },
  -- Optional dependencies
  dependencies = { { "nvim-mini/mini.icons", opts = {} } },
  lazy = false,
}
