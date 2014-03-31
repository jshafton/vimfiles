set nocompatible               " be iMproved
filetype off                   " required!

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
" required!
Bundle 'gmarik/vundle'

" Git and related
Bundle 'tpope/vim-git.git'
Bundle 'tpope/vim-fugitive.git'
Bundle 'gregsexton/gitv.git'

" Required for gist interaction
Bundle 'mattn/webapi-vim.git'
" Upload stuff to gist.github.com
Bundle 'mattn/gist-vim.git'

" Look up stuff in Dash / the internets
Bundle 'Keithbsmiley/investigate.vim.git'

" Buffer/file browsing
Bundle 'kien/ctrlp.vim.git'
Bundle 'jlanzarotta/bufexplorer'
Bundle 'jeetsukumaran/vim-buffergator.git'
Bundle 'scrooloose/nerdtree.git'
Bundle 'duff/vim-bufonly'
Bundle 'bufkill.vim'

" Share registers across Vim instances
Bundle 'ardagnir/united-front.git'

" UI enhancements
Bundle 'bling/vim-airline'
Bundle 'vim-scripts/quickfixsigns.git'
Bundle 'nathanaelkane/vim-indent-guides.git'

" General text editing, delimiter pairing
Bundle 'tpope/vim-surround.git'
Bundle 'tpope/vim-unimpaired.git'
Bundle 'tpope/vim-endwise.git'
Bundle 'tpope/vim-repeat.git'
Bundle 'Raimondi/delimitMate.git'
Bundle 'Align'
Bundle 'junegunn/vim-easy-align'
Bundle 'transpose-words'
Bundle 'ReplaceWithRegister'
Bundle 'tommcdo/vim-exchange.git'
Bundle 'sk1418/Join.git'

" Better matching with %
Bundle 'matchit.zip'
Bundle 'ruby-matchit'

" Commenting, auto-completion, general syntax
Bundle 'tComment'
Bundle 'scrooloose/syntastic.git'
Bundle 'Valloric/YouCompleteMe.git'

" Mark-down
Bundle 'tpope/vim-markdown.git'
Bundle 'timcharper/textile.vim.git'

" General ruby
Bundle 'tpope/vim-bundler.git'
Bundle 'vim-ruby/vim-ruby.git'
Bundle 'tpope/vim-rbenv'
Bundle 'Puppet-Syntax-Highlighting'

" Web development
Bundle 'tpope/vim-rails.git'
Bundle 'hallison/vim-ruby-sinatra.git'

Bundle 'cakebaker/scss-syntax.vim.git'
Bundle 'groenewege/vim-less.git'
Bundle 'wavded/vim-stylus.git'
Bundle 'tpope/vim-cucumber.git'
Bundle 'tpope/vim-haml.git'
Bundle 'kchmck/vim-coffee-script.git'
Bundle 'slim-template/vim-slim.git'
Bundle 'itspriddle/vim-jquery.git'
Bundle 'othree/html5.vim.git'
Bundle 'mattn/emmet-vim.git'
Bundle 'jshafton/vim-handlebars.git'
Bundle 'Valloric/MatchTagAlways'
Bundle 'elzr/vim-json.git'

" Badass undo history
Bundle 'sjl/gundo.vim.git'

" Quick intra-buffer navigation
Bundle 'justinmk/vim-sneak.git'
Bundle 'spiiph/vim-space.git'

" Tag navigation / display
Bundle 'majutsushi/tagbar'

" Awesome paste history
Bundle 'vim-scripts/YankRing.vim.git'

" Text selection
Bundle 'kana/vim-textobj-user'
" ar, ir
Bundle 'nelstrom/vim-textobj-rubyblock'
" aa, ia
Bundle 'vim-scripts/argtextobj.vim'
" ae, ie
Bundle 'kana/vim-textobj-entire'
" a/, i/, a?, i?
Bundle 'kana/vim-textobj-lastpat'
" al, il
Bundle 'kana/vim-textobj-line'
" ai, ii, aI, iI
Bundle 'kana/vim-textobj-indent'
" a_, i_
Bundle 'lucapette/vim-textobj-underscore'
" expand selection
Bundle 'terryma/vim-expand-region.git'
" looser searching for text objects
Bundle 'paradigm/TextObjectify.git'

" Movement through camel case and snake case words
Bundle 'bkad/CamelCaseMotion.git'

" Code searching
Bundle 'mileszs/ack.vim.git'
Bundle 'rking/ag.vim'
Bundle 'AutoTag'
Bundle 'tpope/vim-abolish.git'
Bundle 'osyo-manga/vim-over.git'

" SQL
Bundle 'dbext.vim'
Bundle 'exu/pgsql.vim'

" Windows shit
Bundle 'PProvost/vim-ps1'

" Misc junk
Bundle 'ciaranm/securemodelines.git'

" Random shell helper commands
Bundle 'tpope/vim-eunuch.git'

" Session management
Bundle 'tpope/vim-obsession.git'

" Vim window management
Bundle 'milkypostman/vim-togglelist.git'
