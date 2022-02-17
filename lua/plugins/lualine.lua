local gps = require("nvim-gps")

require'lualine'.setup {
  options = {
    icons_enabled = true,
    theme = 'sonokai',
    -- component_separators = { left = '', right = ''},
    -- section_separators = { left = '', right = ''},
    section_separators = { left = '', right = ''},
    component_separators = { left = '', right = ''},
    disabled_filetypes = {},
    always_divide_middle = false,
  },
  sections = {
    lualine_a = {'mode'},
    lualine_b = {'branch', 'diff', 'diagnostics'},
    lualine_c = {
      {
        'filename',
        file_status = true,      -- Displays file status (readonly status, modified status)
        path = 1,                -- 0: Just the filename
        -- 1: Relative path
        -- 2: Absolute path

        shorting_target = 40,    -- Shortens path to leave 40 spaces in the window
        symbols = {
          modified = '[+]',      -- Text to show when the file is modified.
          readonly = '[-]',      -- Text to show when the file is non-modifiable or readonly.
          unnamed = '[No Name]', -- Text to show for unnamed buffers.
        },
      }
    },
    lualine_x = {'filetype'},
    lualine_y = {'progress'},
    -- lualine_z = {'location'}
    lualine_z = {
      { gps.get_location, cond = gps.is_available }
    }
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {
      {
        'filename',
        file_status = true,      -- Displays file status (readonly status, modified status)
        path = 1,                -- 0: Just the filename
        -- 1: Relative path
        -- 2: Absolute path

        shorting_target = 40,    -- Shortens path to leave 40 spaces in the window
        symbols = {
          modified = '[+]',      -- Text to show when the file is modified.
          readonly = '[-]',      -- Text to show when the file is non-modifiable or readonly.
          unnamed = '[No Name]', -- Text to show for unnamed buffers.
        },
      }
    },
    lualine_x = {'location'},
    lualine_y = {},
    lualine_z = {}
  },
  tabline = {},
  extensions = { 'fugitive', 'nvim-tree' }
}
