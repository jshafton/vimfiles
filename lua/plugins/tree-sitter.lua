local ts = require 'nvim-treesitter.configs'

ts.setup {
  ensure_installed = {
    "bash",
    "go",
    "hcl",
    "html",
    "java",
    "javascript",
    "jsdoc",
    "json",
    "json5",
    "jsonc",
    "lua",
    "make",
    "python",
    "regex",
    "scala",
    "toml",
    "vim"
  },
  highlight = {
    enable = true,
    -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
    -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
    -- Using this option may slow down your editor, and you may see some duplicate highlights.
    -- Instead of true it can also be a list of languages
    additional_vim_regex_highlighting = false, -- { 'ansible', 'yaml' },
    disable = { 'yaml', 'ansible' }
  },
  indent = {
    enable = false,
    disable = { 'yaml' }
  }
}
