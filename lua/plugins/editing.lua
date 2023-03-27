return {
  {
    "tpope/vim-surround",
    lazy = false,
    config = function()
      vim.g.surround_104 = "{{ \r }}" -- h - surround with handlebars {{ }}
    end,
  },

  {
    "andymass/vim-matchup",
    dependencies = "nvim-treesitter",
    lazy = false,
    config = function()
      vim.g.matchup_matchparen_offscreen = { ["method"] = "popup" } -- or 'status'
      vim.g.matchup_matchparen_enabled = 1
      vim.g.matchup_motion_enabled = 1
      vim.g.matchup_text_obj_enabled = 1
      vim.g.matchup_surround_enabled = 1
      vim.g.matchup_transmute_enabled = 0
      vim.g.matchup_delim_stopline = 1500
      vim.g.matchup_matchparen_timeout = 300
      vim.g.matchup_matchparen_insert_timeout = 60
      vim.g.matchup_matchparen_deferred = 1
      vim.g.matchup_matchparen_deferred_show_delay = 50
      vim.g.matchup_matchparen_deferred_hide_delay = 700

      require("nvim-treesitter.configs").setup({
        matchup = {
          enable = true, -- mandatory, false will disable the whole extension
          -- disable = { "c", "ruby" },  -- optional, list of language that will be disabled
          -- [options]
        },
      })
    end,
  },

  {
    "tpope/vim-unimpaired",
    lazy = false,
  },

  { "tpope/vim-repeat",                lazy = false },
  { "vim-scripts/ReplaceWithRegister", lazy = false },

  {
    "windwp/nvim-autopairs",
    config = function()
      local npairs = require("nvim-autopairs")
      local endwise = require("nvim-autopairs.ts-rule").endwise

      npairs.setup({
        disable_filetype = { "TelescopePrompt", "vim" },
        disable_in_macro = false,   -- disable when recording or executing a macro
        disable_in_visualblock = false, -- disable when insert after visual block mode
        ignored_next_char = string.gsub([[ [%w%%%'%[%"%.] ]], "%s+", ""),
        enable_moveright = true,
        enable_afterquote = true,     -- add bracket pairs after quote
        enable_check_bracket_line = true, --- check bracket in same line
        check_ts = false,
        map_bs = true,                -- map the <BS> key
        map_c_h = false,              -- Map the <C-h> key to delete a pair
        map_c_w = false,              -- map <c-w> to delete a pair if possible
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

  { "axelf4/vim-strip-trailing-whitespace", lazy = false },
  { "dhruvasagar/vim-table-mode",           ft = { "markdown" } },

  -- ar, ir
  { "nelstrom/vim-textobj-rubyblock",       ft = { "ruby" } },
  -- ae, ie
  { "kana/vim-textobj-entire",              dependencies = { "kana/vim-textobj-user" }, lazy = false },
  -- ai, ii, aI, iI
  { "kana/vim-textobj-indent",              dependencies = { "kana/vim-textobj-user" }, lazy = false },

  {
    "nvim-treesitter/nvim-treesitter-textobjects",
    dependencies = {
      "nvim-treesitter-textobjects",
      "nvim-treesitter/nvim-treesitter",
    },
    lazy = false,
    config = function()
      require("nvim-treesitter.configs").setup({
        textobjects = {
          select = {
            enable = true,
            -- Automatically jump forward to textobj, similar to targets.vim
            lookahead = true,
            keymaps = {
              -- You can use the capture groups defined in textobjects.scm
              ["af"] = "@function.outer",
              ["if"] = "@function.inner",
              ["ac"] = "@class.outer",
              ["ic"] = "@class.inner",
            },
          },
          move = {
            enable = true,
            set_jumps = true, -- whether to set jumps in the jumplist
            goto_next_start = {
              ["]m"] = "@function.outer",
              ["]]"] = "@class.outer",
            },
            goto_next_end = {
              ["]M"] = "@function.outer",
              ["]["] = "@class.outer",
            },
            goto_previous_start = {
              ["[m"] = "@function.outer",
              ["[["] = "@class.outer",
            },
            goto_previous_end = {
              ["[M"] = "@function.outer",
              ["[]"] = "@class.outer",
            },
          },
          lsp_interop = {
            enable = true,
            border = "none",
            peek_definition_code = {
              ["<leader>df"] = "@function.outer",
              ["<leader>dF"] = "@class.outer",
            },
          },
        },
      })
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
      { "ga",      "<Plug>(EasyAlign)",     mode = { "n" } },
      { "<Enter>", "<Plug>(LiveEasyAlign)", mode = { "v" } },
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
    "phaazon/hop.nvim",
    opts = {
      char2_fallback_key = "<CR>",
    },
    keys = {
      { "s",  "<cmd>HopChar2<CR>", mode = { "n" } },
      { "z",  "<cmd>HopChar2<CR>", mode = { "v" } },
      { "z",  "<cmd>HopChar2<CR>", mode = { "o" } },
      { "gl", "<cmd>HopLine<CR>",  mode = { "n" } },
      { "gw", "<cmd>HopWord<CR>",  mode = { "n" } },
    },
  },

  {
    "AckslD/nvim-neoclip.lua",
    dependencies = {
      { "tami5/sqlite.lua", module = "sqlite" },
      { "ibhagwan/fzf-lua" },
    },
    config = true,
  },

  {
    "windwp/nvim-spectre",
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
      { "<leader>S", "<cmd>lua require('spectre').open()<CR>",      mode = { "n" } },
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
      auto_enable = false,
    },
  },
}
