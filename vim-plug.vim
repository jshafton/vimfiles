set nocompatible               " be iMproved
filetype off                   " required!

" documentation here --
" https://github.com/junegunn/vim-plug/

call plug#begin()

" Colors
Plug 'godlygeek/csapprox'

" Git and related
Plug 'tpope/vim-fugitive'
Plug 'gregsexton/gitv'
Plug 'idanarye/vim-merginal'

" Buffer/file browsing
Plug 'kien/ctrlp.vim'
Plug 'jeetsukumaran/vim-buffergator'
Plug 'dhruvasagar/vim-vinegar'
Plug 'scrooloose/nerdtree'
Plug 'duff/vim-bufonly'
Plug 'bufkill.vim'

" Language pack bundles
Plug 'sheerun/vim-polyglot'
Plug 'elixir-lang/vim-elixir'
Plug 'dpwright/vim-tup'
Plug 'leafo/moonscript-vim'
Plug 'jshafton/vim-node'

" UI enhancements
Plug 'vim-scripts/quickfixsigns'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'miyakogi/conoline.vim'

" General text editing, delimiter pairing
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-repeat'
Plug 'Raimondi/delimitMate'
Plug 'Align'
Plug 'junegunn/vim-easy-align'
Plug 'transpose-words'
Plug 'ReplaceWithRegister'
Plug 'tommcdo/vim-exchange'
Plug 'sk1418/Join'

" Better matching with %
Plug 'matchit.zip'
Plug 'ruby-matchit'

" Commenting, auto-completion, general syntax
Plug 'tComment'
Plug 'scrooloose/syntastic'

" Mark-down
Plug 'timcharper/textile.vim'

" General ruby
Plug 'tpope/vim-bundler'
Plug 'tpope/vim-rbenv'

" Web development
Plug 'tpope/vim-rails'
Plug 'hallison/vim-ruby-sinatra'

Plug 'cakebaker/scss-syntax.vim'
Plug 'groenewege/vim-less'
Plug 'wavded/vim-stylus'
Plug 'itspriddle/vim-jquery'
Plug 'mattn/emmet-vim'
Plug 'Valloric/MatchTagAlways'

" Badass undo history
Plug 'sjl/gundo.vim'

" Quick intra-buffer navigation
Plug 'justinmk/vim-sneak'

" Tag navigation / display
Plug 'majutsushi/tagbar'

" Awesome paste history
Plug 'vim-scripts/YankRing.vim'

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
Plug 'AutoTag'
Plug 'tpope/vim-abolish'
Plug 'osyo-manga/vim-over'

" SQL
Plug 'dbext.vim'
Plug 'exu/pgsql.vim'

" DevOps
Plug 'chase/vim-ansible-yaml'

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

" Async command execution
Plug 'tpope/vim-dispatch'

" Mac-only bundles
let os=substitute(system('uname'), '\n', '', '')
if os == 'Darwin' || os == 'Mac'
  " note taking
  Plug 'xolox/vim-misc'
  Plug 'xolox/vim-notes'
  Plug 'vimwiki/vimwiki'

  " awesome (but complicated) tab completion
  if v:version < 703
    Plug 'Valloric/YouCompleteMe', { 'do': './install.sh' }
  endif

  " Look up stuff in Dash / the internets
  Plug 'Keithbsmiley/investigate.vim'

  " Required for gist interaction
  Plug 'mattn/webapi-vim'
  " Upload stuff to gisthub.com
  Plug 'mattn/gist-vim'

  " ui enhancements
  Plug 'bling/vim-airline'

  " run a shell in a Vim buffer
  Plug 'lrvick/Conque-Shell'
endif

call plug#end()
