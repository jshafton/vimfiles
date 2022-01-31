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
Plug 'rhysd/git-messenger.vim'
Plug 'airblade/vim-gitgutter'

" Buffer/file browsing
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --bin' }
Plug 'junegunn/fzf.vim'
Plug 'dhruvasagar/vim-vinegar'
Plug 'scrooloose/nerdtree'
Plug 'duff/vim-bufonly'
Plug 'qpkorr/vim-bufkill'

" Language pack bundles
Plug 'sheerun/vim-polyglot'
Plug 'mattn/emmet-vim'
Plug 'elixir-lang/vim-elixir'
Plug 'jshafton/vim-node'
Plug 'robbles/logstash.vim'
Plug 'Glench/Vim-Jinja2-Syntax'
Plug 'gabrielelana/vim-markdown'
Plug 'b4b4r07/vim-hcl'

" UI enhancements
Plug 'nathanaelkane/vim-indent-guides'
Plug 'miyakogi/conoline.vim'
Plug 'szw/vim-maximizer'

" General text editing, delimiter pairing
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-repeat'
Plug 'jiangmiao/auto-pairs'
Plug 'junegunn/vim-easy-align'
Plug 'vim-scripts/transpose-words'
Plug 'vim-scripts/ReplaceWithRegister'
Plug 'tommcdo/vim-exchange'
Plug 'sk1418/Join'
Plug 'junegunn/rainbow_parentheses.vim'

" Better matching with %
Plug 'andymass/vim-matchup'

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
Plug 'vim-scripts/AutoTag'
Plug 'tpope/vim-abolish'
Plug 'osyo-manga/vim-over'

" SQL
Plug 'exu/pgsql.vim'

" DevOps
Plug 'pearofducks/ansible-vim'
Plug 'stephpy/vim-yaml'
Plug 'zimbatm/haproxy.vim'

" Misc junk
Plug 'ciaranm/securemodelines'

" Random shell helper commands
Plug 'tpope/vim-eunuch'

" Session management
Plug 'tpope/vim-obsession'

" Vim window management
Plug 'milkypostman/vim-togglelist'
Plug 'christoomey/vim-tmux-navigator'

call plug#end()

let s:pluggedTracker = resolve(expand("~/.vim-plug-first-run"))
if !filereadable(s:pluggedTracker)
  echo "Installing Plugins for first time, please ignore key map error messages"
  echo ""

  :PlugInstall
  :call system('touch ' . s:pluggedTracker)
endif
