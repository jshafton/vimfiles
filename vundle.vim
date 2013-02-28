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

" Buffer/file browsing
Bundle 'kien/ctrlp.vim.git'
Bundle 'onehouse/vim-bufexplorer.git'
Bundle 'jeetsukumaran/vim-buffergator.git'
Bundle 'scrooloose/nerdtree.git'

" UI enhancements
Bundle 'jshafton/vim-powerline.git'
Bundle 'vim-scripts/quickfixsigns.git'
Bundle 'nathanaelkane/vim-indent-guides.git'

" General text editing, delimiter pairing
Bundle 'tpope/vim-surround.git'
Bundle 'tpope/vim-unimpaired.git'
Bundle 'tpope/vim-endwise.git'
Bundle 'tpope/vim-repeat.git'
Bundle 'Raimondi/delimitMate.git'
Bundle 'Align'

" Commenting, auto-completion, general syntax
Bundle 'scrooloose/nerdcommenter.git'
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
Bundle 'tpope/vim-cucumber.git'
Bundle 'tpope/vim-haml.git'
Bundle 'kchmck/vim-coffee-script.git'
Bundle 'felipero/grails-vim.git'
Bundle 'slim-template/vim-slim.git'
Bundle 'itspriddle/vim-jquery.git'
Bundle 'othree/html5.vim.git'
Bundle 'mattn/zencoding-vim.git'
Bundle 'jshafton/vim-handlebars.git'

" Badass undo history
Bundle 'sjl/gundo.vim.git'

" Tag management
Bundle 'vim-scripts/taglist.vim.git'

" Quick file navigation
Bundle 'Lokaltog/vim-easymotion'

" Awesome paste history
Bundle 'vim-scripts/YankRing.vim.git'

" Text selection
Bundle 'kana/vim-textobj-user.git'
Bundle 'nelstrom/vim-textobj-rubyblock.git'

" Code searching
Bundle 'mileszs/ack.vim.git'
Bundle 'AutoTag'

" SQL
Bundle 'dbext.vim'
Bundle 'exu/pgsql.vim'

" Misc junk
Bundle 'ciaranm/securemodelines.git'
