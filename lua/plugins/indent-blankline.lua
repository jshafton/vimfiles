require("indent_blankline").setup {
  show_current_context = true,
  show_current_context_start = false,
  filetype_exclude = { 'NvimTree', 'help', 'packer' },
  use_treesitter = true
}