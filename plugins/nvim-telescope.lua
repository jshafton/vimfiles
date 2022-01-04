local actions = require('telescope.actions')

require('telescope').setup {
  defaults = {
    mappings = {
      i = {
        ["<CR>"] = actions.select_default + actions.center,
        ["<C-x>"] = actions.select_horizontal + actions.center,
        ["<C-v>"] = actions.select_vertical + actions.center,
        ["<C-t>"] = actions.select_tab + actions.center,
      },
      n = {
        ["<CR>"] = actions.select_default + actions.center,
        ["<C-x>"] = actions.select_horizontal + actions.center,
        ["<C-v>"] = actions.select_vertical + actions.center,
        ["<C-t>"] = actions.select_tab + actions.center,
      },
    },
  },
  pickers = {
    current_buffer_fuzzy_find = {
      mappings = {
        i = {
          ["<CR>"] = actions.select_default + actions.center,
        },
        n = {
          ["<CR>"] = actions.select_default + actions.center,
        },
      },
    }
  }
}
