return {
  {
    "nvim-treesitter/nvim-treesitter",
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

      local ts = require("nvim-treesitter")
      local installed = ts.get_installed()
      local installed_set = {}
      for _, lang in ipairs(installed) do
        installed_set[lang] = true
      end

      local missing = {}
      for _, lang in ipairs(ensure_installed) do
        if not installed_set[lang] then
          table.insert(missing, lang)
        end
      end

      if #missing > 0 then
        ts.install(missing)
      end

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
