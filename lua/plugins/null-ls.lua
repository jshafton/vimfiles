local null_ls = require('null-ls')

null_ls.setup {
  debug = true,
  sources = {
    null_ls.builtins.diagnostics.shellcheck,
    null_ls.builtins.formatting.shfmt,
    null_ls.builtins.formatting.terraform_fmt
  }
}
