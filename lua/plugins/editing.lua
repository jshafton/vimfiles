return {
  {
    "kylechui/nvim-surround",
    version = "*", -- Use for stability; omit to use `main` branch for the latest features
    event = "VeryLazy",
    config = function()
      require("nvim-surround").setup({
        surrounds = {
          ["h"] = {
            add = { "{{", "}}" },
            find = "{{.-}}",
            delete = "^({{)().-(}})()$",
          },
        }, -- Defines surround keys and behavior
      })
    end,
  },

  {
    "tpope/vim-unimpaired",
    lazy = false,
  },

  { "tpope/vim-repeat",           lazy = false },
  {
    "vim-scripts/ReplaceWithRegister",
    lazy = false,
    config = function()
      -- Unmap the default gr mappings after the plugin loads
      vim.keymap.del("n", "grn")
      vim.keymap.del("n", "gra")
      vim.keymap.del("n", "gri")
    end,
  },

  {
    "windwp/nvim-autopairs",
    config = function()
      local npairs = require("nvim-autopairs")
      local endwise = require("nvim-autopairs.ts-rule").endwise

      npairs.setup({
        disable_filetype = { "TelescopePrompt", "vim" },
        disable_in_macro = false,       -- disable when recording or executing a macro
        disable_in_visualblock = false, -- disable when insert after visual block mode
        ignored_next_char = string.gsub([[ [%w%%%'%[%"%.] ]], "%s+", ""),
        enable_moveright = true,
        enable_afterquote = true,         -- add bracket pairs after quote
        enable_check_bracket_line = true, --- check bracket in same line
        check_ts = false,
        map_bs = true,                    -- map the <BS> key
        map_c_h = false,                  -- Map the <C-h> key to delete a pair
        map_c_w = false,                  -- map <c-w> to delete a pair if possible
        map_cr = true,
        map_complete = true,
      })

      -- Built-in endwise rules
      npairs.add_rules(require("nvim-autopairs.rules.endwise-lua"))
      npairs.add_rules(require("nvim-autopairs.rules.endwise-ruby"))

      -- Bash endwise rules
      npairs.add_rules({
        endwise("if%s.+then$", "fi", "sh", nil),
        endwise("%sif%s.+then$", "fi", "sh", nil),
        endwise("case%s.+$", "esac", "sh", nil),
        endwise("%scase%s.+$", "esac", "sh", nil),
        endwise("%sdo$", "done", "sh", nil),
      })
    end,
    lazy = false,
  },

  -- { "axelf4/vim-strip-trailing-whitespace", lazy = false },
  { "dhruvasagar/vim-table-mode", ft = { "markdown" } },

  -- ar, ir
  -- { "nelstrom/vim-textobj-rubyblock", ft = { "ruby" } },
  -- https://github.com/chrisgrieser/nvim-various-textobjs?tab=readme-ov-file#list-of-text-objects
  {
    "chrisgrieser/nvim-various-textobjs",
    opts = {
      keymaps = {
        useDefaults = true,
        disabledDefaults = { "gG" },
      },
    },
    keys = {
      { "ie", "<cmd>lua require('various-textobjs').entireBuffer()<CR>", mode = { "o", "x" } },
    },
    lazy = false,
  },
  {
    "nvim-treesitter/nvim-treesitter-textobjects",
    branch = "main",
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
    },
    lazy = false,
    config = function()
      local select = require("nvim-treesitter-textobjects.select")
      local move = require("nvim-treesitter-textobjects.move")

      require("nvim-treesitter-textobjects").setup({
        select = {
          lookahead = true,
        },
        move = {
          set_jumps = true,
        },
      })

      -- Select textobjects
      local select_maps = {
        ["af"] = "@function.outer",
        ["if"] = "@function.inner",
        ["ac"] = "@class.outer",
        ["ic"] = "@class.inner",
        ["ar"] = "@block.outer",
        ["ir"] = "@block.inner",
      }
      for key, query in pairs(select_maps) do
        vim.keymap.set({ "x", "o" }, key, function()
          select.select_textobject(query, "textobjects")
        end)
      end

      -- Move: goto next
      local next_start = {
        ["]m"] = "@function.outer",
        ["]]"] = "@class.outer",
        ["]r"] = "@block.outer",
      }
      for key, query in pairs(next_start) do
        vim.keymap.set({ "n", "x", "o" }, key, function()
          move.goto_next_start(query, "textobjects")
        end)
      end

      local next_end = {
        ["]M"] = "@function.outer",
        ["]["] = "@class.outer",
        ["]R"] = "@block.outer",
      }
      for key, query in pairs(next_end) do
        vim.keymap.set({ "n", "x", "o" }, key, function()
          move.goto_next_end(query, "textobjects")
        end)
      end

      -- Move: goto previous
      local prev_start = {
        ["[m"] = "@function.outer",
        ["[["] = "@class.outer",
        ["[r"] = "@block.outer",
      }
      for key, query in pairs(prev_start) do
        vim.keymap.set({ "n", "x", "o" }, key, function()
          move.goto_previous_start(query, "textobjects")
        end)
      end

      local prev_end = {
        ["[M"] = "@function.outer",
        ["[]"] = "@class.outer",
        ["[R"] = "@block.outer",
      }
      for key, query in pairs(prev_end) do
        vim.keymap.set({ "n", "x", "o" }, key, function()
          move.goto_previous_end(query, "textobjects")
        end)
      end
    end,
  },

  -- https://github.com/wellle/targets.vim/blob/master/cheatsheet.md
  { "wellle/targets.vim", lazy = false },

  -- Movement through camel case and snake case words
  {
    "bkad/CamelCaseMotion",
    config = function()
      vim.cmd([[ call camelcasemotion#CreateMotionMappings('<leader>') ]])
    end,
    lazy = false,
  },

  {
    "junegunn/vim-easy-align",
    keys = {
      { "g=", "<Plug>(EasyAlign)",     mode = { "n" } },
      { "g=", "<Plug>(LiveEasyAlign)", mode = { "v" } },
    },
    cmd = {
      "EasyAlign",
      "LiveEasyAlign",
    },
  },

  {
    "tpope/vim-abolish",
    cmd = {
      "S",
      "Subvert",
    },
    lazy = false,
  },

  { "tpope/vim-eunuch",   lazy = false },

  {
    "simnalamburt/vim-mundo",
    keys = {
      { "F5", "<call>MundoToggle<CR>" },
    },
    cmd = "MundoToggle",
  },

  {
    "nvim-pack/nvim-spectre",
    config = true,
    opts = {
      mapping = {
        ["send_to_qf"] = {
          map = "<C-q>",
          cmd = "<cmd>lua require('spectre.actions').send_to_qf()<CR>",
          desc = "send all item to quickfix",
        },
      },
    },
    keys = {
      { "<leader>r", "<cmd>lua require('spectre').open_file_search({select_word=true})<CR>", mode = { "n" } },
      { "<leader>R", "<cmd>lua require('spectre').open_visual({select_word=true})<CR>",      mode = { "n" } },
      { "<leader>S", "<cmd>lua require('spectre').open()<CR>",                               mode = { "n" } },
    },
  },

  {
    "MagicDuck/grug-far.nvim",
    opts = {
      keymaps = {
        replace = { n = "gr" },
        qflist = { n = "gq" },
        syncLocations = { n = "gs" },
        syncLine = { n = "gl" },
        close = { n = "gc" },
        historyOpen = { n = "gt" },
        historyAdd = { n = "ga" },
        refresh = { n = "gf" },
        gotoLocation = { n = "<enter>" },
        pickHistoryEntry = { n = "<enter>" },
      },
    },
  },

  {
    "gabrielpoca/replacer.nvim",
  },

  {
    "kevinhwang91/nvim-bqf",
    ft = "qf",
    dependencies = {
      "junegunn/fzf",
      "junegunn/fzf.vim",
    },
    opts = {
      auto_enable = true,
    },
  },

  {
    "johmsalas/text-case.nvim",
    config = true,
  },

  {
    "sk1418/Join",
  },

  {
    "stevearc/conform.nvim",
    event = { "BufWritePre" },
    cmd = { "ConformInfo" },
    keys = {
      {
        "<space>f",
        function()
          require("conform").format({ async = true, timeout_ms = 1000, lsp_fallback = true })
        end,
        mode = "",
        desc = "Format buffer",
      },
      { "<leader>tf", "<cmd>ToggleFormat<CR>" },
    },
    -- Everything in opts will be passed to setup()
    opts = {
      -- Define your formatters
      formatters_by_ft = {
        lua = { "stylua" },
        python = { "isort", "black" },
        javascript = { "prettierd", "prettier" },
        sh = { "shfmt", "shellcheck" },
        terraform = { "terraform_fmt" },
        packer = { "packerfmt" },
        hcl = { "hclfmt" },
        yaml = { "yamlfmt" },
        ruby = { "rubocop" },
        sql = { "sqlfluff" },
        ["_"] = { "trim_whitespace" },
      },
      -- Set up format-on-save
      format_on_save = function(bufnr)
        -- Stop if we disabled auto-formatting.
        if not vim.g.autoformat then
          return nil
        end

        -- Disable autoformat on certain filetypes
        local ignore_filetypes = { "dockerfile", "yaml", "yaml.ansible" }
        if vim.tbl_contains(ignore_filetypes, vim.bo[bufnr].filetype) then
          return
        end
        -- Disable with a global or buffer-local variable
        if vim.g.disable_autoformat or vim.b[bufnr].disable_autoformat then
          return
        end

        return { timeout_ms = 1000, lsp_fallback = true }
      end,
      -- Customize formatters
      formatters = {
        shfmt = {
          prepend_args = { "-i", "2" },
        },
        hclfmt = {
          command = "terraform",
          args = { "fmt", "-" },
        },
        packerfmt = {
          command = "packer",
          args = { "fmt", "-" },
        },
        stylua = {
          prepend_args = { "--indent-type", "Spaces", "--indent-width", "2" },
        },
        sqlfluff = {
          command = "sqlfluff",
          args = { "format", "--dialect=postgres", "-" },
          stdin = true,
          cwd = function(_, ctx)
            -- Look for SQLFluff config files in project root
            local root_patterns = { ".sqlfluff", ".sqlfluffignore", "pyproject.toml", "setup.cfg" }
            local path = ctx.dirname

            while path and path ~= "/" do
              for _, pattern in ipairs(root_patterns) do
                if vim.fn.filereadable(path .. "/" .. pattern) == 1 then
                  return path
                end
              end
              path = vim.fn.fnamemodify(path, ":h")
            end

            return ctx.dirname
          end,
          -- Exit codes that indicate success
          exit_codes = { 0, 1 }, -- SQLFluff returns 1 when it makes changes
        },
      },
    },
    init = function()
      -- If you want the formatexpr, here is the place to set it
      vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"

      vim.api.nvim_create_user_command("ToggleFormat", function()
        vim.g.autoformat = not vim.g.autoformat
        vim.notify(
          string.format("%s formatting...", vim.g.autoformat and "Enabling" or "Disabling"),
          vim.log.levels.INFO
        )
      end, { desc = "Toggle conform.nvim auto-formatting", nargs = 0 })

      -- Start auto-formatting by default (and disable with my ToggleFormat command).
      vim.g.autoformat = true
    end,
  },

  {
    "andymass/vim-matchup",
    event = "BufReadPost",
    config = function()
      vim.g.matchup_matchparen_offscreen = { method = "popup" }
      vim.g.matchup_treesitter_enabled = true
    end,
  },

  {
    "RRethy/nvim-treesitter-endwise",
  },
}
