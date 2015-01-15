" avoiding annoying CSApprox warning message
let g:CSApprox_verbose_level = 0

" necessary on some Linux distros
filetype on
filetype off

" Use Vim settings, rather then Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible

" Load all bundles
runtime vim-plug.vim

" Reprocess this file if it's saved
if has("autocmd")
  autocmd! bufwritepost vimrc source $MYVIMRC
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

" show whitespace with a hotkey
set listchars=tab:>-,trail:·,eol:$

" set the leader timeout to a short interval (defaults to 1 sec)
set timeout timeoutlen=500 ttimeoutlen=100

" get out of insert mode w/ shift-enter, or jk
inoremap jk <Esc>`^
inoremap JK <Esc>`^

" use tab for switching back and for between tabs
nnoremap <Tab> :tabnext<CR>

" other buffergator config
let g:buffergator_viewport_split_policy = 'T'   " default buffer window on the top
let g:buffergator_sort_regime           = 'mru' " sort buffers by most recently used
let g:buffergator_split_size            = 5
let g:buffergator_suppress_keymaps      = 1

nnoremap gb :BuffergatorToggle<CR>

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
set ttymouse=xterm2

" hide buffers when not displayed
set hidden

" Allow netrw to remove non-empty local directories
let g:netrw_localrmdir='rm -r'

" CtrlP configuration
let g:ctrlp_extensions            = ['tag', 'buffertag', 'quickfix', 'line', 'changes']
let g:ctrlp_user_command          = ['.git/', 'cd %s && git ls-files --exclude-standard -co']
let g:ctrlp_map                   = '<C-p>'
let g:ctrlp_match_window_bottom   = 0
let g:ctrlp_match_window_reversed = 0
let g:ctrlp_max_height            = 15
let g:ctrlp_dont_split            = 'NERD\|help\|quickfix'

nnoremap <leader>p :CtrlP<CR>
nnoremap <leader>t :CtrlPBufTag<CR>

nnoremap ∫ :CtrlPBuffer<CR> " alt-b
nnoremap « :CtrlPBufTag<CR> " alt-|
nnoremap ¬ :CtrlPLine %<CR> " alt-l

let g:ctrlp_buftag_types = {
      \ 'javascript' : '--language-force=js',
      \ 'coffee'     : '--language-force=coffee',
      \ }

" NERDTree
nnoremap gnt :NERDTreeToggle<CR>
nnoremap gnf :NERDTreeFind<CR>

" Disable default Ctrl-j and Ctrl-k mappings for these
" commands since they're used for window switching
let g:NERDTreeMapJumpNextSibling = ''
let g:NERDTreeMapJumpPrevSibling = ''

" TagBar configuration
map gtb :TagbarToggle<CR>
let g:tagbar_type_coffee = {
    \ 'ctagstype' : 'coffee',
    \ 'kinds'     : [
        \ 'c:classes',
        \ 'm:methods',
        \ 'f:functions',
        \ 'v:variables',
        \ 'f:fields',
        \ 'f:static fields',
    \ ]
\ }

" sweet statusline indicators
let g:airline_powerline_fonts                      = 1
let g:airline#extensions#tabline#enabled           = 1
let g:airline#extensions#tabline#tab_min_count     = 2
let g:airline#extensions#tabline#tab_nr_type       = 1 " tab number
let g:airline#extensions#tabline#show_close_button = 0
let g:airline#extensions#tabline#show_buffers      = 0
let g:airline_theme                                = 'hybrid'

set t_Co=256 " tell the term has 256 colors
set enc=utf-8
colorscheme molokai

if has("gui_running")
  if has("gui_gnome")
    set term=gnome-256color
    set guifont=Monospace\ Bold\ 10
  endif

  if has("gui_win32") || has("gui_win32s")
    set guifont=Consolas:h12
  endif
else
  " dont load csapprox if there is no gui support - silences an annoying warning
  let g:CSApprox_loaded = 1

  if $COLORTERM == 'gnome-terminal'
    set term=gnome-256color
  endif

  " Switch cursor shape correctly in tmux > iterm2 > osx
  if $TMUX != ''
    let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
    let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
  endif
endif

" map Q to something useful
nnoremap Q @@
vnoremap Q :normal @@<CR>

" bindings for ragtag
inoremap <M-o> <Esc>o
inoremap <C-j> <Down>
let g:ragtag_global_maps = 1

" == Syntastic configuration
let g:syntastic_mode_map = { 'mode': 'active',
                            \ 'active_filetypes': ['ruby', 'coffee', 'javascript', 'json'],
                            \ 'passive_filetypes': ['puppet', 'html', 'handlebars'] }

let g:syntastic_always_populate_loc_list = 1

" When set to 2 the cursor will jump to the first issue detected, but only if
" this issue is an error. >
let g:syntastic_auto_jump = 2

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

" easy window quit
nnoremap <Leader>q :q<CR>

" buffkill configuration
let g:BufKillFunctionSelectingValidBuffersToDisplay = 'auto'

" easy buffer wipe
nnoremap <C-b> :BW!<cr>

" close all open buffers
nnoremap <Leader>bwa ::BW!<CR>:bufdo BW!<CR>

" easy window focus (closes all others)
nnoremap <Leader>f <C-W>o

" easy splits
nnoremap <bar> :vsplit<CR><C-W><C-L>
nnoremap _ :split<CR><C-W><C-J>

" tabs
nnoremap † :tabnew<CR> " alt-s
nnoremap ¡ 1gt         " alt-1
nnoremap ™ 2gt         " alt-2
nnoremap £ 3gt         " alt-3
nnoremap ¢ 4gt         " alt-4
nnoremap ∞ 5gt         " alt-5

" key mapping for saving file
noremap <leader>s :w<CR>
noremap ß :w<CR> " alt-s

let ScreenShot = {'Icon':0, 'Credits':0, 'force_background':'#FFFFFF'}

" == DbExt configuration ==
let g:rails_no_dbext = 1

" -- profiles
let g:dbext_default_type                     = 'PGSQL'
let g:dbext_default_profile_Local_N360       = 'type=PGSQL:host=localhost:dbname=network360_development'
let g:dbext_default_profile_Staging_N360     = 'type=PGSQL:host=stagingdb01:dbname=network360:user=jshafton:passwd=xxx'
let g:dbext_default_profile_AWSStaging_N360  = 'type=PGSQL:host=aws-stagingdb01:dbname=network360:user=jshafton:passwd=xxx'
let g:dbext_default_profile_Production_N360  = 'type=PGSQL:host=proddb01.arsalon:dbname=network360:user=jshafton:passwd=xxx'
let g:dbext_default_profile_Production2_N360 = 'type=PGSQL:host=proddb02.arsalon:dbname=network360:user=jshafton:passwd=xxx'
let g:dbext_default_profile_Triscuit_sqsh    = 'type=SQLSRV:user=jshafton:passwd=@askg:host=triscuit:SQLSRV_bin=sqsh:SQLSRV_cmd_options=:extra=-Striscuit -D Network360 -w 9999999'
let g:dbext_default_profile_Strenuus5_sqsh   = 'type=SQLSRV:user=jshafton:passwd=@askg:host=strenuus5:SQLSRV_bin=sqsh:SQLSRV_cmd_options=:extra=-Sstrenuus5 -D Network360 -w 9999999'
let g:dbext_default_profile                  = 'Local_N360'

" -- results buffer
let g:dbext_default_buffer_lines          = 20
let g:dbext_default_use_sep_result_buffer = 1
let g:dbext_display_command_line          = 1

" -- misc config
let g:dbext_default_always_prompt_for_variables = -1 " never prompt for variables

" set up autocompletion for SQL
autocmd FileType sql set omnifunc=sqlcomplete#Complete
autocmd FileType pgsql set omnifunc=sqlcomplete#Complete

" set file type for Postgres for SQL files
au BufNewFile,BufRead *.sql set ft=pgsql

" set file type for sneaky Handlebars files
au BufNewFile,BufRead *.hbs.html set ft=handlebars

" set file type for sneaky Slim files
au BufNewFile,BufRead *.html.slim set ft=slim

function! YRRunAfterMaps()
  " make Y consistent with C and D (yank to end of line)
  nnoremap Y :<C-U>YRYankCount 'y$'<CR>

  " in visual mode Y selects to clipboard
  xnoremap Y "*y

  " Paste intelligently by default
  nnoremap p :<C-U>YRPaste 'p'<CR>v`]=`]
  nnoremap P :<C-U>YRPaste 'P'<CR>v`]=`]

  " Option p/P to paste raw
  nnoremap π :<C-U>YRPaste 'p'<CR>
  nnoremap ∏ :<C-U>YRPaste 'P'<CR>
endfunction

" use CTRL-v to paste in insert mode
set pastetoggle=<F10>
inoremap <C-v> <F10><C-r>*<F10>

" transpose words configuration
nmap gs <Plug>Transposewords

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

" == YankRing
let g:yankring_max_history = 1000
let g:yankring_replace_n_pkey = '¯'
let g:yankring_replace_n_nkey = '˘'

" duplicate selected text
vnoremap ∂ y`>p " alt-d

nnoremap gyr :YRShow<CR>
nnoremap gy/ :YRSearch<space>

" == Highlight current line for graphical VIM <-- THIS SLOWED THINGS DOWN!
" set cul
"hi CursorLine term=none cterm=none ctermbg=3

" Cursorline highlighting
let g:conoline_auto_enable = 1

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

" open a Quickfix window for the last search.
nnoremap <silent> <leader>? :execute 'vimgrep /'.@/.'/g %'<CR>:copen<CR>

" Sneak configuration
let g:sneak#use_ic_scs = 1
let g:sneak#streak = 1
let g:sneak#f_reset = 1
let g:sneak#t_reset = 1

" Replace current word in file
nmap <leader>R :%s/<C-R><C-W>/<C-R><C-W><C-F>vb

" turn off diff formatting
noremap <leader>do :set nodiff fdc=0 \| norm zR<CR><C-W>h:bwipeout<CR>

" find current word in project using Ag
nnoremap gu :Ag! '\b<C-R><C-W>\b'<cr>

" find in files
nnoremap <leader>F :Ag! -i<SPACE>
nnoremap gfir :Ag! -G '\.rb' -i<SPACE>

" Fugitive short-cuts
nnoremap <leader>gs :Gstatus<CR>
nnoremap <leader>gc :Gcommit<CR>
nnoremap <leader>gb :Gblame<CR>
nnoremap <leader>gd :Gdiff<CR>
nnoremap <leader>gr :Gread<CR>
nnoremap <leader>gw :Gwrite<CR>
nnoremap <leader>gl :silent! Glog<CR>:bot copen<CR>
nnoremap <leader>gp :! git push<CR>
nnoremap <leader>grb :! git pull --rebase<CR>
nnoremap <leader>ga :! git add .<CR> " adds everything to the index
nnoremap <leader>grh :! git reset .<CR> " git reset head -- unstages everything

" GitV configuration
let g:Gitv_WipeAllOnClose = 1
let g:Gitv_DoNotMapCtrlKey = 1
nmap <leader>gv :Gitv --all<cr>
nmap <leader>gV :Gitv! --all<cr>
vmap <leader>gV :Gitv! --all<cr>

" DelimitMate config
let delimitMate_expand_cr = 1

" use . to repeat last command over a visual range
vnoremap . :normal .<CR>

" use the @q macro over a visual range
vnoremap @q :normal @q<CR>

" enable matching
runtime macros/matchit.vim

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

if has("gui_macvim")
  " Disable MacVim's default mac-like cmd key bindings
  let g:macvim_skip_cmd_opt_movement = 1

  " Comment lines with cmd+/
  map <d-/> :TComment<cr>
  vmap <d-/> :TComment<cr>gv

  " open/close buffer list with enter
  " nnoremap <D-CR> :BuffergatorToggle<CR>

  " ctrl-p shortcuts for OSX GUI
  " map <D-b> :CtrlPBuffer<CR>
  " map <D-\> :CtrlPBufTag<CR>
  " map <D-\|> :CtrlPTag<CR>
  " map <D-C> :CtrlPChange<CR>
  " map <D-l> :CtrlPLine %<CR>
  " map <D-M> :CtrlPMRUFiles<CR>

  " key mapping for textmate-like indentation
  " nmap <D-[> <<
  " nmap <D-]> >>
  " vmap <D-[> <gv
  " vmap <D-]> >gv

  " == Bubble text (requires unimpaired plugin) ==
  " -- Bubble single lines
  nmap <D-Up> [e
  nmap <D-Down> ]e
  " -- Bubble multiple lines
  vmap <D-Up> [egv
  vmap <D-Down> ]egv

  " duplicate selected text
  vnoremap <D-d> y`>p

  " Mac-like save
  map <D-s> :w<CR>
  " save all unsaved buffers
  map <D-S> :wa<CR>

  " find in files
  nnoremap <D-F> :Ag! -i<SPACE>
endif

" Comment to the right
nmap gcr :TCommentRight<CR>

" Inline comment selection
vmap gci :TCommentInline<CR>

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

" Gist configuration
let g:gist_detect_filetype         = 1
let g:gist_show_privates           = 1
let g:gist_post_private            = 1
let g:gist_update_on_write         = 2 " Only :w! updates a gist.
let g:gist_open_browser_after_post = 1

" investigate.vim
let g:investigate_use_dash=1

" toggle quickfix/location list
let g:toggle_list_no_mappings=1
nnoremap tqf :call ToggleQuickfixList()<CR>
nnoremap tll :call ToggleLocationList()<CR>

" notes configuration
let g:notes_directories = ['~/Dropbox/Notes']
let g:notes_title_sync = 'rename_file'
let g:notes_suffix = '.md'

" vimwiki configuration
let wiki = {}
let wiki.path = '~/Dropbox/VimWiki/'
let wiki.nested_syntaxes = {'python': 'python', 'sh': 'sh', 'ruby': 'ruby', 'scala': 'scala', 'pg': 'pgsql'}
let g:vimwiki_list = [wiki]

" conque-shell configuration
let g:ConqueTerm_ReadUnfocused = 1
let g:ConqueTerm_InsertOnEnter = 0
let g:ConqueTerm_CWInsert = 1
