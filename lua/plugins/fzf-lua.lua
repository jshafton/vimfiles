return {
  "ibhagwan/fzf-lua",
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  keys = {
    { "<C-p>", "<cmd>FzfLua files<CR>" },
    -- alt-r "resume"
    { "®",    "<cmd>FzfLua resume<CR>" },
    -- alt-b
    { "∫",   "<cmd>FzfLua buffers<CR>" },
    -- alt-w "window"
    { "∑",   "<cmd>FzfLua tabs<CR>" },
    -- alt-l
    { "¬",    "<cmd>FzfLua blines<CR>" },
    -- "find"
    { "<C-f>", "<cmd>FzfLua grep_project<CR>" },
    -- alt-f "find" including file path
    {
      "ƒ",
      '<cmd>lua require("fzf-lua.providers.grep").grep_project({ fzf_opts = { ["--nth"] = "1.." } })<CR>',
    },
    -- alt-o "old files"
    { "ø",       "<cmd>FzfLua oldfiles<CR>" },
    -- alt-v for paste
    { "√",      '<cmd>lua require("neoclip.fzf")()<CR>' },
    -- alt-shift-c "changes"
    { "Ç",       "<cmd>FzfLua git_bcommits<CR>" },
    -- alt-c "commands"
    { "ç",       "<cmd>FzfLua commands<CR>" },
    -- alt-m "maps"
    { "µ",       "<cmd>FzfLua keymaps<CR>" },
    -- alt-h "help tags"
    { "˙",       "<cmd>FzfLua help_tags<CR>" },
    -- "references"
    { "<space>r", "<cmd>FzfLua grep_cword<CR>" },
    -- alt-shift-f "file types"
    { "Ï",       "<cmd>FzfLua filetypes<CR>" },
    { "<space>R", "<cmd>FzfLua lsp_referencess<CR>" },
  },
  config = function()
    -- Create fzf history file if not present
    local fzf_history_dir = vim.fn.expand("~/.local/share/fzf-history")
    local fzf_history_file = fzf_history_dir .. "/" .. "fzf.lua"
    if vim.fn.isdirectory(fzf_history_dir) == 0 then
      vim.fn.system("mkdir -p " .. fzf_history_dir)
      vim.fn.system("touch " .. fzf_history_file)
    end

    require("fzf-lua").setup({
      global_resume = true,
      global_resume_query = true,
      fzf_opts = {
        ["--history"] = fzf_history_file,
      },
      previewers = {
        git_diff = {
          cmd_deleted = "git diff --color HEAD --",
          cmd_modified = "git diff --color HEAD",
          cmd_untracked = "git diff --color --no-index /dev/null",
          pager = "delta --width=$FZF_PREVIEW_COLUMNS",
        },
      },
      files = {
        winopts = {
          preview = { layout = "vertical" },
        },
      },
      grep = {
        winopts = {
          preview = { layout = "vertical", vertical = "down:80%" },
        },
      },
      git = {
        commits = {
          -- Add in delta previewing; it won't use the default config for some reason and
          -- it also can't be passed in as a config option, for some related (?) reason
          preview_pager = "delta --width=$FZF_PREVIEW_COLUMNS",
        },
        bcommits = {
          -- This comments out the "rotate-to" functionality that's hard-coded into the bcommits
          -- command, which doesn't work with delta
          preview_pager = "delta --width=$FZF_PREVIEW_COLUMNS",
        },
      },
      keymap = {
        fzf = {
          ["å"] = "select-all+accept", -- alt-a
          -- Only valid with fzf previewers (bat/cat/git/etc)
          ["f3"] = "toggle-preview-wrap",
          ["f4"] = "toggle-preview",
          ["shift-down"] = "preview-page-down",
          ["shift-up"] = "preview-page-up",
        },
      },
    })
  end,
}
