-----------------------------------------------------------
-- Keymaps configuration file: keymaps of neovim
-- and plugins.
-----------------------------------------------------------

local map = vim.api.nvim_set_keymap
local default_opts = { noremap = true, silent = true }

-----------------------------------------------------------
-- Neovim shortcuts:
-----------------------------------------------------------

-- source this file
map("n", "<F5>", ":source %<CR>", { silent = false })

-- use H to go to begin of line and L to go to end of line
map("", "H", "^", default_opts)
map("", "L", "g_", default_opts)

-- easy save
map("n", "S", "<cmd>w<CR>", default_opts)

-- easy window quit
map("n", "<leader>q", "<cmd>q<CR>", default_opts)

-- full quit
map("n", "X", "<cmd>qall!<CR>", default_opts)

-- easy splits
map("n", "<bar>", "<cmd>vsplit<CR><C-W><C-L>", default_opts)
map("n", "_", "<cmd>split<CR><C-W><C-J>", default_opts)

-- tabs
map("n", "J", "<cmd>tabprevious<CR>", default_opts)
map("n", "K", "<cmd>tabnext<CR>", default_opts)
map("n", "g1", "1gt", default_opts)
map("n", "g2", "2gt", default_opts)
map("n", "g3", "3gt", default_opts)
map("n", "g4", "4gt", default_opts)
map("n", "g5", "5gt", default_opts)
map("n", "g6", "6gt", default_opts)

-- paste intelligently by default
map("", "p", "pv`]=`]", { noremap = false })
map("", "P", "Pv`]=`]", { noremap = false })

-- option p/P to paste raw
map("n", "π", "p", { noremap = true })
map("n", "∏", "P", { noremap = true })

-- yank to end of line
map("n", "Y", "y$", { noremap = false })
-- in visual mode Y selects to clipboard
map("x", "Y", '"*y"', default_opts)

-- visually select the text that was last edited/pasted
map("n", "gV", "`[v`]", default_opts)
map("n", "<leader>v", "gv", default_opts)

-- textmate-like indentation
map("n", "≤", "<<", default_opts)
map("n", "≥", ">>", default_opts)
map("v", "≤", "<gv", default_opts)
map("v", "≥", ">gv", default_opts)

-- expand %% to full directory path in command line
map("c", "%%", "<C-R>=expand('%:h').'/'<CR>", { silent = false })

-- copy current file path to the system clipboard
map("n", "<leader>cfp", '<cmd>let @* = expand("%")<CR>', default_opts)

-- try to center focus on movement
map("n", "n", "nzz", default_opts)
map("n", "N", "Nzz", default_opts)
map("n", "*", "*zz", default_opts)
map("n", "#", "*zz", default_opts)
map("n", "g;", "g;zz", default_opts)
map("n", "}", "}zz", default_opts)
map("n", "{", "{zz", default_opts)

-- use . to repeat last command over a visual range
map("v", ".", "<cmd>normal .<CR>", default_opts)
-- use the @q macro over a visual range
map("v", "@q", "<cmd>normal @q<CR>", default_opts)

-- map Q to something useful
map("n", "Q", "@@", default_opts)
map("v", "Q", ":normal @@<CR>", default_opts)

-- easy window focus (closes all others)
map("n", "<Leader>F", "<C-W>o", default_opts)

-- close tab
map("n", "∑", "<cmd>tabclose<cr>", default_opts)

-- replace current word in file
map("n", "<Leader>R", ":%s/<C-R><C-W>/", { silent = false })

-- duplicate line (alt-d)
map("n", "∂", "yyπ", { noremap = false, silent = false })
-- duplicate text (alt-d)
map("v", "∂", "y`>π", { noremap = false, silent = false })

map("n", "÷", "gcc", { noremap = false, silent = false })
map("v", "÷", "gcc", { noremap = false, silent = false })

-----------------------------------------------------------
-- Plugin shortcuts:
-----------------------------------------------------------

-- unimpaired
-----------------------------------------------------------
map("n", "<Esc>", "yoh", { silent = true }) -- toggle highlight

-- bubble single lines (alt-j/alt-k)
map("n", "˚", "[e", { silent = true })
map("n", "∆", "]e", { silent = true })
-- bubble multiple lines
map("v", "˚", "[egv", { silent = true })
map("v", "∆", "]egv", { silent = true })
-- center focus after moving TODO: not working for some reason
-- local unimpaired_ops = { "c", "n" }
-- for _, a in ipairs(unimpaired_ops) do
--   map('n', '[' .. a, '[' .. a .. 'zz', { noremap = false, silent = false })
--   map('n', ']' .. a, ']' .. a .. 'zz', { noremap = false, silent = false })
-- end
