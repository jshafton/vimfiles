require('telescope').setup {
  extensions = {
    fzf = {
      fuzzy = true,                    -- false will only do exact matching
      override_generic_sorter = true,  -- override the generic sorter
      override_file_sorter = true,     -- override the file sorter
      case_mode = "smart_case",        -- or "ignore_case" or "respect_case"
                                       -- the default case_mode is "smart_case"
    },
    tele_tabby = {
      use_highlighter = true
    },
    neoclip = {
      -- TODO: maybe set up some custom keys here to make <CR> paste
      on_paste = {
        set_reg = true
      }
    }
  }
}
-- To get some extensions loaded and working with telescope, you need to call
-- load_extension, somewhere after setup function:
require('telescope').load_extension('fzf')
require('telescope').load_extension('neoclip')
