local cmd = vim.cmd -- execute Vim commands

cmd([[
  augroup FiletypeFixes
    autocmd!
    autocmd BufNewFile,BufReadPost .github/*.yml,.github/*.yaml,.github/*.workflow setlocal filetype=ghaworkflow.yaml
    autocmd BufNewFile,BufReadPost *.pkr.hcl,*.pkrvars.hcl setlocal filetype=packer.hcl
    autocmd BufNewFile,BufReadPost argocd/**/*.yaml setlocal filetype=helm
  augroup END
]])
