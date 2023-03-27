return {
  {
    "szw/vim-maximizer",
    keys = {
      { "<leader>f", "<cmd>MaximizerToggle<CR>",   "n" },
      { "<leader>f", "<cmd>MaximizerToggle<CR>gv", "v" },
    },
    config = function()
      vim.g.maximizer_set_default_mapping = 0
    end,
  },

  {
    "numToStr/Navigator.nvim",
    keys = {
      { "<C-h>", "<cmd>NavigatorLeft<CR>",  "n" },
      { "<C-l>", "<cmd>NavigatorRight<CR>", "n" },
      { "<C-k>", "<cmd>NavigatorUp<CR>",    "n" },
      { "<C-j>", "<cmd>NavigatorDown<CR>",  "n" },
    },
    config = true,
  },

  {
    "lukas-reineke/indent-blankline.nvim",
    opts = {
      show_current_context = true,
      show_current_context_start = false,
      filetype_exclude = { "NvimTree", "help", "packer" },
      use_treesitter = true,
    },
  },

  {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = {
      options = {
        icons_enabled = true,
        theme = "auto",
        -- component_separators = { left = '', right = ''},
        -- section_separators = { left = '', right = ''},
        section_separators = { left = "", right = "" },
        component_separators = { left = "", right = "" },
        disabled_filetypes = {},
        always_divide_middle = false,
      },
      sections = {
        lualine_a = { "mode" },
        lualine_b = { "branch", "diff", "diagnostics" },
        lualine_c = {
          {
            "filename",
            file_status = true, -- Displays file status (readonly status, modified status)
            path = 1,     -- 0: Just the filename
            -- 1: Relative path
            -- 2: Absolute path

            shorting_target = 40, -- Shortens path to leave 40 spaces in the window
            symbols = {
              modified = "[+]", -- Text to show when the file is modified.
              readonly = "[-]", -- Text to show when the file is non-modifiable or readonly.
              unnamed = "[No Name]", -- Text to show for unnamed buffers.
            },
          },
        },
        lualine_x = { "filetype" },
        lualine_y = { "progress" },
        -- lualine_z = {'location'}
        lualine_z = {},
      },
      inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = {
          {
            "filename",
            file_status = true, -- Displays file status (readonly status, modified status)
            path = 1,     -- 0: Just the filename
            -- 1: Relative path
            -- 2: Absolute path

            shorting_target = 40, -- Shortens path to leave 40 spaces in the window
            symbols = {
              modified = "[+]", -- Text to show when the file is modified.
              readonly = "[-]", -- Text to show when the file is non-modifiable or readonly.
              unnamed = "[No Name]", -- Text to show for unnamed buffers.
            },
          },
        },
        lualine_x = { "location" },
        lualine_y = {},
        lualine_z = {},
      },
      tabline = {},
      extensions = { "fugitive", "neo-tree", "fzf" },
    },
  },

  {
    "nanozuki/tabby.nvim",
    config = true,
    lazy = false,
    keys = {
      { "<leader>tr", ":TabRename ", { silent = false } },
    },
  },

  {
    "duff/vim-bufonly",
    keys = {
      { "<leader>co", "<cmd>BufOnly!<CR>" },
    },
  },

  {
    "qpkorr/vim-bufkill",
    lazy = false,
    keys = {
      { "<C-x>", "<cmd>BW!<CR>" },
    },
  },

  { "romainl/vim-cool" },

  {
    "tyru/open-browser.vim",
    keys = {
      { "gx", "<Plug>(openbrowser-open)",         mode = { "n" }, { silent = false } },
      { "gx", "<Plug>(openbrowser-open)",         mode = { "v" }, { silent = false } },
      { "gs", "<Plug>(openbrowser-smart-search)", mode = { "v" }, { silent = false } },
    },
  },

  {
    "Keithbsmiley/investigate.vim",
    config = function()
      vim.g.investigate_use_dash = true
    end,
    lazy = false,
  },

  {
    "folke/which-key.nvim",
    config = function()
      vim.o.timeout = true
      vim.o.timeoutlen = 300
      require("which-key").setup({
        -- your configuration comes here
        -- or leave it empty to use the default settings
        -- refer to the configuration section below
      })
    end,
  },
}
