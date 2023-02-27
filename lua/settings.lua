-----------------------------------------------------------
-- Neovim API aliases
-----------------------------------------------------------

--local map = vim.api.nvim_set_keymap  -- set global keymap
local cmd = vim.cmd     				-- execute Vim commands
local exec = vim.api.nvim_exec 	-- execute Vimscript
local g = vim.g         				-- global variables
local opt = vim.opt         		-- global/buffer/windows-scoped options

-----------------------------------------------------------
-- Ruby
-----------------------------------------------------------
g.ruby_host_prog = '$HOME/.asdf/shims/ruby'

-----------------------------------------------------------
-- Python
-----------------------------------------------------------
g.python3_host_prog = '$HOME/.asdf/shims/python3'
g.python_host_prog  = '$HOME/.asdf/shims/python2'

-----------------------------------------------------------
-- General
-----------------------------------------------------------
g.mapleader = ','                   -- change leader to a comma
opt.mouse = 'a'                     -- enable mouse support
opt.clipboard = ''                  -- copy/paste to system clipboard
opt.backup = false                  -- don't save backup files
opt.swapfile = false                -- don't use swapfile
opt.undofile = true                 -- keep track of undo history
cmd [[set undodir=~/.vim/.undo]]    -- keep undo files in a specific user dir

-----------------------------------------------------------
-- Neovim UI
-----------------------------------------------------------
opt.number = true             -- show line number
opt.relativenumber = true     -- show line numbers as relative
opt.showmatch = true          -- highlight matching parenthesis
opt.foldmethod = 'marker'     -- enable folding (default 'foldmarker')
-- opt.colorcolumn = '80'        -- line length marker at 80 columns
opt.splitright = true         -- vertical split to the right
opt.splitbelow = true         -- horizontal split to the bottom
opt.ignorecase = true         -- ignore case letters when search
opt.smartcase = true          -- ignore lowercase for the whole pattern
opt.linebreak = true          -- wrap on word boundary
opt.wrap = false              -- don't wrap by default
opt.list = false              -- don't show list chars
opt.gdefault = true           -- default to /g global subst (rather than first instance)

-- -- highlight on yank
exec([[
  augroup YankHighlight
    autocmd!
    autocmd TextYankPost * silent! lua vim.highlight.on_yank{higroup="IncSearch", timeout=250}
  augroup end
]], false)

-----------------------------------------------------------
-- Diagnostics
-----------------------------------------------------------
vim.diagnostic.config({
  virtual_text = true,
  signs = true,
  underline = true,
  update_in_insert = false,
  severity_sort = false,
})

-----------------------------------------------------------
-- Memory, CPU
-----------------------------------------------------------
opt.hidden = true         -- enable background buffers
opt.history = 1000        -- remember n lines in history
opt.lazyredraw = true     -- faster scrolling
opt.synmaxcol = 240       -- max column for syntax highlight

-----------------------------------------------------------
-- Colors
-----------------------------------------------------------
opt.termguicolors = true      -- enable 24-bit RGB colors

-----------------------------------------------------------
-- Tabs, indent
-----------------------------------------------------------
opt.expandtab = true      -- use spaces instead of tabs
opt.shiftwidth = 2        -- shift n spaces when tab
opt.tabstop = 2           -- 1 tab == n spaces
opt.smartindent = true    -- autoindent new lines

-- don't auto commenting new lines
cmd [[au BufEnter * set fo-=c fo-=r fo-=o]]

-- remove line length marker for selected filetypes
cmd [[autocmd FileType text,markdown,html,xhtml,javascript setlocal cc=0]]

-----------------------------------------------------------
-- Autocompletion
-----------------------------------------------------------
-- insert mode completion options
opt.completeopt = 'menuone,noselect'

-- menuone  Use the popup menu also when there is only one match.
-- Useful when there is additional information about the
-- match, e.g., what file it comes from.

-- noselect  Do not select a match in the menu, force the user to
-- select one from the menu. Only works in combination with
-- "menu" or "menuone".


cmd [[
" create directories for new files on write
function! s:MkNonExDir(file, buf)
  if empty(getbufvar(a:buf, '&buftype')) && a:file!~#'\v^\w+\:\/'
    let dir=fnamemodify(a:file, ':h')
    if !isdirectory(dir)
      call mkdir(dir, 'p')
    endif
  endif
endfunction
augroup BWCCreateDir
  autocmd!
  autocmd BufWritePre * :call s:MkNonExDir(expand('<afile>'), +expand('<abuf>'))
augroup END
]]

-----------------------------------------------------------
-- Startup
-----------------------------------------------------------
-- disable builtins plugins
local disabled_built_ins = {
  "netrw",
  "netrwPlugin",
  "netrwSettings",
  "netrwFileHandlers",
  "gzip",
  "zip",
  "zipPlugin",
  "tar",
  "tarPlugin",
  "getscript",
  "getscriptPlugin",
  "vimball",
  "vimballPlugin",
  "2html_plugin",
  "logipat",
  "rrhelper",
  "spellfile_plugin",
  "matchit"
}

for _, plugin in pairs(disabled_built_ins) do
    g["loaded_" .. plugin] = 1
end

-- disable nvim intro
opt.shortmess:append "sI"
