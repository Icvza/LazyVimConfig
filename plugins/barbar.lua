return {
  {
    "romgrk/barbar.nvim",
    dependencies = {
      "nvim-tree/nvim-web-devicons",
    },
    init = function()
      vim.g.barbar_auto_setup = false
      require("barbar").setup({
        highlight_visible = true,
        icons = {
          pinned = { button = "", filename = true },
          -- Configure the base icons on the bufferline.
          -- Valid options to display the buffer index and -number are `true`, 'superscript' and 'subscript'
          buffer_index = true,
          buffer_number = false,
          button = "",
          gitsigns = {
            added = { enabled = true, icon = "+" },
            changed = { enabled = true, icon = "~" },
            deleted = { enabled = true, icon = "-" },
          },
          filetype = {
            custom_colors = true,
            enabled = true,
          },
          separator = { left = "▎", right = "▎" },
          separator_at_end = true,

          modified = { button = "●" },
        },
      })
    end,
    keys = {
      -- Move to previous/next
      { "<S-l>", "<Cmd>BufferNext<CR>", desc = "Move to Next Tab" },
      { "<S-h>", "<Cmd>BufferPrevious<CR>", desc = "Move to Next Tab" },
      -- Re-order to previous/next
      { "<M-l>", "<Cmd>BufferMoveNext<CR>", desc = "Move Tab Right" },
      { "<M-h>", "<Cmd>BufferMovePrevious<CR>", desc = "Move Tab Left" },
      -- pins
      { "<Space>bp", "<Cmd>BufferPin<CR>", desc = "Pin Tab" },
      -- Close commands
      { "<Space>bc", "<Cmd>BufferClose<CR>", desc = "Close Tab" },
      --                 :BufferCloseAllButCurrent
      --                 :BufferCloseAllButPinned
      --                 :BufferCloseAllButCurrentOrPinned
      --                 :BufferCloseBuffersLeft
      --                 :BufferCloseBuffersRight
      -- Goto tab
      { "<Space>1", "<Cmd>BufferGoto 1<CR>", desc = "Tab 1" },
      { "<Space>2", "<Cmd>BufferGoto 2<CR>", desc = "Tab 2" },
      { "<Space>3", "<Cmd>BufferGoto 3<CR>", desc = "Tab 3" },
      { "<Space>4", "<Cmd>BufferGoto 4<CR>", desc = "Tab 4" },
      { "<Space>5", "<Cmd>BufferGoto 5<CR>", desc = "Tab 5" },
      { "<Space>6", "<Cmd>BufferGoto 6<CR>", desc = "Tab 6" },
      { "<Space>7", "<Cmd>BufferGoto 7<CR>", desc = "Tab 7" },
      { "<Space>8", "<Cmd>BufferGoto 8<CR>", desc = "Tab 8" },
      { "<Space>9", "<Cmd>BufferGoto 9<CR>", desc = "Tab 9" },
    },
    version = "^1.0.0", -- optional: only update when a new 1.x version is released
  },
}
