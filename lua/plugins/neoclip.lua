require('neoclip').setup {
  enable_persistent_history = true,
  db_path = vim.fn.stdpath("data") .. "/databases/neoclip.sqlite3",
}
