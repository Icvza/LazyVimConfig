return {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      -- Existing configuration (like ensure_installed)
      -- Ensure you're extending or setting the ensure_installed list correctly
      -- ...

      -- Incremental selection configuration
      opts.incremental_selection = {
        enable = true,
        keymaps = {
          init_selection = "<C-m>", -- Start the selection
          node_incremental = "<C-m>", -- Increment the selection
          scope_incremental = "<C-s>", -- Optional: map a key for scope incremental
          node_decremental = "<bs>", -- Decrement the selection
        },
      }

      -- Ensure highlight is enabled
      opts.highlight = {
        enable = true,
      }

      return opts
    end,
  },
}
