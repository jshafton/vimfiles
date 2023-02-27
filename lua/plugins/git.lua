return {
  {
    'tpope/vim-fugitive',
    keys = {
      { '<leader>gs',   '<cmd>Git<CR>' },
      { '<leader>gc',   '<cmd>Git commit<CR>' },
      { '<leader>gca',  '<cmd>Git commit --amend<CR>' },
      { '<leader>gb',   '<cmd>Git blame<CR>' },
      { '<leader>gd',   '<cmd>Gdiffsplit<CR>' },
      { '<leader>gr',   '<cmd>Gread<CR>' },
      { '<leader>grm',  '<cmd>Gread master:%<CR>' },
      { '<leader>gw',   '<cmd>Gwrite<CR>' },
      { '<leader>gl',   '<cmd>BCommits<CR>' },
      { '<leader>gL',   '<cmd>lua require("plugins/nvim-telescope-functions").git_bcommits()<CR>' },
      { '<leader>gp',   '<cmd>Git push<CR>' },
      { '<leader>gpf',  '<cmd>Git push --force<CR>' },
      { '<leader>gpsu', '<cmd>! git push -u origin $(git rev-parse --abbrev-ref HEAD)<CR>' },
      { '<leader>grb',  '<cmd>! git pull --rebase<CR>' },
      { '<leader>ga',   '<cmd>! git add .<CR> " adds everything to the index' },
      { '<leader>grh',  '<cmd>! git reset .<CR> " git reset head -- unstages everything' },
      { '<leader>gpr',  '<cmd>! git push -u origin $(git rev-parse --abbrev-ref HEAD) && hub pull-request --no-edit -o<CR>' }, -- git 'pull request' to finish up a PR
    }
  },

  { 'tpope/vim-rhubarb' },

  {
    'lewis6991/gitsigns.nvim',
    lazy = false,
    dependencies = 'nvim-lua/plenary.nvim',
    opts = {
      signs = {
        add          = {hl = 'GitSignsAdd'   , text = '│', numhl='GitSignsAddNr'   , linehl='GitSignsAddLn'},
        change       = {hl = 'GitSignsChange', text = '│', numhl='GitSignsChangeNr', linehl='GitSignsChangeLn'},
        delete       = {hl = 'GitSignsDelete', text = '_', numhl='GitSignsDeleteNr', linehl='GitSignsDeleteLn'},
        topdelete    = {hl = 'GitSignsDelete', text = '‾', numhl='GitSignsDeleteNr', linehl='GitSignsDeleteLn'},
        changedelete = {hl = 'GitSignsChange', text = '~', numhl='GitSignsChangeNr', linehl='GitSignsChangeLn'},
      },
      signcolumn = true,  -- Toggle with `:Gitsigns toggle_signs`
      numhl      = false, -- Toggle with `:Gitsigns toggle_numhl`
      linehl     = false, -- Toggle with `:Gitsigns toggle_linehl`
      word_diff  = false, -- Toggle with `:Gitsigns toggle_word_diff`
      keymaps = {
        -- Default keymap options
        noremap = true,

        ['n ]c'] = { expr = true, "&diff ? ']c' : '<cmd>Gitsigns next_hunk<CR>'"},
        ['n [c'] = { expr = true, "&diff ? '[c' : '<cmd>Gitsigns prev_hunk<CR>'"},

        ['n <leader>hs'] = '<cmd>Gitsigns stage_hunk<CR>',
        ['v <leader>hs'] = ':Gitsigns stage_hunk<CR>',
        ['n <leader>hu'] = '<cmd>Gitsigns undo_stage_hunk<CR>',
        ['n <leader>hr'] = '<cmd>Gitsigns reset_hunk<CR>',
        ['v <leader>hr'] = ':Gitsigns reset_hunk<CR>',
        ['n <leader>hR'] = '<cmd>Gitsigns reset_buffer<CR>',
        ['n <leader>hp'] = '<cmd>Gitsigns preview_hunk<CR>',
        ['n <leader>hb'] = '<cmd>lua require"gitsigns".blame_line{full=true}<CR>',
        ['n <leader>hS'] = '<cmd>Gitsigns stage_buffer<CR>',
        ['n <leader>hU'] = '<cmd>Gitsigns reset_buffer_index<CR>',

        -- Text objects
        ['o ih'] = ':<C-U>Gitsigns select_hunk<CR>',
        ['x ih'] = ':<C-U>Gitsigns select_hunk<CR>'
      },
      watch_gitdir = {
        interval = 1000,
        follow_files = true
      },
      attach_to_untracked = true,
      current_line_blame = false, -- Toggle with `:Gitsigns toggle_current_line_blame`
      current_line_blame_opts = {
        virt_text = false,
        virt_text_pos = 'eol', -- 'eol' | 'overlay' | 'right_align'
        delay = 750,
        ignore_whitespace = false,
      },
      current_line_blame_formatter_opts = {
        relative_time = false
      },
      sign_priority = 6,
      update_debounce = 100,
      status_formatter = nil, -- Use default
      max_file_length = 40000,
      preview_config = {
        -- Options passed to nvim_open_win
        border = 'single',
        style = 'minimal',
        relative = 'cursor',
        row = 0,
        col = 1
      },
      yadm = {
        enable = false
      },
    }
  },

  {
    'voldikss/vim-floaterm',
    keys = {
      { '-',          '<cmd>FloatermNew --height=0.8 --width=0.8 vifm<CR>' },
      { '<leader>gz', '<cmd>FloatermNew --height=0.8 --width=0.8 lazygit<CR>' },
    }
  },

  {
    'rhysd/git-messenger.vim',
    keys = {
      { '<space>g', '<cmd>GitMessenger<CR>' }
    },
    init = function()
      vim.g.git_messenger_no_default_mappings = true
      vim.g.git_messenger_include_diff        = "curent"
      vim.g.git_messenger_always_into_popup   = true
    end
  },

  {
    'ruifm/gitlinker.nvim',
    keys = {
      { '<leader>gy', '<cmd>lua require("gitlinker").get_buf_range_url("n")<CR>',      "n", { silent = false }}, -- copy github link
      { '<leader>gy', '<cmd>lua require("gitlinker").get_buf_range_url("v")<CR><ESC>', "v", { silent = false }}  -- copy github link
    },
    dependencies = 'nvim-lua/plenary.nvim', }
  }
