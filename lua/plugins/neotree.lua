vim.cmd([[ let g:neo_tree_remove_legacy_commands = 1 ]])

-- https://github.com/nvim-neo-tree/neo-tree.nvim/blob/v2.x/lua/neo-tree/defaults.lua
require 'neo-tree'.setup({
    close_if_last_window = true, -- Close Neo-tree if it is the last window left in the tab
})
