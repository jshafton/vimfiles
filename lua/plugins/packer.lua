-----------------------------------------------------------
-- Plugin manager configuration file
-----------------------------------------------------------

-- Plugin manager: packer.nvim
-- https://github.com/wbthomason/packer.nvim

-- For information about installed plugins see the README
--- neovim-lua/README.md
--- https://github.com/brainfucksec/neovim-lua#readme


local cmd = vim.cmd

cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost packer.lua source <afile> | PackerSync
  augroup end
]])

-- Boostrap: install packer if not installed
local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
local packer_bootstrap = false
if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
  vim.o.runtimepath = vim.fn.stdpath('data') .. '/site/pack/*/start/*,' .. vim.o.runtimepath
end

-- Add packages
return require('packer').startup({function()
  use 'wbthomason/packer.nvim' -- packer can manage itself

  -- Colors
  use 'EdenEast/nightfox.nvim'

  -- Buffer / file browsing
  use 'duff/vim-bufonly'
  use 'qpkorr/vim-bufkill'
  use {
    'kyazdani42/nvim-tree.lua',
    requires = {
      'kyazdani42/nvim-web-devicons', -- optional, for file icon
    }
  }

  use { 'ibhagwan/fzf-lua',
    -- optional for icon support
    requires = { 'kyazdani42/nvim-web-devicons' }
  }
  use {
    "AckslD/nvim-neoclip.lua",
    requires = {
      {'tami5/sqlite.lua', module = 'sqlite'},
      {'ibhagwan/fzf-lua'}
    },
    config = function()
      require('neoclip').setup()
    end
  }
  use {
    'phaazon/hop.nvim',
    branch = 'v2', -- optional but strongly recommended
    config = function()
      -- you can configure Hop the way you like here; see :h hop-config
      require'hop'.setup {
        char2_fallback_key = '<CR>'
      }
    end
  }
  use 'romainl/vim-cool'

  -- UI enhancements
  use 'szw/vim-maximizer'
  use {
    'nvim-lualine/lualine.nvim',
    requires = {'kyazdani42/nvim-web-devicons', opt = true}
  }
  use {
    "nanozuki/tabby.nvim",
    config = function() require("tabby").setup({}) end
  }

  -- general text editing, delimiter pairing
  use 'tpope/vim-surround'
  use 'tpope/vim-unimpaired'
  use 'tpope/vim-repeat'
  use 'vim-scripts/ReplaceWithRegister'
  use 'windwp/nvim-autopairs'
  use 'axelf4/vim-strip-trailing-whitespace'
  use { 'dhruvasagar/vim-table-mode', ft = { 'markdown' } }

  -- commenting, auto-completion, general syntax
  use {
    'numToStr/Comment.nvim',
    config = function()
      require('Comment').setup()
    end
  }

  -- ar, ir
  use { 'nelstrom/vim-textobj-rubyblock', ft = { 'ruby' } }
  -- ae, ie
  use { 'kana/vim-textobj-entire', requires = 'kana/vim-textobj-user' }
  -- ai, ii, aI, iI
  use { 'kana/vim-textobj-indent', requires = 'kana/vim-textobj-user' }
  use { 'nvim-treesitter/nvim-treesitter-textobjects', requires = 'nvim-treesitter-textobjects' }
  -- https://github.com/wellle/targets.vim/blob/master/cheatsheet.md
  use 'wellle/targets.vim'

  -- Movement through camel case and snake case words
  use {
    'bkad/CamelCaseMotion',
    config = function()
      vim.cmd [[ call camelcasemotion#CreateMotionMappings('<leader>') ]]
    end
  }

  -- Session management
  use 'tpope/vim-obsession'

  -- git
  use { 'tpope/vim-fugitive' }
  use { 'tpope/vim-rhubarb' }
  use { 'lewis6991/gitsigns.nvim', requires = 'nvim-lua/plenary.nvim' }
  use { 'voldikss/vim-floaterm' }
  use { 'rhysd/git-messenger.vim' }
  use { 'ruifm/gitlinker.nvim', requires = 'nvim-lua/plenary.nvim', }

  -- LSP / tree-sitter
  use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
  use { 'neovim/nvim-lspconfig' }
  use {
    'jose-elias-alvarez/null-ls.nvim',
    requires = 'nvim-lua/plenary.nvim'
  }
  use { 'p00f/nvim-ts-rainbow' }
  use {
    'SmiteshP/nvim-gps',
    requires = 'nvim-treesitter/nvim-treesitter',
    config = function() require('nvim-gps').setup() end
  }
  use {
    "folke/trouble.nvim",
    requires = "kyazdani42/nvim-web-devicons"
  }
  use 'folke/lsp-colors.nvim'
  use {
    'WhoIsSethDaniel/toggle-lsp-diagnostics.nvim',
    config = function() require'toggle_lsp_diagnostics'.init() end
  }

  -- Snippets
  use { 'L3MON4D3/LuaSnip' }
  use { 'rafamadriz/friendly-snippets' }

  -- Completion
  use { 'hrsh7th/nvim-cmp' }
  use { 'hrsh7th/cmp-nvim-lsp',     requires = 'hrsh7th/nvim-cmp' }
  use { 'hrsh7th/cmp-buffer',       requires = 'hrsh7th/nvim-cmp' }
  use { 'hrsh7th/cmp-path',         requires = 'hrsh7th/nvim-cmp' }
  use { 'hrsh7th/cmp-cmdline',      requires = 'hrsh7th/nvim-cmp' }
  use { 'andersevenrud/cmp-tmux',   requires = 'hrsh7th/nvim-cmp' }
  use { 'saadparwaiz1/cmp_luasnip', requires = { 'L3MON4D3/LuaSnip', 'hrsh7th/nvim-cmp' } }
  -- Maybe:
  -- https://github.com/tzachar/cmp-fuzzy-buffer
  -- https://github.com/tzachar/cmp-fuzzy-path

  -- Formatting
  use 'lukas-reineke/indent-blankline.nvim'
  use 'junegunn/vim-easy-align'
  use 'tpope/vim-abolish'

  -- Specific languages
  use 'robbles/logstash.vim'
  use 'stephpy/vim-yaml'
  use 'pearofducks/ansible-vim'
  use 'zimbatm/haproxy.vim'
  use 'darfink/vim-plist'
  use 'kchmck/vim-coffee-script'
  use 'slim-template/vim-slim'
  use 'hashivim/vim-terraform'

  -- Look up stuff in Dash / the internets
  use 'Keithbsmiley/investigate.vim'

  -- open links in browser
  use 'tyru/open-browser.vim'

  -- random shell helper commands
  use 'tpope/vim-eunuch'

  -- window management
  use 'christoomey/vim-tmux-navigator'

  -- match parens and other pairs
  use { 'andymass/vim-matchup', after = 'nvim-treesitter' }

  -- undo tree
  use 'simnalamburt/vim-mundo'

  -- Bootstrap: Automatically set up your configuration after cloning
  -- packer.nvim Put this at the end after all plugins
  if packer_bootstrap then
    require('packer').sync()
  end
end,
config = {
  display = {
    open_fn = require('packer.util').float,
  }
}
})
