set nocompatible               " be iMproved
filetype off                   " required!

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
" required!
Bundle 'git@github.com:gmarik/vundle'

" Git and related
Bundle 'git@github.com:tpope/vim-git.git'
Bundle 'git@github.com:tpope/vim-fugitive.git'
Bundle 'git@github.com:gregsexton/gitv.git'

" Buffer/file browsing
Bundle 'git@github.com:kien/ctrlp.vim.git'
Bundle 'git@github.com:jlanzarotta/bufexplorer'
Bundle 'git@github.com:jeetsukumaran/vim-buffergator.git'
Bundle 'git@github.com:scrooloose/nerdtree.git'
Bundle 'git@github.com:duff/vim-bufonly'

" UI enhancements
Bundle 'git@github.com:bling/vim-airline'
Bundle 'git@github.com:vim-scripts/quickfixsigns.git'
Bundle 'git@github.com:nathanaelkane/vim-indent-guides.git'

" General text editing, delimiter pairing
Bundle 'git@github.com:tpope/vim-surround.git'
Bundle 'git@github.com:tpope/vim-unimpaired.git'
Bundle 'git@github.com:tpope/vim-endwise.git'
Bundle 'git@github.com:tpope/vim-repeat.git'
Bundle 'git@github.com:Raimondi/delimitMate.git'
Bundle 'Align'
Bundle 'transpose-words'
Bundle 'ReplaceWithRegister'

" Better matching with %
Bundle 'matchit.zip'
Bundle 'ruby-matchit'

" Commenting, auto-completion, general syntax
Bundle 'tComment'
Bundle 'git@github.com:scrooloose/syntastic.git'
Bundle 'git@github.com:Valloric/YouCompleteMe.git'

" Mark-down
Bundle 'git@github.com:tpope/vim-markdown.git'
Bundle 'git@github.com:timcharper/textile.vim.git'

" General ruby
Bundle 'git@github.com:tpope/vim-bundler.git'
Bundle 'git@github.com:vim-ruby/vim-ruby.git'
Bundle 'git@github.com:tpope/vim-rbenv'
Bundle 'Puppet-Syntax-Highlighting'

" Web development
Bundle 'git@github.com:tpope/vim-rails.git'
Bundle 'git@github.com:hallison/vim-ruby-sinatra.git'

Bundle 'git@github.com:git@github.com:cakebaker/scss-syntax.vim.git'
Bundle 'git@github.com:groenewege/vim-less.git'
Bundle 'git@github.com:tpope/vim-cucumber.git'
Bundle 'git@github.com:tpope/vim-haml.git'
Bundle 'git@github.com:kchmck/vim-coffee-script.git'
Bundle 'git@github.com:slim-template/vim-slim.git'
Bundle 'git@github.com:itspriddle/vim-jquery.git'
Bundle 'git@github.com:othree/html5.vim.git'
Bundle 'git@github.com:mattn/emmet-vim.git'
Bundle 'git@github.com:jshafton/vim-handlebars.git'
Bundle 'git@github.com:Valloric/MatchTagAlways'

" Badass undo history
Bundle 'git@github.com:sjl/gundo.vim.git'

" Quick file navigation
Bundle 'git@github.com:Lokaltog/vim-easymotion'

" Tag navigation / display
Bundle 'git@github.com:majutsushi/tagbar'

" Awesome paste history
Bundle 'git@github.com:vim-scripts/YankRing.vim.git'

" Text selection
Bundle 'git@github.com:kana/vim-textobj-user'
" ar, ir
Bundle 'git@github.com:nelstrom/vim-textobj-rubyblock'
" aa, ia
Bundle 'git@github.com:vim-scripts/argtextobj.vim'
" ae, ie
Bundle 'git@github.com:kana/vim-textobj-entire'
" a/, i/, a?, i?
Bundle 'git@github.com:kana/vim-textobj-lastpat'
" al, il
Bundle 'git@github.com:kana/vim-textobj-line'
" ai, ii, aI, iI
Bundle 'git@github.com:kana/vim-textobj-indent'
" a_, i_
Bundle 'git@github.com:lucapette/vim-textobj-underscore'

" Code searching
Bundle 'git@github.com:mileszs/ack.vim.git'
Bundle 'git@github.com:rking/ag.vim'
Bundle 'AutoTag'
Bundle 'git@github.com:tpope/vim-abolish.git'

" SQL
Bundle 'dbext.vim'
Bundle 'git@github.com:exu/pgsql.vim'

" Windows shit
Bundle 'git@github.com:PProvost/vim-ps1'

" Misc junk
Bundle 'git@github.com:ciaranm/securemodelines.git'

" Snippets
" -- this is the engine
Bundle "git@github.com:SirVer/ultisnips.git"

" -- these are snippets; vim-snipmate requires the other 2
Bundle "git@github.com:MarcWeber/vim-addon-mw-utils"
Bundle "git@github.com:tomtom/tlib_vim"
Bundle "git@github.com:garbas/vim-snipmate.git"
