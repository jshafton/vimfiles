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
map('n', 'π', 'p', { noremap = true })
map('n', '∏', 'P', { noremap = true })

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
map('n', '#',  '*zz', default_opts)
map('n', 'g;', 'g;zz', default_opts)
map('n', '}',  '}zz', default_opts)
map('n', '{',  '{zz', default_opts)

-- use . to repeat last command over a visual range
map('v', '.', '<cmd>normal .<CR>', default_opts)
-- use the @q macro over a visual range
map('v', '@q', '<cmd>normal @q<CR>', default_opts)

-- map Q to something useful
map('n', 'Q', '@@', default_opts)
map('v', 'Q', ':normal @@<CR>', default_opts)

-- easy window focus (closes all others)
map('n', '<Leader>F', '<C-W>o', default_opts)

-- replace current word in file
map('n', '<Leader>R', ':%s/<C-R><C-W>/', { silent = false })

-- duplicate line (alt-d)
map('n', '∂', 'yyπ', { noremap = false, silent = false })
-- duplicate text (alt-d)
map('v', '∂', 'y`>π', { noremap = false, silent = false })

-----------------------------------------------------------
-- Plugin shortcuts:
-----------------------------------------------------------

-- vim-maximizer
-----------------------------------------------------------
map('n', '<leader>f', '<cmd>MaximizerToggle<CR>', default_opts)
map('v', '<leader>f', '<cmd>MaximizerToggle<CR>gv', default_opts)

-- nvim-tree
-----------------------------------------------------------
map('n', 'gnt', '<cmd>NvimTreeToggle<CR>', default_opts)
map('n', 'gnf', '<cmd>NvimTreeFindFile<CR>', default_opts)

-- floaterm
-----------------------------------------------------------
map('n', '-',          '<cmd>FloatermNew --height=0.8 --width=0.8 vifm<CR>', default_opts)
map('n', '<leader>gz', '<cmd>FloatermNew --height=0.8 --width=0.8 lazygit<CR>', default_opts)

-- fzf-lua
-----------------------------------------------------------
map('n', '<C-p>',      '<cmd>FzfLua files<CR>', default_opts)
map('n', '®',          '<cmd>FzfLua resume<CR>', default_opts) -- alt-r "resume"
map('n', '∫',          '<cmd>FzfLua buffers<CR>', default_opts) -- alt-b
map('n', '∑',          '<cmd>FzfLua tabs<CR>', default_opts) -- alt-w "window"
map('n', '¬',          '<cmd>FzfLua blines<CR>', default_opts) -- alt-l
map('n', '<C-f>',      '<cmd>FzfLua grep_project<CR>', default_opts) -- "find"
map('n', 'ƒ',          '<cmd>lua require("fzf-lua.providers.grep").grep_project({ fzf_opts = { ["--nth"] = "1.." } })<CR>', default_opts) -- alt-f "find" including file path
map('n', 'ø',          '<cmd>FzfLua oldfiles<CR>', default_opts) -- alt-o "old files"
map('n', '√',          '<cmd>lua require("neoclip.fzf")()<CR>', default_opts) -- alt-v for paste
map('n', 'Ç',          '<cmd>FzfLua git_bcommits<CR>', default_opts) -- alt-shift-c "changes"
map('n', 'ç',          '<cmd>FzfLua commands<CR>', default_opts) -- alt-c "commands"
map('n', 'µ',          '<cmd>FzfLua keymaps<CR>', default_opts) -- alt-m "maps"
map('n', '˙',          '<cmd>FzfLua help_tags<CR>', default_opts) -- alt-h "help tags"
map('n', '<space>r',   '<cmd>FzfLua grep_cword<CR>', default_opts) -- "references"
map('n', 'Ï',          '<cmd>FzfLua filetypes<CR>', default_opts) -- alt-shift-f "file types"
map('n', '<leader>gs', '<cmd>FzfLua git_status<CR>', default_opts)
map('n', '<space>a',   '<cmd>FzfLua lsp_code_actions<CR>', default_opts)
map('n', '<space>d',   '<cmd>FzfLua lsp_definitions<CR>', default_opts)
map('n', '<space>R',   '<cmd>FzfLua lsp_referencess<CR>', default_opts)
map('n', '<space>s',   '<cmd>FzfLua lsp_document_symbols<CR>', default_opts)

-- git/fugitive
-----------------------------------------------------------
-- map('n', '<leader>gs',   '<cmd>Git<CR>', default_opts)
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

-- LSP
-----------------------------------------------------------
map('n', '<space>,', '<cmd>lua vim.diagnostic.goto_prev()<CR>', default_opts)
map('n', '<space>;', '<cmd>lua vim.diagnostic.goto_next()<CR>', default_opts)
map('n', '<space>f', '<cmd>lua vim.lsp.buf.formatting()<CR>', default_opts)
map('n', '<space>h', '<cmd>lua vim.lsp.buf.hover()<CR>', default_opts)
map('n', '<space>m', '<cmd>lua vim.lsp.buf.rename()<CR>', default_opts)

-- Trouble
-----------------------------------------------------------
map('n', '†', '<cmd>TroubleToggle<CR>', default_opts)

-- unimpared
-----------------------------------------------------------
map('n', '<C-[>', 'yoh', { silent = true }) -- toggle highlight
-- bubble single lines (alt-j/alt-k)
map('n', '˚', '[e', { silent = true })
map('n', '∆', ']e', { silent = true })
-- bubble multiple lines
map('v', '˚', '[egv', { silent = true })
map('v', '∆', ']egv', { silent = true })
-- center focus after moving TODO: not working for some reason
-- local unimpaired_ops = { "c", "n" }
-- for _, a in ipairs(unimpaired_ops) do
--   map('n', '[' .. a, '[' .. a .. 'zz', { noremap = false, silent = false })
--   map('n', ']' .. a, ']' .. a .. 'zz', { noremap = false, silent = false })
-- end

-- tabby
-----------------------------------------------------------
map('n', '<leader>tr', ':TabRename ', { silent = false })

-- easy-align
-----------------------------------------------------------
map('n', 'ga',      '<Plug>(EasyAlign)', { silent = false })
map('v', '<Enter>', '<Plug>(LiveEasyAlign)', { silent = false })

-- open-browser
-----------------------------------------------------------
map('n', 'gx', '<Plug>(openbrowser-open)', { silent = false })
map('v', 'gx', '<Plug>(openbrowser-open)', { silent = false })
map('v', 'gs', '<Plug>(openbrowser-smart-search)', { silent = false })

-- hop
-----------------------------------------------------------
map('n', 's',  "<cmd>HopChar2<CR>", {})
map('v', 'z',  "<cmd>HopChar2<CR>", {})
map('o', 'z',  "<cmd>HopChar2<CR>", {})
map('n', 'gl', "<cmd>HopLine<CR>", {}) -- "Goto Line"
map('n', 'gw', "<cmd>HopWord<CR>", {}) -- "Goto Word"

-- camelcasemotion
-----------------------------------------------------------
cmd [[ call camelcasemotion#CreateMotionMappings('<leader>') ]]

-- surround
-----------------------------------------------------------
vim.g.surround_104 = "{{ \r }}" -- h - surround with handlebars {{ }}
