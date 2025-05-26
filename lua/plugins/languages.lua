return {
  { "Joorem/vim-haproxy" },
  { "stephpy/vim-yaml", ft = "yaml" },
  { "kchmck/vim-coffee-script", ft = "coffee" },
  { "slim-template/vim-slim", ft = "slim" },
  { "hashivim/vim-terraform", ft = "terraform" },
  { "towolf/vim-helm", ft = "helm" },
  { "martinda/Jenkinsfile-vim-syntax" },

  {
    "cuducos/yaml.nvim",
    ft = { "yaml" }, -- optional
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      -- "nvim-telescope/telescope.nvim", -- optional
    },
    keys = {
      { "<leader>yk", "<cmd>YAMLYankKey<CR>", mode = "n", { silent = false } }, -- yank yaml key
      { "<leader>yv", "<cmd>YAMLYankKey<CR>", mode = "n", { silent = false } }, -- yank yaml value
    },
  },

  {
    "seblyng/roslyn.nvim",
    ft = "cs",
    ---@module 'roslyn.config'
    ---@type RoslynNvimConfig
    opts = {
      -- your configuration comes here; leave empty for default settings
      -- NOTE: You must configure `cmd` in `config.cmd` unless you have installed via mason
    },
  },

  {
    "MeanderingProgrammer/render-markdown.nvim",
    dependencies = { "nvim-treesitter/nvim-treesitter", "echasnovski/mini.nvim" }, -- if you use the mini.nvim suite
    -- dependencies = { 'nvim-treesitter/nvim-treesitter', 'echasnovski/mini.icons' }, -- if you use standalone mini plugins
    -- dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-tree/nvim-web-devicons' }, -- if you prefer nvim-web-devicons
    ---@module 'render-markdown'
    ---@type render.md.UserConfig
    opts = {},
    config = {
      completions = { blink = { enabled = true } },
    },
  },
}
