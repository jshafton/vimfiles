return {
  "robitx/gp.nvim",
  config = function()
    local conf = {
      providers = {
        openai = {
          secret = { "cat", os.getenv("HOME") .. "/.oaik" },
        },
        anthropic = {
          secret = { "cat", os.getenv("HOME") .. "/.anthropic" },
        },
      },
    }
    require("gp").setup(conf)

    -- Setup shortcuts here (see Usage > Shortcuts in the Documentation/Readme)
  end,
  keys = {
    { "<C-g><C-t>", ":<C-u>'<,'>GpChatNew tabnew<cr>", desc = "ChatNew tabnew",           mode = "v" },
    { "<C-g><C-v>", ":<C-u>'<,'>GpChatNew vsplit<cr>", desc = "ChatNew vsplit",           mode = "v" },
    { "<C-g><C-x>", ":<C-u>'<,'>GpChatNew split<cr>",  desc = "ChatNew split",            mode = "v" },
    { "<C-g>a",     ":<C-u>'<,'>GpAppend<cr>",         desc = "Visual Append (after)",    mode = "v" },
    { "<C-g>b",     ":<C-u>'<,'>GpPrepend<cr>",        desc = "Visual Prepend (before)",  mode = "v" },
    { "<C-g>c",     ":<C-u>'<,'>GpChatNew<cr>",        desc = "Visual Chat New",          mode = "v" },
    { "<C-g>ge",    ":<C-u>'<,'>GpEnew<cr>",           desc = "Visual GpEnew",            mode = "v" },
    { "<C-g>gn",    ":<C-u>'<,'>GpNew<cr>",            desc = "Visual GpNew",             mode = "v" },
    { "<C-g>gp",    ":<C-u>'<,'>GpPopup<cr>",          desc = "Visual Popup",             mode = "v" },
    { "<C-g>gt",    ":<C-u>'<,'>GpTabnew<cr>",         desc = "Visual GpTabnew",          mode = "v" },
    { "<C-g>gv",    ":<C-u>'<,'>GpVnew<cr>",           desc = "Visual GpVnew",            mode = "v" },
    { "<C-g>i",     ":<C-u>'<,'>GpImplement<cr>",      desc = "Implement selection",      mode = "v" },
    { "<C-g>n",     "<cmd>GpNextAgent<cr>",            desc = "Next Agent",               mode = "v" },
    { "<C-g>p",     ":<C-u>'<,'>GpChatPaste<cr>",      desc = "Visual Chat Paste",        mode = "v" },
    { "<C-g>r",     ":<C-u>'<,'>GpRewrite<cr>",        desc = "Visual Rewrite",           mode = "v" },
    { "<C-g>s",     "<cmd>GpStop<cr>",                 desc = "GpStop",                   mode = "v" },
    { "<C-g>t",     ":<C-u>'<,'>GpChatToggle<cr>",     desc = "Visual Toggle Chat",       mode = "v" },
    { "<C-g>wa",    ":<C-u>'<,'>GpWhisperAppend<cr>",  desc = "Whisper Append",           mode = "v" },
    { "<C-g>wb",    ":<C-u>'<,'>GpWhisperPrepend<cr>", desc = "Whisper Prepend",          mode = "v" },
    { "<C-g>we",    ":<C-u>'<,'>GpWhisperEnew<cr>",    desc = "Whisper Enew",             mode = "v" },
    { "<C-g>wn",    ":<C-u>'<,'>GpWhisperNew<cr>",     desc = "Whisper New",              mode = "v" },
    { "<C-g>wp",    ":<C-u>'<,'>GpWhisperPopup<cr>",   desc = "Whisper Popup",            mode = "v" },
    { "<C-g>wr",    ":<C-u>'<,'>GpWhisperRewrite<cr>", desc = "Whisper Rewrite",          mode = "v" },
    { "<C-g>wt",    ":<C-u>'<,'>GpWhisperTabnew<cr>",  desc = "Whisper Tabnew",           mode = "v" },
    { "<C-g>wv",    ":<C-u>'<,'>GpWhisperVnew<cr>",    desc = "Whisper Vnew",             mode = "v" },
    { "<C-g>ww",    ":<C-u>'<,'>GpWhisper<cr>",        desc = "Whisper",                  mode = "v" },
    { "<C-g>x",     ":<C-u>'<,'>GpContext<cr>",        desc = "Visual GpContext",         mode = "v" },

    { "<C-g><C-t>", "<cmd>GpChatNew tabnew<cr>",       desc = "New Chat tabnew",          mode = "n" },
    { "<C-g><C-v>", "<cmd>GpChatNew vsplit<cr>",       desc = "New Chat vsplit",          mode = "n" },
    { "<C-g><C-x>", "<cmd>GpChatNew split<cr>",        desc = "New Chat split",           mode = "n" },
    { "<C-g>a",     "<cmd>GpAppend<cr>",               desc = "Append (after)",           mode = "n" },
    { "<C-g>b",     "<cmd>GpPrepend<cr>",              desc = "Prepend (before)",         mode = "n" },
    { "<C-g>c",     "<cmd>GpChatNew<cr>",              desc = "New Chat",                 mode = "n" },
    { "<C-g>f",     "<cmd>GpChatFinder<cr>",           desc = "Chat Finder",              mode = "n" },
    { "<C-g>ge",    "<cmd>GpEnew<cr>",                 desc = "GpEnew",                   mode = "n" },
    { "<C-g>gn",    "<cmd>GpNew<cr>",                  desc = "GpNew",                    mode = "n" },
    { "<C-g>gp",    "<cmd>GpPopup<cr>",                desc = "Popup",                    mode = "n" },
    { "<C-g>gt",    "<cmd>GpTabnew<cr>",               desc = "GpTabnew",                 mode = "n" },
    { "<C-g>gv",    "<cmd>GpVnew<cr>",                 desc = "GpVnew",                   mode = "n" },
    { "<C-g>n",     "<cmd>GpNextAgent<cr>",            desc = "Next Agent",               mode = "n" },
    { "<C-g>r",     "<cmd>GpRewrite<cr>",              desc = "Inline Rewrite",           mode = "n" },
    { "<C-g>s",     "<cmd>GpStop<cr>",                 desc = "GpStop",                   mode = "n" },
    { "<C-g>t",     "<cmd>GpChatToggle<cr>",           desc = "Toggle Chat",              mode = "n" },
    { "<C-g>wa",    "<cmd>GpWhisperAppend<cr>",        desc = "Whisper Append (after)",   mode = "n" },
    { "<C-g>wb",    "<cmd>GpWhisperPrepend<cr>",       desc = "Whisper Prepend (before)", mode = "n" },
    { "<C-g>we",    "<cmd>GpWhisperEnew<cr>",          desc = "Whisper Enew",             mode = "n" },
    { "<C-g>wn",    "<cmd>GpWhisperNew<cr>",           desc = "Whisper New",              mode = "n" },
    { "<C-g>wp",    "<cmd>GpWhisperPopup<cr>",         desc = "Whisper Popup",            mode = "n" },
    { "<C-g>wr",    "<cmd>GpWhisperRewrite<cr>",       desc = "Whisper Inline Rewrite",   mode = "n" },
    { "<C-g>wt",    "<cmd>GpWhisperTabnew<cr>",        desc = "Whisper Tabnew",           mode = "n" },
    { "<C-g>wv",    "<cmd>GpWhisperVnew<cr>",          desc = "Whisper Vnew",             mode = "n" },
    { "<C-g>ww",    "<cmd>GpWhisper<cr>",              desc = "Whisper",                  mode = "n" },
    { "<C-g>x",     "<cmd>GpContext<cr>",              desc = "Toggle GpContext",         mode = "n" },

    { "<C-g><C-t>", "<cmd>GpChatNew tabnew<cr>",       desc = "New Chat tabnew",          mode = "i" },
    { "<C-g><C-v>", "<cmd>GpChatNew vsplit<cr>",       desc = "New Chat vsplit",          mode = "i" },
    { "<C-g><C-x>", "<cmd>GpChatNew split<cr>",        desc = "New Chat split",           mode = "i" },
    { "<C-g>a",     "<cmd>GpAppend<cr>",               desc = "Append (after)",           mode = "i" },
    { "<C-g>b",     "<cmd>GpPrepend<cr>",              desc = "Prepend (before)",         mode = "i" },
    { "<C-g>c",     "<cmd>GpChatNew<cr>",              desc = "New Chat",                 mode = "i" },
    { "<C-g>f",     "<cmd>GpChatFinder<cr>",           desc = "Chat Finder",              mode = "i" },
    { "<C-g>ge",    "<cmd>GpEnew<cr>",                 desc = "GpEnew",                   mode = "i" },
    { "<C-g>gn",    "<cmd>GpNew<cr>",                  desc = "GpNew",                    mode = "i" },
    { "<C-g>gp",    "<cmd>GpPopup<cr>",                desc = "Popup",                    mode = "i" },
    { "<C-g>gt",    "<cmd>GpTabnew<cr>",               desc = "GpTabnew",                 mode = "i" },
    { "<C-g>gv",    "<cmd>GpVnew<cr>",                 desc = "GpVnew",                   mode = "i" },
    { "<C-g>n",     "<cmd>GpNextAgent<cr>",            desc = "Next Agent",               mode = "i" },
    { "<C-g>r",     "<cmd>GpRewrite<cr>",              desc = "Inline Rewrite",           mode = "i" },
    { "<C-g>s",     "<cmd>GpStop<cr>",                 desc = "GpStop",                   mode = "i" },
    { "<C-g>t",     "<cmd>GpChatToggle<cr>",           desc = "Toggle Chat",              mode = "i" },
    { "<C-g>wa",    "<cmd>GpWhisperAppend<cr>",        desc = "Whisper Append (after)",   mode = "i" },
    { "<C-g>wb",    "<cmd>GpWhisperPrepend<cr>",       desc = "Whisper Prepend (before)", mode = "i" },
    { "<C-g>we",    "<cmd>GpWhisperEnew<cr>",          desc = "Whisper Enew",             mode = "i" },
    { "<C-g>wn",    "<cmd>GpWhisperNew<cr>",           desc = "Whisper New",              mode = "i" },
    { "<C-g>wp",    "<cmd>GpWhisperPopup<cr>",         desc = "Whisper Popup",            mode = "i" },
    { "<C-g>wr",    "<cmd>GpWhisperRewrite<cr>",       desc = "Whisper Inline Rewrite",   mode = "i" },
    { "<C-g>wt",    "<cmd>GpWhisperTabnew<cr>",        desc = "Whisper Tabnew",           mode = "i" },
    { "<C-g>wv",    "<cmd>GpWhisperVnew<cr>",          desc = "Whisper Vnew",             mode = "i" },
    { "<C-g>ww",    "<cmd>GpWhisper<cr>",              desc = "Whisper",                  mode = "i" },
    { "<C-g>x",     "<cmd>GpContext<cr>",              desc = "Toggle GpContext",         mode = "i" },
  },

  {
    "carlos-algms/agentic.nvim",

    event = "VeryLazy",

    opts = {
      -- Available by default: "claude-acp" | "gemini-acp" | "codex-acp" | "opencode-acp"
      provider = "claude-acp", -- setting the name here is all you need to get started
    },

    -- these are just suggested keymaps; customize as desired
    keys = {
      {
        "<C-\\>",
        function() require("agentic").toggle() end,
        mode = { "n", "v", "i" },
        desc = "Toggle Agentic Chat"
      },
      {
        "<æ>",
        function() require("agentic").add_selection_or_file_to_context() end,
        mode = { "n" },
        desc = "Add file or selection to Agentic to Context"
      },
      {
        "<C-a>",
        function() require("agentic").new_session() end,
        mode = { "n", "v", "i" },
        desc = "New Agentic Session"
      },
      {
        "<leader>a",
        function()
          require("agentic").add_selection()
          require("agentic").open()
        end,
        mode = "v",
        desc = "Open Agentic with selection only"
      },
    },
  }
}

