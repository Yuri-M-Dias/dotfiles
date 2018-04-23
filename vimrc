" make plug auto-install
if empty(glob('~/.vim/autoload/plug.vim'))
	silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
				\ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
	silent !mkdir -p ~/.vim/backup/ ~/.vim/swap/ ~/.vim/undo/ ~/.vim/session/
endif

" OS verification
if !exists("g:os")
	if has("win64") || has("win32") || has("win16")
		let g:os = "Windows"
	else
		let g:os = substitute(system('uname'), '\n', '', '')
	endif
endif

" Current user
let g:current_user = $USER

" Vim-plug configuration
call plug#begin('~/.vim/plugged')

" Git utilities
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'
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
Plug 'godlygeek/tabular', {'for': ['markdown', 'md']}
Plug 'plasticboy/vim-markdown', {'for': ['markdown', 'md']}
" Improved search highlight
Plug 'timakro/vim-searchant'
" Adding a nice undo-tree
Plug 'mbbill/undotree'
" Adds api blueprint support and syntax
Plug 'kylef/apiblueprint.vim', {'for': ['apiblueprint']}
" Installs syntastic
"Plug 'scrooloose/syntastic'
" Fish files syntax highlight
Plug 'dag/vim-fish', {'for': ['fish']}
" Easymotion, for vimium-like finding
Plug 'easymotion/vim-easymotion'
" SQL formatter and utils
Plug 'vim-scripts/SQLUtilities', { 'for': ['sql'] }
" Align plugin
Plug 'vim-scripts/Align'
" Syntax!
Plug 'sheerun/vim-polyglot'
" Ctrlp fuzzy file search
Plug 'ctrlpvim/ctrlp.vim'
" R support
Plug 'jalvesaq/Nvim-R', {'for': ['R']}
"Plug 'vim-scripts/Vim-R-plugin'
" emmet for fast html
Plug 'mattn/emmet-vim', {'for': ['html']}
" Fancy start screen
Plug 'mhinz/vim-startify'
" Dockerfile support
Plug 'ekalinin/Dockerfile.vim', {'for': ['dockerfile']}
" Neomake instead of Syntastic
Plug 'neomake/neomake'
Plug 'ryanoasis/vim-devicons'
" Famous NERD tree
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
" Adds comments!
Plug 'scrooloose/nerdcommenter'
" Haskell support
Plug 'neovimhaskell/haskell-vim', {'for': ['haskell']}
" Intero-haskell
"Plug 'myfreeweb/intero.nvim'
" Better session handling
"Plug 'tpope/vim-obsession'
"
Plug 'lervag/vimtex', {'for': ['tex', 'latex']}

" A Vim Plugin for Lively Previewing LaTeX PDF Output
"Plug 'xuhdev/vim-latex-live-preview', { 'for': ['tex', 'latex'] }

" jsdoc
Plug 'othree/jsdoc-syntax.vim', { 'for': ['javascript', 'javascript.jsx', 'js'] }
Plug 'heavenshell/vim-jsdoc', { 'for': ['javascript', 'javascript.jsx', 'js'] }

" Surround
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'vimwiki/vimwiki'
" Eerlang runtime
Plug 'vim-erlang/vim-erlang-runtime', { 'for': ['eerlang'] }

" CSV support
Plug 'chrisbra/csv.vim', { 'for': ['csv'] }

" Color themes
Plug 'tomasr/molokai'

"Hexeditor!
Plug 'Shougo/vinarise.vim'

if has('nvim')
	Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
	Plug 'carlitux/deoplete-ternjs', { 'do': 'npm install -g tern', 'for': ['javascript', 'javascript.jsx'] }
	Plug 'ponko2/deoplete-fish', { 'for': ['fish'] }
	Plug 'Shougo/neco-vim', { 'for': ['vim'] }
	Plug 'eagletmt/neco-ghc', { 'for': ['haskell'] }
	Plug 'wellle/tmux-complete.vim', { 'for': ['tmux'] }
	Plug 'fishbullet/deoplete-ruby', { 'for': ['ruby', 'rb'] }
	Plug 'ujihisa/neco-look'
	Plug 'zchee/deoplete-jedi', { 'for': ['python', 'py'] }
	Plug 'Shougo/neopairs.vim'
	Plug 'Shougo/context_filetype.vim'
	Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
	Plug 'junegunn/fzf.vim'
	Plug 'Shougo/echodoc.vim'
	Plug 'sbdchd/neoformat'
	Plug 'iamcco/mathjax-support-for-mkdp', { 'for': ['markdown', 'md']}
	Plug 'iamcco/markdown-preview.vim', { 'for': ['markdown', 'md']}
	Plug 'Shougo/neco-syntax'
endif

call plug#end()

"""""""""CONFIGURATION SECTION"""""""""""""""
" All sets and specific configuration should go here

" Things that nvim removed
if !has('nvim')
	set nocompatible              " be iMproved
	set ttymouse=xterm2
	set term=screen-256color
endif

" Nvim-specific options
if has('nvim')
	" Enable truecolors
	set termguicolors
	let $NVIM_TUI_ENABLE_CURSOR_SHAPE=0
	let g:deoplete#enable_at_startup = 1
	let g:deoplete#max_list=20
	let g:deoplete#auto_complete_delay=0
	let g:deoplete#file#enable_buffer_path=1
	let g:deoplete#enable_smart_case=1
	" Use deoplete.
	let g:tern_request_timeout = 1
	let g:tern_show_signature_in_pum = '0'  " This do disable full signature type on autocomplete
	" Make ternjs close automatically
	autocmd CompleteDone * pclose!
	"Add extra filetypes
	let g:tern#filetypes = [
				\ 'jsx',
				\ 'javascript.jsx',
				\ 'vue',
				\ 'javascript',
				\ 'js'
				\ ]
	" Tmuxcomplete use deoplete
	let g:tmuxcomplete#trigger = ''
	silent! call deoplete#custom#set('_', 'matchers', ['matcher_fuzzy'])

	" For neovim + vimtex
	if !exists('g:deoplete#omni#input_patterns')
		let g:deoplete#omni#input_patterns = {}
	endif

	" Shamelessly copied over, not working here.
	" https://github.com/lervag/vimtex/blob/f66a54695e5eb2454266746701575db452b3224f/autoload/vimtex/re.vim
	let g:vimtex#re#deoplete = '\\(?:'
				\ .  '\w*cite\w*(?:\s*\[[^]]*\]){0,2}\s*{[^}]*'
				\ . '|(text|block)cquote\*?(?:\s*\[[^]]*\]){0,2}\s*{[^}]*'
				\ . '|(for|hy)\w*cquote\*?{[^}]*}(?:\s*\[[^]]*\]){0,2}\s*{[^}]*'
				\ . '|\w*ref(?:\s*\{[^}]*|range\s*\{[^,}]*(?:}{)?)'
				\ . '|hyperref\s*\[[^]]*'
				\ . '|includegraphics\*?(?:\s*\[[^]]*\]){0,2}\s*\{[^}]*'
				\ . '|(?:include(?:only)?|input)\s*\{[^}]*'
				\ . '|\w*(gls|Gls|GLS)(pl)?\w*(\s*\[[^]]*\]){0,2}\s*\{[^}]*'
				\ . '|includepdf(\s*\[[^]]*\])?\s*\{[^}]*'
				\ . '|includestandalone(\s*\[[^]]*\])?\s*\{[^}]*'
				\ . '|usepackage(\s*\[[^]]*\])?\s*\{[^}]*'
				\ . '|documentclass(\s*\[[^]]*\])?\s*\{[^}]*'
				\ . '|\w*'
				\ .')'
	let g:deoplete#omni#input_patterns.tex = g:vimtex#re#deoplete

	" Echodoc config
	set noshowmode
	"set cmdheight=2
	let g:echodoc#enable_at_startup = 1

	" Necessary for deoplete and other python plugins
	" Quite bad how this is necessary, but it's here.
	if g:os == "Darwin"
		let g:python_host_prog= '/Users/Usuario/.pyenv/versions/neovim2/bin/python'
		let g:python3_host_prog= '/Users/Usuario/.pyenv/versions/neovim3/bin/python'
	elseif g:os == "Linux"
		let g:python_host_prog = '/home/' . g:current_user . '/.pyenv/versions/neovim2/bin/python'
		let g:python3_host_prog = '/home/' . g:current_user . '/.pyenv/versions/neovim3/bin/python'
	endif

endif

set encoding=utf8
if g:os == "Darwin"
	set guifont=Droid\ Sans\ Mono\ for\ Powerline\ Plus\ Nerd\ File\ Types:13
elseif g:os == "Linux"
	set guifont=Droid\ Sans\ Mono\ for\ Powerline\ Plus\ Nerd\ File\ Types\ 13
endif

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
set showcmd

" https://github.com/neovim/neovim/issues/583
set clipboard=unnamed

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
let g:startify_session_autoload = 1
let g:startify_session_persistence = 1
let g:startify_session_sort = 1
let g:startify_use_env = 1
let g:startify_fortune_use_unicode = 1
let g:startify_session_before_save = [
			\ 'echo "Cleaning up before saving.."',
			\ 'silent! NERDTreeTabsClose'
			\ ]
let g:startify_custom_header = startify#fortune#boxed()

" UltiSnips configuration
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"

" NERDTree configuration
let NERDTreeShowHidden=1

" Neomake configuration
"let g:neomake_open_list = 2
"let g:neomake_javascript_jscs_maker = {
"\ 'exe': 'jscs',
"\ 'args': ['--no-color', '--preset', 'airbnb', '--reporter', 'inline', '--esnext'],
"\ 'errorformat': '%f: line %l\, col %c\, %m',
"\ }
let g:neomake_javascript_enabled_makers = ['eslint']
let g:neomake_warning_sign = {
			\ 'text': '!',
			\ 'texthl': 'WarningMsg',
			\ }
let g:neomake_error_sign = {
			\ 'text': '×',
			\ 'texthl': 'ErrorMsg',
			\ }

" Neoformat configuration
" Enable alignment
let g:neoformat_basic_format_align = 1
" Enable tab to spaces conversion
let g:neoformat_basic_format_retab = 1
" Enable trimmming of trailing whitespace
let g:neoformat_basic_format_trim = 1
" Use formatprg when available
let g:neoformat_try_formatprg = 1

" Disable polyglot's latex support, in favor of VimTex.
let g:polyglot_disabled = ['latex']

colorscheme molokai

""""""""""""""""" Keys remapping should go here """""""""""""""""
nnoremap <F6> :UndotreeToggle<CR>
nnoremap <F5> :NERDTreeToggle<CR>
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

" Don't use Ex mode, use Q for formatting
"nnoremap Q <Esc>gg=G<Esc>
nnoremap Q :Neoformat<CR>

" Conditional key mappings: will work only for the files endings specified
autocmd BufNewFile,BufRead *.apib nnoremap <leader>b :!apiary preview --output="api-docs.html"<CR>
autocmd BufNewFile,BufRead *.jade set ft=pug
autocmd BufNewFile,BufRead *.fish set ft=fish
"autocmd BufNewFile,BufRead *.cpp nnoremap <leader>b :!g++ %
"autocmd BufNewFile,BufRead *.rb nnoremap <leader>b :!bundle ...
autocmd FileType python setlocal et

" Autoformat helper
autocmd FileType javascript set formatprg=prettier\ --stdin\ --parser\ flow\ --single-quote\ --trailing-comma\ es5

" Triggers neomake
autocmd! BufWritePost,BufEnter * Neomake

" Custom command customizations
" I stole these from @joaumg
" Awesome commands
" http://vi.stackexchange.com/questions/454/whats-the-simplest-way-to-strip-trailing-whitespace-from-all-lines-in-a-file
command! RemoveTrailingWhitespaces :bufdo %s/\s\+$//e
" Save files with sudo
command! SaveAsRoot :w !sudo tee > /dev/null %
" Last revision
command! LastRevision :r !git show HEAD^1:%
" Open hex visualization
command! ViewHex :% ! xxd
command! CloseHex :% ! xxd -r

