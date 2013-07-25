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

" Reprocess this file if it's saved, and reload the vim-powerline bar
" since it's colors get fux0red after saving
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
set ignorecase  "case-insensitive searching

set gdefault    "default replace to global (rather than first instance)

set number      "add line numbers
set showbreak=...
set wrap linebreak nolist

" set the leader to something reasonable
let mapleader = ","

" show whitespace with a hotkey
set listchars=tab:>-,trail:·,eol:$
nmap <silent> <leader>ws :set nolist!<CR>

" set the leader timeout to a short interval (defaults to 1 sec)
set timeout timeoutlen=500 ttimeoutlen=100

" map for shift-enter to get out of insert mode
inoremap <S-CR> <Esc>
inoremap jk <Esc>
inoremap JK <Esc>

" insert blank line above/below cursor
nnoremap <silent><D-CR> :set paste<CR>m`o<Esc>``:set nopaste<CR>
nnoremap <silent><D-K> :set paste<CR>m`O<Esc>``:set nopaste<CR>

" use tab and shift-tab to switch between buffers
nnoremap <Tab> :bnext<CR>
nnoremap <S-Tab> :bprev<CR>

" open/close buffer list with enter
nnoremap <Enter> :BuffergatorToggle<CR>

" other buffergator config
let g:buffergator_viewport_split_policy='T' " default buffer window on the top
let g:buffergator_sort_regime='mru'         " sort buffers by most recently used
let g:buffergator_split_size=5

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

" indent settings
set shiftwidth=2
set softtabstop=2
set tabstop=2
set expandtab
set autoindent

" folding settings
set foldmethod=manual   "manual folding for performance
set foldnestmax=3       "deepest fold is 3 levels
set nofoldenable        "dont fold by default

set wildmode=list:longest   "make cmdline tab completion similar to bash
set wildmenu                "enable ctrl-n and ctrl-p to scroll thru matches
set wildignore=*.o,*.obj,*~,**/compiled/**,**/vendor/** "stuff to ignore when tab completing

set formatoptions-=o "dont continue comments when pushing o/O

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
map <D-t> :CtrlPTag<CR>

if has("gui_running")
    "tell the term has 256 colors
    set t_Co=256

    colorscheme darkspectrum

    if has("gui_gnome")
        set term=gnome-256color
        set guifont=Monospace\ Bold\ 12
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
        colorscheme darkspectrum
    endif
endif

silent! nmap <silent> <Leader>p :NERDTreeToggle<CR>

" clear the highlight as well as redraw
silent! nnoremap <leader><space> :nohl<CR>:redraw<CR>

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
    let _s=@/
    let l = line(".")
    let c = col(".")
    " Do the business:
    %s/\s\+$//e
    " Clean up: restore previous search history, and cursor position
    let @/=_s
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

" Easy window focus (closes all others)
nnoremap <Leader>f <C-W>o

" Close all open buffers
nnoremap <Leader>bwa :%bw!<CR>:bw!<CR>:bufdo bw!<CR>

" key mapping for saving file
nmap <C-s> :w<CR>

" Key mapping for textmate-like indentation
nmap <D-[> <<
nmap <D-]> >>
vmap <D-[> <gv
vmap <D-]> >gv

let ScreenShot = {'Icon':0, 'Credits':0, 'force_background':'#FFFFFF'}

" Enabling Zencoding
let g:user_zen_settings = {
  \  'php' : {
  \    'extends' : 'html',
  \    'filters' : 'c',
  \  },
  \  'xml' : {
  \    'extends' : 'html',
  \  },
  \  'haml' : {
  \    'extends' : 'html',
  \  },
  \  'erb' : {
  \    'extends' : 'html',
  \  },
 \}

" == DbExt configuration ==
" -- profiles
let g:dbext_default_type                    = 'PGSQL'
let g:dbext_default_profile_Local_N360      = 'type=PGSQL:host=localhost:dbname=network360_development'
let g:dbext_default_profile_Staging_N360    = 'type=PGSQL:host=stagingdb01:dbname=network360:user=jshafton:passwd=xxx'
let g:dbext_default_profile_Production_N360 = 'type=PGSQL:host=proddb01.arsalon:dbname=network360:user=jshafton:passwd=xxx'
let g:dbext_default_profile                 = 'Local_N360'

" -- results buffer
let g:dbext_default_buffer_lines = 10
let g:dbext_default_use_sep_result_buffer = 1

" -- misc config
let g:dbext_default_always_prompt_for_variables = -1 " never prompt for variables

" Syntax highlighting
au BufNewFile,BufRead *.sql setf pgsql
au BufEnter,BufNewFile *.sql,result-* colorscheme railscasts2
au BufLeave *.sql,result-* colorscheme darkspectrum

function! YRRunAfterMaps()
  " make Y consistent with C and D
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

" Duplicate selected text
vnoremap <D-d> y`>p

" Transpose words configuration
nmap gs <Plug>Transposewords

" Visually select the text that was last edited/pasted
nmap gV `[v`]

" Shortcut for selecting the last selection
nnoremap <Leader>v gv

" Expand %% to full directory path in command line
cnoremap %% <C-R>=expand('%:h').'/'<cr>

" == YankRing mapping
nnoremap <Leader>yr :YRShow<CR>
nnoremap <Leader>yrs :YRSearch<space>

" == Highlight current line for graphical VIM <-- THIS SLOWED THINGS DOWN!
" set cul
"hi CursorLine term=none cterm=none ctermbg=3

" == Taglist plugin configuration
nnoremap <D-\> :TlistToggle<CR>
let Tlist_Auto_Update = 1
let Tlist_GainFocus_On_ToggleOpen = 1
let Tlist_Close_On_Select = 1

" Edit this file!
nnoremap <leader>ev :e ~/.vim/vimrc<cr>

" Command for saving when you don't have permission
command! W :execute ':silent w !sudo tee % > /dev/null' | :edit!

" Always focus search terms
nnoremap n nzz
nnoremap N Nzz

" Open a Quickfix window for the last search.
nnoremap <silent> <leader>? :execute 'vimgrep /'.@/.'/g %'<CR>:copen<CR>

" EasyMotion - use s/S for searching
let g:EasyMotion_leader_key = '<SPACE>'
nmap s <SPACE><SPACE>f
nmap S <SPACE><SPACE>F
vmap s <SPACE><SPACE>f

" Turn off diff formatting
noremap <leader>do :set nodiff fdc=0 \| norm zR<CR><C-W>h:bwipeout<CR>

" Show relative line numbers in normal mode for easy movement
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

" Find current word in project using Ag
nnoremap <leader>u :Ag! <C-R><C-W><cr>
nnoremap <leader>F :Ag! -i<SPACE>

" Fugitive short-cuts
nnoremap <leader>gs :Gstatus<CR>
nnoremap <S-CR> :Gstatus<CR>
nnoremap <leader>gc :Gcommit<CR>
nnoremap <leader>gd :Gdiff<CR>

" DelimitMate config
let delimitMate_expand_cr = 1

" Use . to repeat last command over a visual range
vnoremap . :normal .<CR>

" Use the @q macro over a visual range
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
