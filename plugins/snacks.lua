return {
  {
    "folke/snacks.nvim",
    priority = 1000,
    lazy = false,
    ---@type snacks.Config
    opts = {
      bigfile = {
        enabled = true,
        notify = true, -- show notification when big file detected
        size = 1.5 * 1024 * 1024, -- 1.5MB
        line_length = 1000, -- average line length (useful for minified files)
        -- Enable or disable features when big file detected
        ---@param ctx {buf: number, ft:string}
        setup = function(ctx)
          if vim.fn.exists(":NoMatchParen") ~= 0 then
            vim.cmd([[NoMatchParen]])
          end
          Snacks.util.wo(0, { foldmethod = "manual", statuscolumn = "", conceallevel = 0 })
          vim.b.minianimate_disable = true
          vim.schedule(function()
            if vim.api.nvim_buf_is_valid(ctx.buf) then
              vim.bo[ctx.buf].syntax = ctx.ft
            end
          end)
        end,
      },
      dashboard = { enabled = true },
      indent = { enabled = true },
      input = {
        enabled = true,
        icon = " ",
        icon_hl = "SnacksInputIcon",
        icon_pos = "left",
        prompt_pos = "title",
        win = { style = "input" },
        expand = true,
      },
      notifier = {
        enabled = true,
        timeout = 3000,
      },
      picker = { enabled = true },
      quickfile = { enabled = true },
      scope = {
        enabled = true,
        min_size = 2,
        -- try to expand the scope to this size
        max_size = nil,
        cursor = true, -- when true, the column of the cursor is used to determine the scope
        edge = true, -- include the edge of the scope (typically the line above and below with smaller indent)
        siblings = false, -- expand single line scopes with single line siblings
        -- what buffers to attach to
        filter = function(buf)
          return vim.bo[buf].buftype == "" and vim.b[buf].snacks_scope ~= false and vim.g.snacks_scope ~= false
        end,
        -- debounce scope detection in ms
        debounce = 30,
        treesitter = {
          -- detect scope based on treesitter.
          -- falls back to indent based detection if not available
          enabled = true,
          injections = true, -- include language injections when detecting scope (useful for languages like `vue`)
          ---@type string[]|{enabled?:boolean}
          blocks = {
            enabled = false, -- enable to use the following blocks
            "function_declaration",
            "function_definition",
            "method_declaration",
            "method_definition",
            "class_declaration",
            "class_definition",
            "do_statement",
            "while_statement",
            "repeat_statement",
            "if_statement",
            "for_statement",
          },
          -- these treesitter fields will be considered as blocks
          field_blocks = {
            "local_declaration",
          },
        },
        -- These keymaps will only be set if the `scope` plugin is enabled.
        -- Alternatively, you can set them manually in your config,
        -- using the `Snacks.scope.textobject` and `Snacks.scope.jump` functions.
        keys = {
          ---@type table<string, snacks.scope.TextObject|{desc?:string}>
          textobject = {
            ii = {
              min_size = 2, -- minimum size of the scope
              edge = false, -- inner scope
              cursor = false,
              treesitter = { blocks = { enabled = false } },
              desc = "inner scope",
            },
            ai = {
              cursor = false,
              min_size = 2, -- minimum size of the scope
              treesitter = { blocks = { enabled = false } },
              desc = "full scope",
            },
          },
          ---@type table<string, snacks.scope.Jump|{desc?:string}>
          jump = {
            ["[i"] = {
              min_size = 1, -- allow single line scopes
              bottom = false,
              cursor = false,
              edge = true,
              treesitter = { blocks = { enabled = false } },
              desc = "jump to top edge of scope",
            },
            ["]i"] = {
              min_size = 1, -- allow single line scopes
              bottom = true,
              cursor = false,
              edge = true,
              treesitter = { blocks = { enabled = false } },
              desc = "jump to bottom edge of scope",
            },
          },
        },
      },
      -- scroll = {
      --   enabled = true,
      --   animate = {
      --     duration = { step = 15, total = 250 },
      --     easing = "linear",
      --   },
      --   -- faster animation when repeating scroll after delay
      --   animate_repeat = {
      --     delay = 100, -- delay in ms before using the repeat animation
      --     duration = { step = 5, total = 50 },
      --     easing = "linear",
      --   },
      --   -- what buffers to animate
      --   filter = function(buf)
      --     return vim.g.snacks_scroll ~= false
      --       and vim.b[buf].snacks_scroll ~= false
      --       and vim.bo[buf].buftype ~= "terminal"
      --   end,
      -- },
      statuscolumn = { enabled = true },
      words = {
        enabled = true,
        debounce = 200, -- time in ms to wait before updating
        notify_jump = false, -- show a notification when jumping
        notify_end = true, -- show a notification when reaching the end
        foldopen = true, -- open folds after jumping
        jumplist = true, -- set jump point before jumping
        modes = { "n", "i", "c" }, -- modes to show references
        filter = function(buf) -- what buffers to enable `snacks.words`
          return vim.g.snacks_words ~= false and vim.b[buf].snacks_words ~= false
        end,
      },
    },
    init = function()
      vim.api.nvim_create_autocmd("User", {
        pattern = "VeryLazy",
        callback = function()
          -- Setup some globals for debugging (lazy-loaded)
          _G.dd = function(...)
            Snacks.debug.inspect(...)
          end
          _G.bt = function()
            Snacks.debug.backtrace()
          end
          vim.print = _G.dd -- Override print to use snacks for `:=` command

          -- Create some toggle mappings
          Snacks.toggle.option("spell", { name = "Spelling" }):map("<leader>us")
          Snacks.toggle.option("wrap", { name = "Wrap" }):map("<leader>uw")
          Snacks.toggle.option("relativenumber", { name = "Relative Number" }):map("<leader>uL")
          Snacks.toggle.diagnostics():map("<leader>ud")
          Snacks.toggle.line_number():map("<leader>ul")
          Snacks.toggle
            .option("conceallevel", { off = 0, on = vim.o.conceallevel > 0 and vim.o.conceallevel or 2 })
            :map("<leader>uc")
          Snacks.toggle.treesitter():map("<leader>uT")
          Snacks.toggle.option("background", { off = "light", on = "dark", name = "Dark Background" }):map("<leader>ub")
          Snacks.toggle.inlay_hints():map("<leader>uh")
          Snacks.toggle.indent():map("<leader>ug")
          Snacks.toggle.dim():map("<leader>uD")
        end,
      })
    end,
  },
}
