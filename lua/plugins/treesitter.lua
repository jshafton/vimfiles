return {
  {
    "nvim-treesitter/nvim-treesitter",
    branch = 'main',
    version = false, -- last release is way too old and doesn't work on Windows
    build = ":TSUpdate",
    lazy = false,
    config = function()
      -- Install missing parsers on startup
      local ensure_installed = {
        "angular",
        "bash",
        "c_sharp",
        "css",
        "git_rebase",
        "gitcommit",
        "gitignore",
        "go",
        "groovy",
        "hcl",
        "helm",
        "html",
        "http",
        "java",
        "javascript",
        "jinja",
        "jinja_inline",
        "jsdoc",
        "json",
        "json5",
        "lua",
        "make",
        "markdown",
        "markdown_inline",
        "prisma",
        "python",
        "regex",
        "ruby",
        "scala",
        "sql",
        "ssh_config",
        "terraform",
        "tmux",
        "toml",
        "typescript",
        "vim",
        "yaml",
      }

      require("nvim-treesitter").install(ensure_installed)

      -- Enable treesitter highlighting globally (replaces old highlight = { enable = true })
      -- vim.treesitter.start() resolves the parser language from filetype automatically
      -- and pcall silently skips filetypes without a parser installed
      vim.api.nvim_create_autocmd("FileType", {
        callback = function(args)
          if not args.match:find("^yaml") then
            pcall(vim.treesitter.start, args.buf)
          end
        end,
      })
    end,
  },
}
