local cmd = vim.cmd -- execute Vim commands

cmd(
	[[autocmd BufNewFile,BufReadPost .github/*.yml,.github/*.yaml,.github/*.workflow setlocal filetype=ghaworkflow.yaml]]
)
