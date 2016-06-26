set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
" Better integration with tmux
Plugin 'tmux-plugins/vim-tmux-focus-events'
" Snippets for the win
Plugin 'SirVer/ultisnips'
" Snippets
Plugin 'honza/vim-snippets'
" let us have a pattern of styles ( spaces, eol, charset, others... )
Plugin 'editorconfig/editorconfig-vim'
" Adds airline
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
" Markdown syntax highlighting
Plugin 'godlygeek/tabular'
Plugin 'plasticboy/vim-markdown'

set shell=/bin/zsh
syntax enable
set background=dark
set number
set relativenumber
set cursorline
set hidden
set laststatus=2
set autoindent
set backspace=indent,eol,start
set backupdir=~/.vim/backup//
set directory=~/.vim/swap//
set undodir=~/.vim/undo//
set smarttab
set colorcolumn=80
set wildmenu
set scrolloff=10
set nofoldenable

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
