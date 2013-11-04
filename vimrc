" avoiding annoying CSApprox warning message
let g:CSApprox_verbose_level = 0

" necessary on some Linux distros
filetype on
filetype off

" Use Vim settings, rather then Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible

" Load all bundles
runtime vundle.vim
let g:vundle_default_git_proto = 'ssh'

" Reprocess this file if it's saved
if has("autocmd")
  autocmd! bufwritepost vimrc source $MYVIMRC
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
set number      "add line numbers
set showbreak=...
set nowrap linebreak nolist

let mapleader = ","

" show whitespace with a hotkey
set listchars=tab:>-,trail:·,eol:$
nmap <silent> <leader>ws :set nolist!<CR>

" set the leader timeout to a short interval (defaults to 1 sec)
set timeout timeoutlen=500 ttimeoutlen=100

" get out of insert mode w/ shift-enter, or jk
inoremap <S-CR> <Esc>
inoremap jk <Esc>
inoremap JK <Esc>

" use tab for switching back and for between prev buffer
nnoremap <Tab> <C-^>

" open/close buffer list with enter
nnoremap <Enter> :BuffergatorToggle<CR>

" other buffergator config
let g:buffergator_viewport_split_policy = 'T'   " default buffer window on the top
let g:buffergator_sort_regime           = 'mru' " sort buffers by most recently used
let g:buffergator_split_size            = 5

" close other buffers
nnoremap <leader>co :BufOnly!<CR>

" use H to go to begin of line and L to go to end of line
noremap H ^
noremap L g_

" mapping for command key to map navigation thru display lines instead
" of just numbered lines
vmap <D-j> gj
vmap <D-k> gk
vmap <D-4> g$
vmap <D-6> g^
vmap <D-0> g^
nmap <D-j> gj
nmap <D-k> gk
nmap <D-4> g$
nmap <D-6> g^
nmap <D-0> g^

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

" CtrlP configuration
let g:ctrlp_user_command = ['.git/', 'cd %s && git ls-files --exclude-standard -co']
let g:ctrlp_map = '<D-p>'
let g:ctrlp_match_window_bottom = 0
let g:ctrlp_match_window_reversed = 0
let g:ctrlp_max_height = 15
map <D-u> :CtrlPBuffer<CR>
map <D-\> :CtrlPBufTag<CR>
map <D-\|> :CtrlPTag<CR>
map <D-C> :CtrlPChange<CR>

" TagBar configuration
map <F9> :TagbarToggle<CR>
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

if has("gui_running")
  set t_Co=256 " tell the term has 256 colors

  colorscheme Monokai-Refined

  if has("gui_gnome")
    set term=gnome-256color
    set guifont=Monospace\ Bold\ 10
  endif

  if has("gui_win32") || has("gui_win32s")
    set guifont=Consolas:h12
    set enc=utf-8
  endif
else
  " dont load csapprox if there is no gui support - silences an annoying warning
  let g:CSApprox_loaded = 1

  if $COLORTERM == 'gnome-terminal'
    set term=gnome-256color
  else
    colorscheme Monokai-Refined
  endif
endif

" show/hide NERDtre
silent! nmap <silent> <leader>p :NERDTreeFind<CR>

" toggle search higlight with space
nnoremap <space> :set hlsearch! hlsearch?<cr>

" map Q to something useful
noremap Q gq

" bindings for ragtag
inoremap <M-o> <Esc>o
inoremap <C-j> <Down>
let g:ragtag_global_maps = 1

" == Syntastic configuration
let g:syntastic_mode_map = { 'mode': 'active',
                            \ 'active_filetypes': ['ruby', 'coffee', 'javascript', 'json'],
                            \ 'passive_filetypes': ['puppet'] }

" key mapping for vimgrep result navigation
map <A-o> :copen<CR>
map <A-q> :cclose<CR>
map <A-j> :cnext<CR>
map <A-k> :cprevious<CR>

" key mapping for Gundo
nnoremap <F5> :GundoToggle<CR>

" visual search mappings
function! s:VSetSearch()
  let temp = @@
  norm! gvy
  let @/ = '\V' . substitute(escape(@@, '\'), '\n', '\\n', 'g')
  let @@ = temp
endfunction
vnoremap * :<C-u>call <SID>VSetSearch()<CR>//<CR>zz
vnoremap # :<C-u>call <SID>VSetSearch()<CR>??<CR>zz

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

function! MoveFunction(newname)
  " get the current file name
  let a:oldname = expand("%:p")
  " save under the new name
  exec "saveas " . a:newname
  " delete the old file
  call delete(a:oldname)
endfunction
command! -nargs=1 MoveTo call MoveFunction(<f-args>)

" key mapping for window navigation
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

" easy window quit
nnoremap <Leader>q :q<CR>

" easy buffer wipe
nnoremap <C-b> :bw!<cr>

" easy window focus (closes all others)
nnoremap <Leader>f <C-W>o

" close all open buffers
nnoremap <Leader>bwa :%bw!<CR>:bw!<CR>:bufdo bw!<CR>

" easy splits
nnoremap <bar> :vsplit<CR><C-W><C-L>
nnoremap _ :split<CR><C-W><C-J>

" key mapping for saving file
nmap <C-s> :w<CR>

" key mapping for textmate-like indentation
nmap <D-[> <<
nmap <D-]> >>
vmap <D-[> <gv
vmap <D-]> >gv

let ScreenShot = {'Icon':0, 'Credits':0, 'force_background':'#FFFFFF'}

" == DbExt configuration ==
" -- profiles
let g:dbext_default_type                    = 'PGSQL'
let g:dbext_default_profile_Local_N360      = 'type=PGSQL:host=localhost:dbname=network360_development'
let g:dbext_default_profile_Staging_N360    = 'type=PGSQL:host=stagingdb01:dbname=network360:user=jshafton:passwd=xxx'
let g:dbext_default_profile_Production_N360 = 'type=PGSQL:host=proddb01.arsalon:dbname=network360:user=jshafton:passwd=xxx'
let g:dbext_default_profile_Triscuit_sqsh   = 'type=SQLSRV:user=jshafton:passwd=@askg:host=triscuit:SQLSRV_bin=sqsh:SQLSRV_cmd_options=:extra=-Striscuit -D Network360 -w 9999999'
let g:dbext_default_profile_Strenuus5_sqsh  = 'type=SQLSRV:user=jshafton:passwd=@askg:host=strenuus5:SQLSRV_bin=sqsh:SQLSRV_cmd_options=:extra=-Sstrenuus5 -D Network360 -w 9999999'
let g:dbext_default_profile                 = 'Local_N360'

" -- results buffer
let g:dbext_default_buffer_lines          = 20
let g:dbext_default_use_sep_result_buffer = 1
let g:dbext_display_command_line          = 1

" -- misc config
let g:dbext_default_always_prompt_for_variables = -1 " never prompt for variables

" set file type for Postgres for SQL files
au BufNewFile,BufRead *.sql set ft=pgsql

function! YRRunAfterMaps()
  " make Y consistent with C and D (yank to end of line)
  nnoremap Y :<C-U>YRYankCount 'y$'<CR>

  " Paste intelligently by default
  nnoremap p :<C-U>YRPaste 'p'<CR>v`]=`]
  nnoremap P :<C-U>YRPaste 'P'<CR>v`]=`]

  " Option p/P to paste raw
  nnoremap π :<C-U>YRPaste 'p'<CR>
  nnoremap ∏ :<C-U>YRPaste 'P'<CR>
endfunction

" == Bubble text (requires unimpaired plugin) ==
" -- Bubble single lines
nmap <D-Up> [e
nmap <D-Down> ]e
" -- Bubble multiple lines
vmap <D-Up> [egv
vmap <D-Down> ]egv

" duplicate selected text
vnoremap <D-d> y`>p

" transpose words configuration
nmap gs <Plug>Transposewords

" visually select the text that was last edited/pasted
nmap gV `[v`]

" shortcut for selecting the last selection
nnoremap <Leader>v gv

" expand %% to full directory path in command line
cnoremap %% <C-R>=expand('%:h').'/'<cr>

" copy current file path to the system clipboard
nmap <leader>cfp :let @* = expand("%")<CR>

" == YankRing mapping
nnoremap <Leader>yr :YRShow<CR>
nnoremap <Leader>yrs :YRSearch<space>

" == Highlight current line for graphical VIM <-- THIS SLOWED THINGS DOWN!
" set cul
"hi CursorLine term=none cterm=none ctermbg=3

" edit this file!
nnoremap <leader>ev :e ~/.vim/vimrc<cr>

" command for saving when you don't have permission
command! W :execute ':silent w !sudo tee % > /dev/null' | :edit!

" always focus search terms
nnoremap n nzz
nnoremap N Nzz

" open a Quickfix window for the last search.
nnoremap <silent> <leader>? :execute 'vimgrep /'.@/.'/g %'<CR>:copen<CR>

" EasyMotion - use s/S for searching
nmap s <leader><leader>f
nmap S <leader><leader>F
vmap s <leader><leader>f

" Replace current word in file
nmap <leader>R :%s/<C-R><C-W>/<C-R><C-W><C-F>vb

" turn off diff formatting
noremap <leader>do :set nodiff fdc=0 \| norm zR<CR><C-W>h:bwipeout<CR>

" show relative line numbers in normal mode for easy movement
if exists('+relativenumber')
  function! g:ToggleNuMode()
    if(&rnu == 1)
      set nu
    else
      set rnu
    endif
  endfunc
  nnoremap <leader>ln :cal g:ToggleNuMode()<cr>

  autocmd InsertEnter * setl nu
  autocmd InsertLeave * setl rnu
  autocmd WinLeave *
        \ if &rnu==1 |
        \ exe "setl norelativenumber" |
        \ exe "setl nu" |
        \ endif
  autocmd WinEnter *
        \ if &rnu==0 |
        \ exe "setl rnu" |
        \ endif
endif

" find current word in project using Ag
nnoremap <leader>u :Ag! '\b<C-R><C-W>\b'<cr>
nnoremap <leader>F :Ag! -i<SPACE>

" Fugitive short-cuts
nnoremap <S-CR> :Gstatus<CR>
nnoremap <leader>gs :Gstatus<CR>
nnoremap <leader>gc :Gcommit<CR>
nnoremap <leader>gb :Gblame<CR>
nnoremap <leader>gd :Gdiff<CR>
" i love cock"
nnoremap <leader>gr :Gread<CR>
nnoremap <leader>gw :Gwrite<CR>
nnoremap <leader>gp :Git push<CR>

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
  " sweet statusline indicators
  let g:airline_powerline_fonts = 1

  " Disable MacVim's default mac-like cmd key bindings
  let g:macvim_skip_cmd_opt_movement = 1
endif

" Comment lines with cmd+/
map <d-/> :TComment<cr>
vmap <d-/> :TComment<cr>gv

" Snippets

" Configuration below is to allow harmony between UltiSnips and YouCompleteMe
" credit goes here: http://stackoverflow.com/a/18685821
function! g:UltiSnips_Complete()
  call UltiSnips_ExpandSnippet()
  if g:ulti_expand_res == 0
    if pumvisible()
      return "\<C-n>"
    else
      call UltiSnips_JumpForwards()
      if g:ulti_jump_forwards_res == 0
        return "\<TAB>"
      endif
    endif
  endif
    return ""
endfunction

au BufEnter * exec "inoremap <silent> " . g:UltiSnipsExpandTrigger . " <C-R>=g:UltiSnips_Complete()<cr>"

let g:UltiSnipsJumpForwardTrigger = "<tab>"
let g:UltiSnipsListSnippets       = "<c-e>"

" Persistent undo
set undofile
set undodir=~/.vim/.undo
