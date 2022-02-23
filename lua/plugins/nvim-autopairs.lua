local npairs = require('nvim-autopairs')
local endwise = require('nvim-autopairs.ts-rule').endwise

npairs.setup({
  disable_filetype = { "TelescopePrompt" , "vim" },
  disable_in_macro = false,  -- disable when recording or executing a macro
  disable_in_visualblock = false, -- disable when insert after visual block mode
  ignored_next_char = string.gsub([[ [%w%%%'%[%"%.] ]],"%s+", ""),
  enable_moveright = true,
  enable_afterquote = true,  -- add bracket pairs after quote
  enable_check_bracket_line = true,  --- check bracket in same line
  check_ts = false,
  map_bs = true,  -- map the <BS> key
  map_c_h = false,  -- Map the <C-h> key to delete a pair
  map_c_w = false, -- map <c-w> to delete a pair if possible
  map_cr = true,
  map_complete = true
})

-- Built-in endwise rules
npairs.add_rules(require('nvim-autopairs.rules.endwise-lua'))
npairs.add_rules(require('nvim-autopairs.rules.endwise-ruby'))

-- Bash endwise rules
npairs.add_rules({
  endwise('if%s.+then$',   'fi',   'sh', nil),
  endwise('%sif%s.+then$', 'fi',   'sh', nil),
  endwise('case%s.+$',     'esac', 'sh', nil),
  endwise('%scase%s.+$',   'esac', 'sh', nil),
  endwise('%sdo$',         'done', 'sh', nil),
})
