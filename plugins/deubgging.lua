-- File: ~/.config/nvim/lua/plugins/dap.lua

return {
  "mfussenegger/nvim-dap",
  dependencies = {
    "rcarriga/nvim-dap-ui",
    "nvim-telescope/telescope.nvim",
    "nvim-telescope/telescope-dap.nvim",
    "nvim-neotest/nvim-nio",
  },
  config = function()
    local dap = require("dap")
    local dapui = require("dapui")

    -- Initialize DAP UI
    dapui.setup()

    -- Load Telescope DAP extension
    require("telescope").load_extension("dap")

    -- PHP Adapter Configuration
    dap.adapters.php = {
      type = "executable",
      command = "node",
      args = { os.getenv("HOME") .. "/vscode-php-debug/out/phpDebug.js" },
    }

    -- PHP Debug Configuration for Local by Flywheel
    dap.configurations.php = {
      {
        type = "php",
        request = "launch",
        name = "Listen for Xdebug (Local)",
        port = 9003,
        pathMappings = {
          ["/app/public"] = "${workspaceFolder}", -- Local by Flywheel mapping
        },
        hostname = "localhost",
        log = true, -- Enable logging for troubleshooting
        xdebugSettings = {
          max_children = 512,
          max_depth = 3,
        },
      },
    }

    -- DAP UI Auto-open/close
    dap.listeners.before.attach.dapui_config = function()
      dapui.open()
    end
    dap.listeners.before.launch.dapui_config = function()
      dapui.open()
    end
    dap.listeners.before.event_terminated.dapui_config = function()
      dapui.close()
    end
    dap.listeners.before.event_exited.dapui_config = function()
      dapui.close()
    end

    -- Keymaps
    vim.keymap.set("n", "<Leader>dt", ":DapToggleBreakpoint<CR>")
    vim.keymap.set("n", "<Leader>dc", ":DapContinue<CR>")
    vim.keymap.set("n", "<Leader>dx", ":DapTerminate<CR>")
    vim.keymap.set("n", "<Leader>do", ":DapStepOver<CR>")
    -- UI toggle commands
    vim.keymap.set("n", "<Leader>du", function()
      require("dapui").toggle()
    end)
    vim.keymap.set("n", "<Leader>dU", function()
      require("dapui").close()
    end)
  end,
}
