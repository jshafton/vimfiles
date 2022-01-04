-----------------------------------------------------------
-- Keymaps configuration file: keymaps of neovim
-- and plugins.
-----------------------------------------------------------

local map = vim.api.nvim_set_keymap
local default_opts = { noremap = true, silent = true }
local cmd = vim.cmd -- execute Vim commands

-----------------------------------------------------------
-- Neovim shortcuts:
-----------------------------------------------------------

-- source this file
map('n', '<F5>', ':source %<CR>', { silent = false })

-- get out of insert mode
map('i', 'jk', '<Esc>', { noremap = true })
map('i', 'JK', '<Esc>', { noremap = true })

-- use H to go to begin of line and L to go to end of line
map('', 'H', '^', default_opts)
map('', 'L', 'g_', default_opts)

-- move around splits using Ctrl + {h,j,k,l}
map('n', '<C-h>', '<C-w>h', default_opts)
map('n', '<C-j>', '<C-w>j', default_opts)
map('n', '<C-k>', '<C-w>k', default_opts)
map('n', '<C-l>', '<C-w>l', default_opts)

-- easy save
map('n', 'S', '<cmd>w<CR>', default_opts)
map('n', 'ß', '<cmd>w<CR>', default_opts) -- alt-s

-- easy window quit
map('n', '<leader>q', '<cmd>q<CR>', default_opts)

-- full quit
map('n', 'X', '<cmd>qall!<CR>', default_opts)

-- easy buffer wipe
map('n', '<C-x>', '<cmd>BW!<CR>', { noremap = true })

-- easy splits
map('n', '<bar>', '<cmd>vsplit<CR><C-W><C-L>', default_opts)
map('n', '_',     '<cmd>split<CR><C-W><C-J>', default_opts)

-- close other buffers "close others"
map('n', '<leader>co', '<cmd>BufOnly!<CR>', { noremap = true })

-- tabs
map('n', 'J',  '<cmd>tabprevious<CR>', default_opts)
map('n', 'K',  '<cmd>tabnext<CR>', default_opts)
map('n', 'g1', '1gt', default_opts)
map('n', 'g2', '2gt', default_opts)
map('n', 'g3', '3gt', default_opts)
map('n', 'g4', '4gt', default_opts)
map('n', 'g5', '5gt', default_opts)
map('n', 'g6', '6gt', default_opts)

-- paste intelligently by default
map('', 'p', 'pv`]=`]', { noremap = false })
map('', 'P', 'Pv`]=`]', { noremap = false })

-- option p/P to paste raw
map('n', 'π', 'p', default_opts)
map('n', '∏', 'P', default_opts)

-- yank to end of line
map('n', 'Y', 'y$', { noremap = false })
-- in visual mode Y selects to clipboard
map('x', 'Y', '"*y"', default_opts)

-- use CTRL-v to paste in insert mode
vim.opt.pastetoggle = '<F10>'
map('i', '<C-v>', '<F10><C-r>*<F10>', default_opts)

-- visually select the text that was last edited/pasted
map('n', 'gV', '`[v`]', default_opts)
map('n', '<leader>v', 'gv', default_opts)

-- textmate-like indentation
map('n', '≤', '<<', default_opts)
map('n', '≥', '>>', default_opts)
map('v', '≤', '<gv', default_opts)
map('v', '≥', '>gv', default_opts)

-- expand %% to full directory path in command line
map('c', '%%', '<C-R>=expand(\'%:h\').\'/\'<CR>', { silent = false })

-- copy current file path to the system clipboard
map('n', '<leader>cfp', '<cmd>let @* = expand("%")<CR>', default_opts)

-- try to center focus on movement
map('n', 'n',  'nzz', default_opts)
map('n', 'N',  'Nzz', default_opts)
map('n', '*',  '*zz', default_opts)
map('n', 'g;', 'g;zz', default_opts)
map('n', '}',  '}zz', default_opts)
map('n', '{',  '{zz', default_opts)

-- use . to repeat last command over a visual range
map('v', '.', '<cmd>normal .<CR>', default_opts)
-- use the @q macro over a visual range
map('v', '@q', '<cmd>normal @q<CR>', default_opts)

-- easy window focus (closes all others)
map('n', '<Leader>F', '<C-W>o', default_opts)

-----------------------------------------------------------
-- Plugin shortcuts:
-----------------------------------------------------------

-- vim-maximizer
map('n', '<leader>f', '<cmd>MaximizerToggle<CR>', default_opts)
map('v', '<leader>f', '<cmd>MaximizerToggle<CR>gv', default_opts)

-- nvim-tree
map('n', 'gnt', '<cmd>NvimTreeToggle<CR>', default_opts)
map('n', 'gnf', '<cmd>NvimTreeFindFile<CR>', default_opts)

-- rnvimr
map('n', '-', '<cmd>RnvimrToggle<CR>', default_opts)

-- nvim-telescope
map('n', '<C-p>', '<cmd>Telescope git_files<CR>', default_opts)
map('n', '∫',     '<cmd>Telescope buffers<CR>', default_opts) -- alt-b
map('n', '∑',     '<cmd>Telescope tele_tabby list<CR>', default_opts) -- alt-w "window"
map('n', '¬',     '<cmd>Telescope current_buffer_fuzzy_find<CR>', default_opts) -- alt-l
map('n', '<C-f>', '<cmd>Telescope live_grep<CR>', default_opts)
map('n', 'ø',     '<cmd>Telescope oldfiles<CR>', default_opts) -- alt-o "old files"
map('n', '√',     '<cmd>Telescope neoclip<CR>', default_opts) -- alt-v for paste
map('n', 'ç',     '<cmd>lua require("plugins/nvim-telescope-functions").git_bcommits()<CR>', default_opts) -- alt-c "changes"
map('n', 'Ç',     '<cmd>Telescope commands<CR>', default_opts) -- alt-shift-c "commands"
map('n', 'µ',     '<cmd>Telescope keymaps<CR>', default_opts) -- alt-m "maps"
map('n', '˙',     '<cmd>Telescope help_tags<CR>', default_opts) -- alt-h "help tags"

-- git/fugitive
map('n', '<leader>gs',   '<cmd>Git<CR>', default_opts)
map('n', '<leader>gc',   '<cmd>Git commit<CR>', default_opts)
map('n', '<leader>gca',  '<cmd>Git commit --amend<CR>', default_opts)
map('n', '<leader>gb',   '<cmd>Git blame<CR>', default_opts)
map('n', '<leader>gd',   '<cmd>Gdiffsplit<CR>', default_opts)
map('n', '<leader>gr',   '<cmd>Gread<CR>', default_opts)
map('n', '<leader>grm',  '<cmd>Gread master:%<CR>', default_opts)
map('n', '<leader>gw',   '<cmd>Gwrite<CR>', default_opts)
map('n', '<leader>gl',   '<cmd>BCommits<CR>', default_opts)
map('n', '<leader>gL',   '<cmd>lua require("plugins/nvim-telescope-functions").git_bcommits()<CR>', default_opts)
map('n', '<leader>gp',   '<cmd>Git push<CR>', default_opts)
map('n', '<leader>gpf',  '<cmd>Git push --force<CR>', default_opts)
map('n', '<leader>gpsu', '<cmd>! git push -u origin $(git rev-parse --abbrev-ref HEAD)<CR>', default_opts)
map('n', '<leader>grb',  '<cmd>! git pull --rebase<CR>', default_opts)
map('n', '<leader>ga',   '<cmd>! git add .<CR> " adds everything to the index', default_opts)
map('n', '<leader>grh',  '<cmd>! git reset .<CR> " git reset head -- unstages everything', default_opts)
map('n', '<leader>gpr',  '<cmd>! git push -u origin $(git rev-parse --abbrev-ref HEAD) && hub pull-request --no-edit -o<CR>', default_opts) -- git 'pull request' to finish up a PR
map('n', '<space>g',     '<cmd>GitMessenger<CR>', default_opts)
map('n', '<leader>gy',   '<cmd>lua require("gitlinker").get_buf_range_url("n")<CR>', { silent = false })       -- copy github link
map('v', '<leader>gy',   '<cmd>lua require("gitlinker").get_buf_range_url("v")<CR><ESC>', { silent = false })  -- copy github link

-- toggleterm
map('n', '<leader>gz', '<cmd>lua _lazygit_toggle()<CR>', default_opts)

-- unimpared
map('n', '<C-[>', 'yoh', { silent = true }) -- toggle highlight

-- tcomment
map('n', '÷', 'gcc', { silent = true }) -- toggle comment
map('v', '÷', 'gcc', { silent = true }) -- toggle comment

-- tabby
map('n', '<leader>tr', ':TabRename ', { silent = false })

-- easy-align
map('n', 'ga',      '<Plug>(EasyAlign)', { silent = false })
map('v', '<Enter>', '<Plug>(LiveEasyAlign)', { silent = false })
