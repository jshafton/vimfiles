set nocompatible               " be iMproved
filetype off                   " required!

" documentation here --
" https://github.com/junegunn/vim-plug/
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin()

" Colors
Plug 'godlygeek/csapprox'

" Git and related
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'
Plug 'gregsexton/gitv'

" Buffer/file browsing
Plug 'ctrlpvim/ctrlp.vim'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --bin' }
Plug 'junegunn/fzf.vim'
Plug 'dhruvasagar/vim-vinegar'
Plug 'scrooloose/nerdtree'
Plug 'duff/vim-bufonly'
Plug 'vim-scripts/bufkill.vim'

" Language pack bundles
Plug 'sheerun/vim-polyglot'
Plug 'mattn/emmet-vim'
Plug 'elixir-lang/vim-elixir'
Plug 'dpwright/vim-tup'
Plug 'jshafton/vim-node'
Plug 'robbles/logstash.vim'
Plug 'Glench/Vim-Jinja2-Syntax'
Plug 'gabrielelana/vim-markdown'
Plug 'b4b4r07/vim-hcl'

" UI enhancements
Plug 'vim-scripts/quickfixsigns'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'miyakogi/conoline.vim'
Plug 'szw/vim-maximizer'

" General text editing, delimiter pairing
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-repeat'
Plug 'jiangmiao/auto-pairs'
Plug 'vim-scripts/Align'
Plug 'junegunn/vim-easy-align'
Plug 'vim-scripts/transpose-words'
Plug 'vim-scripts/ReplaceWithRegister'
Plug 'junegunn/vim-peekaboo'
Plug 'tommcdo/vim-exchange'
Plug 'sk1418/Join'
Plug 'junegunn/rainbow_parentheses.vim'

" Better matching with %
Plug 'vim-scripts/matchit.zip'
Plug 'vim-scripts/ruby-matchit'

" Commenting, auto-completion, general syntax
Plug 'vim-scripts/tComment'
Plug 'w0rp/ale'

" Mark-down
Plug 'timcharper/textile.vim'

" General ruby
Plug 'tpope/vim-bundler'
Plug 'tpope/vim-rbenv'
Plug 'ngmy/vim-rubocop'

" Web development
Plug 'tpope/vim-rails'
Plug 'cakebaker/scss-syntax.vim'
Plug 'Valloric/MatchTagAlways'

" Badass undo history
Plug 'sjl/gundo.vim'

" Quick intra-buffer navigation
Plug 'Lokaltog/vim-easymotion'
Plug 'haya14busa/vim-easyoperator-phrase'
Plug 'haya14busa/vim-easyoperator-line'

" Text selection
Plug 'kana/vim-textobj-user'
" ar, ir
Plug 'nelstrom/vim-textobj-rubyblock'
" aa, ia
Plug 'vim-scripts/argtextobj.vim'
" ae, ie
Plug 'kana/vim-textobj-entire'
" a/, i/, a?, i?
Plug 'kana/vim-textobj-lastpat'
" al, il
Plug 'kana/vim-textobj-line'
" ai, ii, aI, iI
Plug 'kana/vim-textobj-indent'
" a_, i_
Plug 'lucapette/vim-textobj-underscore'
" looser searching for text objects
Plug 'paradigm/TextObjectify'

" Movement through camel case and snake case words
Plug 'bkad/CamelCaseMotion'

" Code searching
Plug 'mileszs/ack.vim'
Plug 'rking/ag.vim'
Plug 'gabesoft/vim-ags'
Plug 'vim-scripts/AutoTag'
Plug 'tpope/vim-abolish'
Plug 'osyo-manga/vim-over'

" SQL
Plug 'vim-scripts/dbext.vim'
Plug 'exu/pgsql.vim'

" DevOps
Plug 'pearofducks/ansible-vim'
Plug 'stephpy/vim-yaml'
Plug 'pearofducks/ansible-vim'
Plug 'zimbatm/haproxy.vim'

" Windows shit
Plug 'PProvost/vim-ps1'

" Misc junk
Plug 'ciaranm/securemodelines'

" Random shell helper commands
Plug 'tpope/vim-eunuch'

" Session management
Plug 'tpope/vim-obsession'

" Vim window management
Plug 'milkypostman/vim-togglelist'
Plug 'christoomey/vim-tmux-navigator'

" Mac-only bundles
let os=substitute(system('uname'), '\n', '', '')
if os == 'Darwin' || os == 'Mac'
  " completion
  Plug 'neoclide/coc.nvim', {'branch': 'release'}

  " Look up stuff in Dash / the internets
  Plug 'Keithbsmiley/investigate.vim'

  " Required for gist interaction
  Plug 'mattn/webapi-vim'
  " Upload stuff to gisthub.com
  Plug 'mattn/gist-vim'

  " ui enhancements
  Plug 'vim-airline/vim-airline'
  Plug 'vim-airline/vim-airline-themes'

  " edit OSX plist files
  Plug 'darfink/vim-plist'

  " scratch buffer
  Plug 'mtth/scratch.vim'

  " spec handling
  Plug 'geekjuice/vim-spec'

  " scala
  " Plug 'ensime/ensime-vim'
endif

if has('nvim')
  let s:pluggedTracker = resolve(expand("~/.nvim-plug-first-run"))

  Plug 'NLKNguyen/papercolor-theme'

  " Paste history
  Plug 'bfredl/nvim-miniyank'
else
  let s:pluggedTracker = resolve(expand("~/.vim-plug-first-run"))
endif

call plug#end()

if !filereadable(s:pluggedTracker)
  echo "Installing Plugins for first time, please ignore key map error messages"
  echo ""
  :PlugInstall
  :call system('touch ' . s:pluggedTracker)
endif
