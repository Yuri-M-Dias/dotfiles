" make plug auto-install
if !isdirectory($HOME.'/.vim/autoload')
  silent !mkdir -p ~/.vim/autoload
  silent !curl -fLo ~/.vim/autoload/plug.vim
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall
  silent !mkdir -p ~/.vim/backup/ ~/.vim/swap/ ~/.vim/undo/ ~/.vim/session/
endif

set nocompatible              " be iMproved

" Vim-plug configuration
call plug#begin('~/.vim/plugged')

" let Vundle manage Vundle, required
"Plug 'VundleVim/Vundle.vim'
" Better integration with tmux
Plug 'tmux-plugins/vim-tmux-focus-events'
" Snippets for the win
Plug 'SirVer/ultisnips'
" Snippets
Plug 'honza/vim-snippets'
" let us have a pattern of styles ( spaces, eol, charset, others... )
Plug 'editorconfig/editorconfig-vim'
" Adds airline
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
" Markdown syntax highlighting
Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown'
" Improved search highlight
Plug 'timakro/vim-searchant'
" Adding a nice undo-tree
Plug 'mbbill/undotree'
" Adds api blueprint support and syntax
Plug 'kylef/apiblueprint.vim'
" Installs syntastic
"Plug 'scrooloose/syntastic'
" Fish files syntax highlight
Plug 'dag/vim-fish'
" Easymotion, for vimium-like finding
Plug 'easymotion/vim-easymotion'
" SQL formatter and utils
Plug 'vim-scripts/SQLUtilities'
" Align plugin
Plug 'vim-scripts/Align'
" Syntax!
Plug 'sheerun/vim-polyglot'
" Ctrlp fuzzy file search
Plug 'ctrlpvim/ctrlp.vim'
" R support
Plug 'jalvesaq/Nvim-R'
"Plug 'vim-scripts/Vim-R-plugin'
" emmet for fast html
Plug 'mattn/emmet-vim'
" Fancy start screen
Plug 'mhinz/vim-startify'
" Dockerfile support
Plug 'ekalinin/Dockerfile.vim'
" Neomake instead of Syntastic
Plug 'neomake/neomake'
Plug 'ryanoasis/vim-devicons'
" Famous NERD tree
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
" Adds comments!
Plug 'scrooloose/nerdcommenter'
" Haskell support
Plug 'neovimhaskell/haskell-vim'
" Intero-haskell
"Plug 'myfreeweb/intero.nvim'
" Better session handling
"Plug 'tpope/vim-obsession'
Plug 'lervag/vimtex'

" Color themes
Plug 'altercation/vim-colors-solarized'
Plug 'tomasr/molokai'
Plug 'flazz/vim-colorschemes'

if has('nvim')
	Plug 'Shougo/deoplete.nvim'
	Plug 'carlitux/deoplete-ternjs'
	Plug 'ponko2/deoplete-fish'
	Plug 'Shougo/neco-vim'
	Plug 'eagletmt/neco-ghc'
endif

call plug#end()
" All of your Plugins must be added before the following line
"call vundle#end()            " required
filetype plugin indent on    " required

"""""""""CONFIGURATION SECTION"""""""""""""""
" All sets and specific configuration should go here

" Things that nvim removed
if !has('nvim')
	set ttymouse=xterm2
	set term=screen-256color
endif

" Nvim-specific options
if has('nvim')
	" Enable truecolors
	set termguicolors
	let $NVIM_TUI_ENABLE_CURSOR_SHAPE=0
	let g:deoplete#enable_at_startup = 1
	" Use deoplete.
	let g:tern_request_timeout = 1
	let g:tern_show_signature_in_pum = '0'  " This do disable full signature type on autocomplete
	" Quite bad how this is necessary, but it's here.
	"let g:python_host_prog = '/home/yuri/.pyenv/versions/neovim2/bin/python'
	"let g:python3_host_prog = '/home/yuri/.pyenv/versions/neovim3/bin/python'
	" Make ternjs close automatically
	autocmd CompleteDone * pclose!
endif

set encoding=utf8
set guifont=Droid\ Sans\ Mono\ for\ Powerline\ Plus\ Nerd\ File\ Types\ 13

set shell=/bin/bash
set t_Co=256
syntax enable
syntax on
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
set incsearch
" display indentation guides
set list listchars=tab:▸\ ,trail:·,extends:>,precedes:«,nbsp:×,eol:¬
" Converts tabs to spaces
set tabstop=4 shiftwidth=4 sts=4 noet
"set fileformats=unix
set mouse=a

" Plugin configurations
let g:airline_powerline_fonts=1
let g:airline_theme='bubblegum'
let g:airline#extensions#tabline#enabled = 1
let g:Powerline_symbols='unicode'

let g:ctrlp_cache_dir=$HOME.'/.cache/ctrlp'
"
" Some R plugins options
"let vimrplugin_applescript=0
"let vimrplugin_vsplit=1
"
"let R_esc_term = 0
"let R_close_term = 0
"let R_in_buffer = 0
let g:R_in_buffer = 0
let g:R_applescript = 0
let g:R_tmux_split = 1

" Startify sessions configurations
let g:startify_session_autoload = 0
let g:startify_session_persistence = 0
let g:startify_session_sort = 0
colorscheme molokai

""""""""""""""""" Keys remapping should go here """""""""""""""""
nnoremap <F6> :UndotreeToggle<CR>
nnoremap <F5> :NERDTreeToggle<CR>
" Don't use Ex mode, use Q for formatting
nnoremap Q <Esc>gg=G<Esc>
" Easier saving
nnoremap <leader>s :w<CR>
" Even easier saving
nnoremap <C-s> :w<CR>
inoremap <C-s> <Esc>:w<CR>i
" Force saving
nnoremap <leader>f :wq<CR>
nnoremap <leader>c :set relativenumber!<CR>
nnoremap <leader>r :so $MYVIMRC<CR>
" done with it
nnoremap <LEADER>d :w<CR>:bd<CR>
" forget about it
nnoremap <LEADER>x :bd!<CR>

" Navigation like a Browser, but for buffers.
nnoremap <C-S-tab> :bp<CR>
nnoremap <C-tab>   :bn<CR>
"nnoremap <C-t>     :tabnew<CR>
inoremap <C-S-tab> <Esc>:bp<CR>i
inoremap <C-tab>   <Esc>:bn<CR>i
"inoremap <C-t>     <Esc>:tabnew<CR>

" previous buffer
nnoremap <C-H> :bp<CR>
" next buffer
nnoremap <C-L> :bn<CR>

" move one line up
nnoremap <LEADER><UP> ddkP
" move one line down
nnoremap <LEADER><DOWN> ddp

" copiar e colar
"vmap <C-c> "*y     " Yank current selection into system clipboard
"nmap <C-c> "*Y     " Yank current line into system clipboard (if nothing is selected)
"nmap <C-v> "*p     " Paste from system clipboard
"

" R plugin configuration
"vmap <Space> <Plug>RDSendSelection
"nmap <Space> <Plug>RDSendLine

" Conditional key mappings: will work only for the files endings specified
autocmd BufNewFile,BufRead *.apib nnoremap <leader>b :!apiary preview --output="api-docs.html"<CR>
autocmd BufNewFile,BufRead *.jade set ft=pug
autocmd BufNewFile,BufRead *.fish set ft=fish
"autocmd BufNewFile,BufRead *.cpp nnoremap <leader>b :!g++ %
"autocmd BufNewFile,BufRead *.rb nnoremap <leader>b :!bundle ...
autocmd FileType python setlocal et

" Custom command customizations
"command! Foo :echo "Hello"

