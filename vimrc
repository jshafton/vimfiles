"Based on Vim patch 7.4.1770 (`guicolors` option) < https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd >
" < https://github.com/neovim/neovim/wiki/Following-HEAD#20160511 >
if (has("termguicolors"))
  " This is only necessary if you use "set termguicolors".
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
  let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
  let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"

  " fixes glitch? in colors when using vim with tmux
  set background=dark
  set t_Co=256

  set termguicolors
endif

" avoiding annoying CSApprox warning message
let g:CSApprox_verbose_level = 0

" necessary on some Linux distros
filetype on
filetype off

" Use Vim settings, rather then Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible

" Faster update times for git gutter and others
set updatetime=100

" Cursorline highlighting
let g:conoline_auto_enable = 1

" Disable vim-polyglot markdown in favor of better one
" NOTE: must be defined prior to loading vim-polyglot
let g:polyglot_disabled = ['markdown']

" sweet statusline indicators
let g:airline_powerline_fonts                      = 1
let g:airline#extensions#tabline#enabled           = 1
let g:airline#extensions#tabline#show_splits       = 0
let g:airline#extensions#tabline#tab_min_count     = 2
let g:airline#extensions#tabline#tab_nr_type       = 1 " tab number
let g:airline#extensions#tabline#show_close_button = 0
let g:airline#extensions#tabline#show_buffers      = 0
let g:airline#extensions#fzf#enabled               = 1
let g:airline_theme                                = 'dracula'

" ale linter settings
let g:ale_lint_on_enter = 1
let g:ale_lint_on_text_changed = 'always'
let g:ale_completion_enabled = 1
let g:airline#extensions#ale#enabled = 1

let g:ale_set_loclist = 1
let g:ale_set_quickfix = 0

" Disable default Ctrl-j and Ctrl-k mappings for these
" commands since they're used for window switching
let g:NERDTreeMapJumpNextSibling = ''
let g:NERDTreeMapJumpPrevSibling = ''

" Load all bundles
source ~/.vim/vim-plug.vim

" Reprocess this file if it's saved
if has("autocmd")
  autocmd! bufwritepost vimrc source $MYVIMRC | AirlineRefresh | AirlineToggle | AirlineToggle
endif
if has("autocmd")
  autocmd! bufwritepost vim-plug.vim source ~/.vim/vim-plug.vim | PlugInstall
endif

" Disable backup and swap files - more trouble than they're worth
set nobackup
set noswapfile

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

" store lots of :cmdline history
set history=1000

set showcmd     "show incomplete cmds down the bottom
set showmode    "show current mode down the bottom
set incsearch   "find the next match as we type the search
set hlsearch    "hilight searches by default
set ignorecase  "case-insensitive searching ...
set smartcase   "unless an uppercase is provided
set gdefault    "default replace to global (rather than first instance)
set showbreak=...
set nowrap linebreak nolist
set lazyredraw  " don't redraw during complex operations

" use vim's 'hybrid line number' method
set relativenumber
set number
let mapleader = ","
let g:maplocalleader = '\'

" show whitespace with a hotkey
set listchars=tab:>-,trail:·,eol:$

" set the leader timeout to a short interval (defaults to 1 sec)
set timeout timeoutlen=500 ttimeoutlen=100

" get out of insert mode w/ shift-enter, or jk
inoremap jk <Esc>`^
inoremap JK <Esc>`^

" close other buffers
nnoremap <leader>co :BufOnly!<CR>

" use H to go to begin of line and L to go to end of line
noremap H ^
noremap L g_

" add some line space for easy reading
set linespace=4

" disable visual bell
set visualbell t_vb=

" try to make possible to navigate within lines of wrapped lines
nmap <Down> gj
nmap <Up> gk
set fo=l

set laststatus=2

" turn off needless toolbar on gvim/mvim
set guioptions-=T
" turn off needless vertical scrollbars"
set guioptions-=r
set guioptions-=l

" indent settings
set shiftwidth=2
set softtabstop=2
set tabstop=2
set expandtab
set autoindent

" folding settings
set foldmethod=manual   " manual folding for performance
set foldnestmax=3       " deepest fold is 3 levels
set nofoldenable        " dont fold by default

set wildmode=list:longest                               " make cmdline tab completion similar to bash
set wildmenu                                            " enable ctrl-n and ctrl-p to scroll thru matches
set wildignore=*.o,*.obj,*~,**/compiled/**,**/vendor/** " stuff to ignore when tab completing

set formatoptions-=o " dont continue comments when pushing o/O

" vertical/horizontal scroll off settings
set scrolloff=3
set sidescrolloff=7
set sidescroll=1

" load ftplugins and indent files
filetype plugin on
filetype indent on

" turn on syntax highlighting
syntax on

" some stuff to get the mouse going in term
set mouse=a

" hide buffers when not displayed
set hidden

" Allow netrw to remove non-empty local directories
let g:netrw_localrmdir='rm -r'
" Ignore netrw for Ctrl-^
let g:netrw_altfile = 1

" fzf history
let g:fzf_history_dir = '~/.fzf-history'

" after tmux 3.2 is released re-enable this branching logic
" if exists('$TMUX')
"   let g:fzf_layout = { 'tmux': '-p90%,60%' }
" else
" let g:fzf_layout = { 'window': { 'width': 0.9, 'height': 0.6 } }
" endif
" load fzf in a popup window
let g:fzf_layout = { 'window': { 'width': 0.9, 'height': 0.6 } }

" Use :GFiles when inside a git directory, otherwise :Files
nnoremap <expr> <C-p> (len(system('git rev-parse')) ? ':Files' : ':GFiles')."\<cr>"

" alt-b
nnoremap ∫ :Buffers<CR>
" alt-|
nnoremap « :BTags<CR>
" alt-l
nnoremap ¬ :BLines<CR>
" alt-L
nnoremap Ò :Lines<CR>
" alt-H
nnoremap ˙ :History<CR>
" alt-C 'changes'
nnoremap ç :GFiles?<CR>
" Go to open tab
nnoremap t/ :Windows<CR>

" Better command history
command! CmdHist call fzf#vim#command_history()
nnoremap q: :CmdHist<CR>

" Better search history
command! QHist call fzf#vim#search_history()
nnoremap q/ :QHist<CR>

nnoremap <leader>ht :Helptags<CR>
nnoremap <space>f :Filetypes<CR>

" file contents only (no filenames) search
command! -bang -nargs=* Fag call fzf#vim#ag(<q-args>, fzf#vim#with_preview({'options': '--delimiter : --nth 4..' }), <bang>0)
nnoremap <C-f> :Ag<CR>
" alt-f - don't include file names in search
nnoremap ƒ :Fag<CR>

" NERDTree
nnoremap gnt :NERDTreeToggle<CR>
nnoremap gnf :NERDTreeFind<CR>

" set t_Co=256 " tell the term has 256 colors
set enc=utf-8

" dont load csapprox if there is no gui support - silences an annoying warning
let g:CSApprox_loaded = 1

if $COLORTERM == 'gnome-terminal'
  set term=gnome-256color
endif

colorscheme darkspectrum

" Switch cursor shape correctly in tmux > iterm2 > osx
if $TMUX != ''
  let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
  let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
endif

" map Q to something useful
nnoremap Q @@
vnoremap Q :normal @@<CR>

" key mapping for Gundo
nnoremap <F5> :GundoToggle<CR>

" visual search mappings - find selection
function! s:VSetSearch()
  let temp = @@
  norm! gvy
  let @/ = '\V' . substitute(escape(@@, '\'), '\n', '\\n', 'g')
  let @@ = temp
endfunction
vnoremap * :<C-u>call <SID>VSetSearch()<CR>//<CR>zz
vnoremap # :<C-u>call <SID>VSetSearch()<CR>??<CR>zz

" search and replace using Over
nnoremap g/r :<c-u>OverCommandLine<cr>%s/
xnoremap g/r :<c-u>OverCommandLine<cr>%s/\%V

" jump to last cursor position when opening a file
" dont do it when writing a commit log entry
autocmd BufReadPost * call SetCursorPosition()
function! SetCursorPosition()
  if &filetype !~ 'commit\c'
    if line("'\"") > 0 && line("'\"") <= line("$")
      exe "normal! g`\""
      normal! zz
    endif
  end
endfunction

" define :HighlightLongLines command to highlight the offending parts of
" lines that are longer than the specified length (defaulting to 80)
command! -nargs=? HighlightLongLines call s:HighlightLongLines('<args>')
function! s:HighlightLongLines(width)
  let targetWidth = a:width != '' ? a:width : 79
  if targetWidth > 0
    exec 'match Todo /\%>' . (targetWidth) . 'v/'
  else
    echomsg "Usage: HighlightLongLines [natural number]"
  endif
endfunction

"  Strip trailing whitespace
function! <SID>StripTrailingWhitespaces()
  " Preparation: save last search, and cursor position.
  let _s = @/
  let l  = line(".")
  let c  = col(".")

  " Do the business:
  %s/\s\+$//e

  " Clean up: restore previous search history, and cursor position
  let @/ = _s
  call cursor(l, c)
endfunction
autocmd BufWritePre * :call <SID>StripTrailingWhitespaces()

" key mapping for window navigation
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

" easy save
nnoremap S :w<CR>
noremap  ß :w<CR> " alt-s

" easy window quit
nnoremap <Leader>q :q<CR>

" full quit
nnoremap <C-q> :qall!<CR>
nnoremap X :qall!<CR>

" buffkill configuration
" let g:BufKillFunctionSelectingValidBuffersToDisplay = 'auto'

" easy buffer wipe
nnoremap <C-x> :BW!<cr>

" close all open buffers
nnoremap <Leader>bwa ::BW!<CR>:bufdo BW!<CR>

" easy window focus (closes all others)
nnoremap <Leader>F <C-W>o

" easy splits
nnoremap <bar> :vsplit<CR><C-W><C-L>
nnoremap _ :split<CR><C-W><C-J>

" tabs
nnoremap C-t :tabnew<CR>
nnoremap g1 1gt
nnoremap g2 2gt
nnoremap g3 3gt
nnoremap g4 4gt
nnoremap g5 5gt

nnoremap J :tabprevious<CR>
nnoremap K :tabnext<CR>

" Go to last active tab
let g:lasttab = 1
au TabLeave * let g:lasttab = tabpagenr()
nnoremap <silent> <Tab> :exe "tabn ".g:lasttab<cr>
vnoremap <silent> <Tab> :exe "tabn ".g:lasttab<cr>

" set file type for Postgres for SQL files
au BufNewFile,BufRead *.sql set ft=pgsql

" set file type for sneaky Handlebars files
au BufNewFile,BufRead *.hbs.html set ft=handlebars

" set file type for sneaky Slim files
au BufNewFile,BufRead *.html.slim set ft=slim

" Paste intelligently by default
map p pv`]=`]
map P Pv`]=`]

" yank to end of line
nmap Y y$

" in visual mode Y selects to clipboard
xnoremap Y "*y

" Option p/P to paste raw
nnoremap π p
nnoremap ∏ P

" use CTRL-v to paste in insert mode
set pastetoggle=<F10>
inoremap <C-v> <F10><C-r>*<F10>

" transpose words configuration
" go-word-switch
nmap gws <Plug>Transposewords

" visually select the text that was last edited/pasted
nmap gV `[v`]

" textmate-like indentation
nnoremap ≤ <<
nnoremap ≥ >>
vmap ≤ <gv
vmap ≥ >gv

" shortcut for selecting the last selection
nnoremap <Leader>v gv

" expand %% to full directory path in command line
cnoremap %% <C-R>=expand('%:h').'/'<cr>

" copy current file path to the system clipboard
nmap <leader>cfp :let @* = expand("%")<CR>

" edit this file!
nnoremap <leader>ev :tabnew ~/.vim/vimrc<cr>
" edit bundles
nnoremap <leader>eV :tabnew ~/.vim/vim-plug.vim<cr>

" command for saving when you don't have permission
command! W :execute ':silent w !sudo tee % > /dev/null' | :edit!

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

" always focus search terms
nnoremap n nzz
nnoremap N Nzz
nnoremap * *zz
nnoremap g; g;zz

" always focus vertical movement
nnoremap } }zz
nnoremap { {zz

" open a Quickfix window for the last search.
nnoremap <silent> <leader>? :execute 'vimgrep /'.@/.'/g %'<CR>:copen<CR>

" --------------------------------------------------------------------------------
" EasyMotion configuration
" --------------------------------------------------------------------------------
let g:EasyMotion_do_mapping = 0 " Disable default mappings

" let g:EasyMotion_leader_key = '<space>'
" map <space> <Plug>(easymotion-prefix)

" Bi-directional find motion
nmap s <Plug>(easymotion-s2)
omap z <Plug>(easymotion-s2)

" Turn on case sensitive feature
let g:EasyMotion_smartcase = 1
" END - EasyMotion configuration
" --------------------------------------------------------------------------------

" Enable camel case movement motions
call camelcasemotion#CreateMotionMappings('<leader>')

" Replace current word in file
nmap <leader>R :%s/<C-R><C-W>/

" turn off diff formatting
noremap <leader>do :set nodiff fdc=0 \| norm zR<CR><C-W>h:bwipeout<CR>

" find current word in project using Ag
nnoremap gu :Ag <C-R><C-W><cr>

" Fugitive short-cuts
nnoremap <leader>gs :Git<CR>
nnoremap <leader>gc :Git commit<CR>
nnoremap <leader>gca :Git commit --amend<CR>
nnoremap <leader>gb :Git blame<CR>
nnoremap <leader>gd :Gdiffsplit<CR>
nnoremap <leader>gr :Gread<CR>
nnoremap <leader>grm :Gread master:%<CR> " checkout this file from master
nnoremap <leader>gw :Gwrite<CR>
nnoremap <leader>gl :BCommits<CR>
nnoremap <leader>gL :Commits<CR>
nnoremap <leader>gp :Git push<CR>
nnoremap <leader>gpf :Git push --force<CR>
nnoremap <leader>gpsu :! git push -u origin $(git rev-parse --abbrev-ref HEAD)<CR>
nnoremap <leader>grb :! git pull --rebase<CR>
nnoremap <leader>ga :! git add .<CR> " adds everything to the index
nnoremap <leader>grh :! git reset .<CR> " git reset head -- unstages everything

" mnemonic -- git 'pull request' to finish up a PR
nnoremap <leader>gpr :! git push -u origin $(git rev-parse --abbrev-ref HEAD) && hub pull-request --no-edit -o<CR>

" Git messenger configuration
let g:git_messenger_no_default_mappings = v:true
let g:git_messenger_include_diff        = "curent"
let g:git_messenger_always_into_popup   = v:true
nnoremap <space>g :<C-u>GitMessenger<CR>

" GitV configuration
let g:Gitv_WipeAllOnClose = 1
let g:Gitv_DoNotMapCtrlKey = 1
nmap <leader>gv :Gitv --all<cr>
nmap <leader>gV :Gitv! --all<cr>
vmap <leader>gV :Gitv! --all<cr>

" use . to repeat last command over a visual range
vnoremap . :normal .<CR>

" use the @q macro over a visual range
vnoremap @q :normal @q<CR>

" format json
nnoremap <leader>jpp :%!python -m json.tool<CR>

" tag matching for HTML/templates
let g:mta_filetypes = {
      \ 'html' : 1,
      \ 'handlebars' : 1,
      \ 'xhtml' : 1,
      \ 'xml' : 1,
      \ 'jinja' : 1,
      \}

" Comment to the right
nmap gcr :TCommentRight<CR>
" Inline comment selection
vmap gcl :TCommentInline<CR>

" Persistent undo
set undofile
set undodir=~/.vim/.undo

" Start interactive EasyAlign in visual mode
vmap <Enter> <Plug>(EasyAlign)

" Align selection based on last instance of word
vmap <Leader>aw :EasyAlign -// {'ig': []}<Left><Left><Left><Left><Left><Left><Left><Left><Left><Left><Left><Left>

" Put ; to good use! <-- have to wait for vim sneak to get updated
" https://github.com/justinmk/vim-sneak/issues/41
" https://github.com/justinmk/vim-sneak/issues/52
" nnoremap ; :

" toggle quickfix/location list
let g:toggle_list_no_mappings=1
nnoremap tqf :call ToggleQuickfixList()<CR>
nnoremap tll :call ToggleLocationList()<CR>

" include coffeescript in vim-node
let g:node#includeCoffee = 1

" surround with handlebars {{ }}
let g:surround_104 = "{{ \r }}"

" turn on rainbow parens for lisps
augroup rainbow_lisp
  autocmd!
  autocmd FileType lisp,clojure,scheme RainbowParentheses
augroup END

" vim-maximizer settings
" szw/vim-maximizer

let g:maximizer_set_default_mapping = 0
nnoremap <silent><leader>f :MaximizerToggle<CR>
vnoremap <silent><leader>f :MaximizerToggle<CR>gv

" == Bubble text (requires unimpaired plugin) ==
" -- Bubble single lines (alt-j/alt-k)
nmap ˚ [e
nmap ∆ ]e
" -- Bubble multiple lines
vmap ˚ [egv
vmap ∆ ]egv

" duplicate line (alt-d)
nmap ∂ yyπ
" duplicate text (alt-d)
vmap ∂ y`>π

" == Ansible syntax tweaks ==
let g:ansible_unindent_after_newline = 1
let g:ansible_yamlKeyName = 'yamlKey'
" let g:ansible_attribute_highlight = 'ab'
let g:ansible_name_highlight = 'b'
" let g:ansible_extra_keywords_highlight = 1

let g:ansible_template_syntaxes = {
      \ '*.rb.j2': 'ruby',
      \ '*.conf.j2': 'conf',
      \ '*.haproxy.*.j2': 'haproxy',
      \ '*.logstash.*.j2': 'logstash',
      \ '*.json.j2': 'json',
      \ '*.sh.j2': 'sh',
      \ '*.ya?ml.j2': 'yaml'
      \ }

" == End Ansible syntax tweaks ==

" 'count word' - count nr of occurrences of word under cursor
nnoremap <leader>cw :%s/<c-r><c-w>//n<cr>
