set nocompatible               " be iMproved
filetype off                   " required!

set rtp+=~/.vim/bundle/Vundle.vim/
call vundle#rc()

" let Vundle manage Vundle
" required!
Plugin 'gmarik/Vundle.vim'

" Git and related
Plugin 'tpope/vim-fugitive.git'
Plugin 'gregsexton/gitv.git'
Plugin 'idanarye/vim-merginal.git'

" Buffer/file browsing
Plugin 'kien/ctrlp.vim.git'
Plugin 'jlanzarotta/bufexplorer'
Plugin 'jeetsukumaran/vim-buffergator.git'
Plugin 'tpope/vim-vinegar'
Plugin 'duff/vim-bufonly'
Plugin 'bufkill.vim'

" Language pack bundles
Plugin 'sheerun/vim-polyglot.git'

" UI enhancements
Plugin 'vim-scripts/quickfixsigns.git'
Plugin 'nathanaelkane/vim-indent-guides.git'
Plugin 'tomasr/molokai'

" General text editing, delimiter pairing
Plugin 'tpope/vim-surround.git'
Plugin 'tpope/vim-unimpaired.git'
Plugin 'tpope/vim-endwise.git'
Plugin 'tpope/vim-repeat.git'
Plugin 'Raimondi/delimitMate.git'
Plugin 'Align'
Plugin 'junegunn/vim-easy-align'
Plugin 'transpose-words'
Plugin 'ReplaceWithRegister'
Plugin 'tommcdo/vim-exchange.git'
Plugin 'sk1418/Join.git'

" Better matching with %
Plugin 'matchit.zip'
Plugin 'ruby-matchit'

" Commenting, auto-completion, general syntax
Plugin 'tComment'
Plugin 'scrooloose/syntastic.git'

" Mark-down
Plugin 'timcharper/textile.vim.git'

" General ruby
Plugin 'tpope/vim-bundler.git'
Plugin 'tpope/vim-rbenv'

" Web development
Plugin 'tpope/vim-rails.git'
Plugin 'hallison/vim-ruby-sinatra.git'

Plugin 'cakebaker/scss-syntax.vim.git'
Plugin 'groenewege/vim-less.git'
Plugin 'wavded/vim-stylus.git'
Plugin 'itspriddle/vim-jquery.git'
Plugin 'mattn/emmet-vim.git'
Plugin 'Valloric/MatchTagAlways'

" Badass undo history
Plugin 'sjl/gundo.vim.git'

" Quick intra-buffer navigation
Plugin 'justinmk/vim-sneak.git'
Plugin 'spiiph/vim-space.git'

" Tag navigation / display
Plugin 'majutsushi/tagbar'

" Awesome paste history
Plugin 'vim-scripts/YankRing.vim.git'

" Text selection
Plugin 'kana/vim-textobj-user'
" ar, ir
Plugin 'nelstrom/vim-textobj-rubyblock'
" aa, ia
Plugin 'vim-scripts/argtextobj.vim'
" ae, ie
Plugin 'kana/vim-textobj-entire'
" a/, i/, a?, i?
Plugin 'kana/vim-textobj-lastpat'
" al, il
Plugin 'kana/vim-textobj-line'
" ai, ii, aI, iI
Plugin 'kana/vim-textobj-indent'
" a_, i_
Plugin 'lucapette/vim-textobj-underscore'
" expand selection
Plugin 'terryma/vim-expand-region.git'
" looser searching for text objects
Plugin 'paradigm/TextObjectify.git'

" Movement through camel case and snake case words
Plugin 'bkad/CamelCaseMotion.git'

" Code searching
Plugin 'mileszs/ack.vim.git'
Plugin 'rking/ag.vim'
Plugin 'AutoTag'
Plugin 'tpope/vim-abolish.git'
Plugin 'osyo-manga/vim-over.git'

" SQL
Plugin 'dbext.vim'
Plugin 'exu/pgsql.vim'

" DevOps
Plugin 'chase/vim-ansible-yaml'

" Windows shit
Plugin 'PProvost/vim-ps1'

" Misc junk
Plugin 'ciaranm/securemodelines.git'

" Random shell helper commands
Plugin 'tpope/vim-eunuch.git'

" Session management
Plugin 'tpope/vim-obsession.git'

" Vim window management
Plugin 'milkypostman/vim-togglelist.git'

" Mac-only bundles
let os=substitute(system('uname'), '\n', '', '')
if os == 'Darwin' || os == 'Mac'
  " note taking
  Plugin 'xolox/vim-misc'
  Plugin 'xolox/vim-notes'
  Plugin 'vimwiki/vimwiki'

  " awesome (but complicated) tab completion
  Plugin 'Valloric/YouCompleteMe.git'

  " Look up stuff in Dash / the internets
  Plugin 'Keithbsmiley/investigate.vim.git'

  " Required for gist interaction
  Plugin 'mattn/webapi-vim.git'
  " Upload stuff to gist.github.com
  Plugin 'mattn/gist-vim.git'

  " Share registers across Vim instances
  Plugin 'ardagnir/united-front.git'

  " ui enhancements
  Plugin 'bling/vim-airline'

  " run a shell in a Vim buffer
  Plugin 'lrvick/Conque-Shell'
endif
