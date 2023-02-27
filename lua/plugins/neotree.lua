return {
  'nvim-neo-tree/neo-tree.nvim',
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
    "MunifTanjim/nui.nvim",
  },
  keys = {
    { 'gnt', '<cmd>Neotree toggle<CR>' },
    { 'gnf', '<cmd>Neotree reveal<CR>' }
  },
  cmd = 'Neotree',
  config = function()
    vim.cmd([[ let g:neo_tree_remove_legacy_commands = 1 ]])
    require ('neo-tree').setup({
      -- https://github.com/nvim-neo-tree/neo-tree.nvim/blob/v2.x/lua/neo-tree/defaults.lua
      close_if_last_window = true, -- Close Neo-tree if it is the last window left in the tab
    })
  end
}
