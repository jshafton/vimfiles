local npairs = require('nvim-autopairs')
local map = vim.api.nvim_set_keymap

-- https://github.com/windwp/nvim-autopairs
-- TODO: haven't done stuff for coq/completion
npairs.setup({
  disable_filetype = { "TelescopePrompt" , "vim" },
  disable_in_macro = false,  -- disable when recording or executing a macro
  disable_in_visualblock = false, -- disable when insert after visual block mode
  ignored_next_char = string.gsub([[ [%w%%%'%[%"%.] ]],"%s+", ""),
  enable_moveright = true,
  enable_afterquote = true,  -- add bracket pairs after quote
  enable_check_bracket_line = true,  --- check bracket in same line
  check_ts = false,
  map_bs = false,  -- map the <BS> key
  map_c_h = false,  -- Map the <C-h> key to delete a pair
  map_c_w = false, -- map <c-w> to delete a pair if possible
  map_cr = false
})

-- these mappings are coq recommended mappings unrelated to nvim-autopairs
map('i', '<esc>',   [[pumvisible() ? "<c-e><esc>" : "<esc>"]], { expr = true, noremap = true })
map('i', '<c-c>',   [[pumvisible() ? "<c-e><c-c>" : "<c-c>"]], { expr = true, noremap = true })
map('i', '<tab>',   [[pumvisible() ? "<c-n>" : "<tab>"]],      { expr = true, noremap = true })
map('i', '<s-tab>', [[pumvisible() ? "<c-p>" : "<bs>"]],       { expr = true, noremap = true })

_G.MUtils= {}

MUtils.CR = function()
  if vim.fn.pumvisible() ~= 0 then
    if vim.fn.complete_info({ 'selected' }).selected ~= -1 then
      return npairs.esc('<c-y>')
    else
      return npairs.esc('<c-e>') .. npairs.autopairs_cr()
    end
  else
    return npairs.autopairs_cr()
  end
end
map('i', '<cr>', 'v:lua.MUtils.CR()', { expr = true, noremap = true })

MUtils.BS = function()
  if vim.fn.pumvisible() ~= 0 and vim.fn.complete_info({ 'mode' }).mode == 'eval' then
    return npairs.esc('<c-e>') .. npairs.autopairs_bs()
  else
    return npairs.autopairs_bs()
  end
end
map('i', '<bs>', 'v:lua.MUtils.BS()', { expr = true, noremap = true })
