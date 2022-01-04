-----------------------------------------------------------
-- Plugin manager configuration file
-----------------------------------------------------------

-- Plugin manager: packer.nvim
-- https://github.com/wbthomason/packer.nvim

-- For information about installed plugins see the README
--- neovim-lua/README.md
--- https://github.com/brainfucksec/neovim-lua#readme


local cmd = vim.cmd
cmd [[packadd packer.nvim]]

local packer = require 'packer'

cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost packer.lua source <afile> | PackerSync
  augroup end
]])

-- Add packages
return packer.startup(function()
  use 'wbthomason/packer.nvim' -- packer can manage itself

  -- Colors
  use 'godlygeek/csapprox'
  use 'sainnhe/sonokai'

  -- Buffer / file browsing
  use 'duff/vim-bufonly'
  use 'qpkorr/vim-bufkill'
  use {
    'kyazdani42/nvim-tree.lua',
    requires = {
      'kyazdani42/nvim-web-devicons', -- optional, for file icon
    }
  }
  use { 'kevinhwang91/rnvimr' }

  -- Telescope / finding
  use {
    'nvim-telescope/telescope.nvim',
    requires = { {'nvim-lua/plenary.nvim'}, {'BurntSushi/ripgrep'} }
  }
  use {'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }
  use {'TC72/telescope-tele-tabby.nvim' }
  use {
    "AckslD/nvim-neoclip.lua",
    requires = {
      -- {'tami5/sqlite.lua', module = 'sqlite'},
      {'nvim-telescope/telescope.nvim'}
    },
    config = function()
      require('neoclip').setup()
    end
  }

  -- UI enhancements
  use 'szw/vim-maximizer'
  use {
    'nvim-lualine/lualine.nvim',
    requires = {'kyazdani42/nvim-web-devicons', opt = true}
  }
  use {
    "nanozuki/tabby.nvim",
    config = function() require("tabby").setup() end
  }

  -- general text editing, delimiter pairing
  use 'tpope/vim-surround'
  use 'tpope/vim-unimpaired'
  use 'tpope/vim-endwise'
  use 'tpope/vim-repeat'
  use 'vim-scripts/ReplaceWithRegister'

  -- commenting, auto-completion, general syntax
  use 'vim-scripts/tComment'

  -- Text selection
  use 'kana/vim-textobj-user'
  -- ar, ir
  use 'nelstrom/vim-textobj-rubyblock'
  -- aa, ia
  use 'vim-scripts/argtextobj.vim'
  -- ae, ie
  use 'kana/vim-textobj-entire'
  -- a/, i/, a?, i?
  use 'kana/vim-textobj-lastpat'
  -- al, il
  use 'kana/vim-textobj-line'
  -- ai, ii, aI, iI
  use 'kana/vim-textobj-indent'
  -- a_, i_
  use 'lucapette/vim-textobj-underscore'
  -- looser searching for text objects
  use 'paradigm/TextObjectify'

  -- Movement through camel case and snake case words
  use 'bkad/CamelCaseMotion'

  -- Session management
  use 'tpope/vim-obsession'

  -- git
  use { 'tpope/vim-fugitive' }
  use { 'lewis6991/gitsigns.nvim', requires = 'nvim-lua/plenary.nvim' }
  use { "akinsho/toggleterm.nvim" }
  use { 'rhysd/git-messenger.vim' }
  use { 'ruifm/gitlinker.nvim', requires = 'nvim-lua/plenary.nvim', }

  -- LSP / tree-sitter
  use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
  use { 'neovim/nvim-lspconfig' }
  use { 'p00f/nvim-ts-rainbow' }
  use {
    'SmiteshP/nvim-gps',
    requires = 'nvim-treesitter/nvim-treesitter',
    config = function() require('nvim-gps').setup() end
  }

  -- Formatting
  use { 'lukas-reineke/indent-blankline.nvim' }
  use { 'junegunn/vim-easy-align' }
end)
