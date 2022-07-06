-----------------------------------------------------------
-- File manager configuration file
-----------------------------------------------------------

-- Plugin: nvim-tree
-- https://github.com/kyazdani42/nvim-tree.lua

-- Keybindings are defined in `keymapping.lua`:
--- https://github.com/kyazdani42/nvim-tree.lua#keybindings

-- Note: options under the g: command should be set BEFORE running the
--- setup function:
--- https://github.com/kyazdani42/nvim-tree.lua#setup
--- See: `help NvimTree`

  require('nvim-tree').setup {
    disable_netrw = true,
    hijack_netrw = false,
    open_on_setup = false,
    update_cwd = true,
    view = {
      width = 32,
    },
    filters = {
      dotfiles = true,
      custom = { '.git', 'node_modules', '.cache', '.bin' },
    },
    git = {
      enable = true,
      ignore = true,
    },
    actions = {
      open_file = {
        quit_on_open = false,
        window_picker = {
          enable = false
        }
      }
    },
    renderer = {
      highlight_git = true,
      full_name = false,
      highlight_opened_files = "all",
      icons = {
        glyphs = {
          default = "‣ "
        }
      }
    }
  }
