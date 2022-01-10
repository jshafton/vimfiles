require('null-ls').setup {
  debug = true,
  sources = {
    require("null-ls").builtins.diagnostics.shellcheck
  }
}
