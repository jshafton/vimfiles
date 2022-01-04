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
return packer.startup({function()
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
  use {
    'phaazon/hop.nvim',
    branch = 'v1', -- optional but strongly recommended
    config = function()
      -- you can configure Hop the way you like here; see :h hop-config
      require'hop'.setup {
        char2_fallback_key = '<CR>'
      }
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
  use 'windwp/nvim-autopairs'
  use 'axelf4/vim-strip-trailing-whitespace'

  -- commenting, auto-completion, general syntax
  use 'numToStr/Comment.nvim'

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

  -- Completion
  use { 'ms-jpq/coq_nvim', branch = 'coq', run = ':COQdeps' }
  -- use { 'hrsh7th/nvim-cmp' }
  -- use { 'hrsh7th/cmp-nvim-lsp',  requires = 'hrsh7th/nvim-cmp' }
  -- use { 'hrsh7th/cmp-buffer',    requires = 'hrsh7th/nvim-cmp' }
  -- use { 'hrsh7th/cmp-path',      requires = 'hrsh7th/nvim-cmp' }
  -- use { 'hrsh7th/cmp-cmdline',   requires = 'hrsh7th/nvim-cmp' }

  -- Formatting
  use { 'lukas-reineke/indent-blankline.nvim' }
  use { 'junegunn/vim-easy-align' }
  use { 'tpope/vim-abolish' }

  -- Coding, syntax highlighting
  use { 'pearofducks/ansible-vim',
    setup = function()
      vim.g.ansible_unindent_after_newline = 1
      vim.g.ansible_yamlKeyName = 'yamlKey'
      vim.g.ansible_attribute_highlight = "ab"
      vim.g.ansible_name_highlight = 'd'
      vim.g.ansible_extra_keywords_highlight = 1
      vim.g.ansible_extra_keywords_highlight_group = 'Structure'
      vim.g.ansible_normal_keywords_highlight = 'Structure'
      vim.g.ansible_loop_keywords_highlight = 'Constant'
      -- vim.g.ansible_template_syntaxes = { '*.rb.j2' = 'ruby' }
      vim.g.ansible_ftdetect_filename_regex = '(configure_|defaults|vars|files|templates|handlers|meta).*\\.ya?ml$'
    end
  }

  -- open links in browser
  use 'tyru/open-browser.vim'

  -- random shell helper commands
  use 'tpope/vim-eunuch'

  -- window management
  use 'christoomey/vim-tmux-navigator'
end,
config = {
  display = {
    open_fn = require('packer.util').float,
  }
}
})
