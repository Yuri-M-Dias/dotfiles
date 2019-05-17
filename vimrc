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
" GitHub integration
Plug 'tpope/vim-rhubarb'
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
Plug 'jalvesaq/Nvim-R' ", {'for': ['R', 'r', 'rmd', 'Rmd']}
" Devtools
Plug 'mllg/vim-devtools-plugin', { 'for': ['r', 'rmd', 'rnoweb']}
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

Plug 'lervag/vimtex', {'for': ['tex', 'latex']}

" jsdoc
Plug 'othree/jsdoc-syntax.vim', { 'for': ['javascript', 'javascript.jsx', 'js'] }
Plug 'heavenshell/vim-jsdoc', { 'for': ['javascript', 'javascript.jsx', 'js'] }

" Surround
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'

" Vimwiki?
Plug 'vimwiki/vimwiki'
" Eerlang runtime
Plug 'vim-erlang/vim-erlang-runtime', { 'for': ['eerlang'] }

" CSV support
Plug 'mechatroner/rainbow_csv', { 'for': ['csv'] }
Plug 'chrisbra/csv.vim', { 'for': ['csv'] }

" Color themes
Plug 'tomasr/molokai'
"Plug 'tpope/vim-vividchalk'

"Hexeditor!
Plug 'Shougo/vinarise.vim'

" Adds grammar checks
Plug 'rhysd/vim-grammarous'

" Denite? Testing it out.
Plug 'Shougo/denite.nvim', { 'do': ':UpdateRemotePlugins' }

" Pandoc support: the best stuff since coca-cola!
Plug 'vim-pandoc/vim-pandoc'
Plug 'vim-pandoc/vim-pandoc-syntax'

" RMarkdown!
"Plug 'vim-pandoc/vim-rmarkdown'

" Zotero stuff
"Plug 'rafaqz/citation.vim'
"Plug 'jalvesaq/zotcite'

" BDD framework for vim!
Plug 'junegunn/vader.vim', {'for': ['vader']}

" Best way of seeing keymaps?
Plug 'liuchengxu/vim-which-key'

" Java autocomplete!
Plug 'artur-shaik/vim-javacomplete2'

if has('nvim')
    Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
    Plug 'carlitux/deoplete-ternjs', { 'do': 'npm install -g tern', 'for': ['javascript', 'javascript.jsx'] }
    Plug 'ponko2/deoplete-fish', { 'for': ['fish'] }
    Plug 'Shougo/neco-vim', { 'for': ['vim'] }
    Plug 'eagletmt/neco-ghc', { 'for': ['haskell'] }
    Plug 'wellle/tmux-complete.vim'
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
    Plug 'lionawurscht/deoplete-biblatex'
    Plug 'ncm2/ncm2'
    Plug 'ncm2/ncm2-ultisnips'
    Plug 'roxma/nvim-yarp'
    Plug 'gaalcaras/ncm-R'
    Plug 'lervag/vimtex'
    Plug 'ncm2/ncm2-bufword'
    Plug 'ncm2/ncm2-path'
    Plug 'ncm2/ncm2-ultisnips'
    Plug 'ncm2/ncm2-vim' | Plug 'Shougo/neco-vim'
    Plug 'ncm2/ncm2-syntax' | Plug 'Shougo/neco-syntax'
    Plug 'ncm2/ncm2-pyclang'
    Plug 'ncm2/ncm2-neoinclude' | Plug 'Shougo/neoinclude.vim'
    Plug 'ncm2/ncm2-github'
    Plug 'ncm2/ncm2-markdown-subscope'
    Plug 'ncm2/ncm2-tern', {'do': 'npm install'}
    Plug 'fgrsnau/ncm2-aspell'
endif

call plug#end()

"""""""""CONFIGURATION SECTION"""""""""""""""
" All sets and specific configuration should go here


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
    " Tmuxcomplete use the default completition manager
    let g:tmuxcomplete#trigger = ''
    silent! call deoplete#custom#set('_', 'matchers', ['matcher_fuzzy'])

    " Need this to customize deoplete
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

    " Doesn't work out of the box... https://github.com/vim-pandoc/vim-pandoc/issues/185
    let g:deoplete#omni#input_patterns.pandoc= '@\w*'
    let g:deoplete#omni#input_patterns.rmd= '@\w*'
    " http://www.galiglobal.com/blog/2017/20170226-Vim-as-Java-IDE-again.html
    let g:deoplete#omni#input_patterns.java = '[^. *\t]\.\w*'

    call deoplete#custom#option('omni_patterns', {
                \ 'tex' : g:vimtex#re#deoplete,
                \ 'r' : ['[^. *\t]\.\w*', '\h\w*::\w*', '\h\w*\$\w*'],
                \ 'rmd' : ['[^. *\t]\.\w*', '\h\w*::\w*', '\h\w*\$\w*', '@\w*'],
                \ 'java' : ['[^. *\t]\.\w*'],
                \ 'pandoc': ['@\w*'],
                \})


    " Echodoc config
    set noshowmode
    "set cmdheight=2
    let g:echodoc#enable_at_startup = 1
    " enable ncm2 for all buffers
    " IMPORTANT: :help Ncm2PopupOpen for more information
    set completeopt=noinsert,menuone,noselect
    " Necessary for deoplete and other python plugins
    let g:python_host_prog = '/home/' . g:current_user . '/.pyenv/versions/neovim2/bin/python'
    let g:python3_host_prog = '/home/' . g:current_user . '/.pyenv/versions/neovim3/bin/python'
elseif !has('nvim')
    " Things that neovim removed
    set nocompatible " be iMproved
    set ttymouse=xterm2
    set term=screen-256color
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
"set nofoldenable
set incsearch

" display indentation guides
set list listchars=tab:▸\ ,trail:·,extends:>,precedes:«,nbsp:×,eol:¬
" Converts tabs to spaces
set tabstop=4 shiftwidth=4 sts=4 noet
"set fileformats=unix
set mouse=a
set showcmd

" suppress the annoying 'match x of y', 'The only match' and 'Pattern not
" found' messages
set shortmess+=c

" http://vim.wikia.com/wiki/Toggle_auto-indenting_for_code_paste
nnoremap <F2> :set invpaste paste?<CR>
set pastetoggle=<F2>

" https://github.com/neovim/neovim/issues/583
set clipboard=unnamed

" =====================================================
" Plugin configurations

" From ncm2-utilsnips, and also for utilsnips
" c-j c-k for moving in snippet, in practice <TAB> works
let g:UltiSnipsExpandTrigger        = "<Plug>(ultisnips_expand)"
let g:UltiSnipsJumpForwardTrigger   = "<c-j>"
let g:UltiSnipsJumpBackwardTrigger  = "<c-k>"
let g:UltiSnipsRemoveSelectModeMappings = 0

" Airline configurations
let g:airline_powerline_fonts=1
let g:airline_theme='bubblegum'
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#wordcount#enabled = 1
let g:airline#extensions#wordcount#filetypes =
    \ ['help', 'markdown', 'rst', 'org', 'text',
    \ 'asciidoc', 'tex', 'mail', 'rmarkdown', 'rmd',
    \ 'md', 'vimwiki'
    \ ]
let g:Powerline_symbols='unicode'

" Ctrlp cache home, however might cause problems
let g:ctrlp_cache_dir=$HOME.'/.cache/ctrlp'
let g:ctrlp_show_hidden=1

" Just wanted to ignore the latex .aux files
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git|hg|svn)$',
  \ 'file': '\v\.(exe|so|dll|aux)$',
  \ }

"====== Nvim-R options=====
" The maintainer won't support the tmux integration anymore...
let g:R_in_buffer = 0
let g:R_applescript = 0
"
" Workaround... can't find the issue now, but needed for tmux splits to work
let g:R_source=$HOME.'/.config/nvim/opt/tmux_split.vim'
" Ensures usage of your own ~/.tmux.conf file
let g:R_notmuxconf = 1

" Only opens PDF is X is working
if $DISPLAY != ""
   let g:R_openpdf = 1
endif

" Zathura sucks.
let g:R_pdfviewer = 'evince'
" Clears line before sending commands to R's console
let g:R_clear_line = 1

" Type _ twice for it to turn into a ->
let R_assign = 2

"==================
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

" NERDTree configuration
let NERDTreeShowHidden=1

" Neomake configuration
"let g:neomake_open_list = 2
let g:neomake_javascript_enabled_makers = ['eslint']
let g:neomake_warning_sign = {
            \ 'text': '!',
            \ 'texthl': 'WarningMsg',
            \ }
let g:neomake_error_sign = {
            \ 'text': '×',
            \ 'texthl': 'ErrorMsg',
            \ }

" Fix for https://github.com/neomake/neomake/issues/1777
let g:neomake_shellcheck_args = ['-fgcc']

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
" R.vim is also absolutely dreadful
let g:polyglot_disabled = ['latex', 'r-lang']

" Vimtex options
let g:vimtex_quickfix_autoclose_after_keystrokes = 2

" Grammarous configs
let g:grammarous#use_vim_spelllang = 1

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
nnoremap <leader>d :w<CR>:bd<CR>
" forget about it
nnoremap <leader>x :bd!<CR>

" previous buffer
nnoremap <C-H> :bp<CR>
" next buffer
nnoremap <C-L> :bn<CR>

" move one line up
nnoremap <leader><up> ddkP
" move one line down
nnoremap <leader><down> ddp

" CTRL-C doesn't trigger the InsertLeave autocmd . map to <ESC> instead.
inoremap <c-c> <ESC>

" Press enter key to trigger snippet expansion
" The parameters are the same as `:help feedkeys()`
inoremap <expr> <CR> (pumvisible() ? "\<c-y>\<cr>" : "")
inoremap <silent> <expr> <CR> ncm2_ultisnips#expand_or("\<CR>", 'n')
"inoremap <silent> <buffer> <expr> <CR> ncm2_ultisnips#expand_or("\<CR>", '')

" Use <TAB> to select the popup menu:
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" Displays the current leader mappings
"https://github.com/liuchengxu/vim-which-key
nnoremap <silent> <leader>      :<c-u>WhichKey '\'<CR>
nnoremap <silent> <localleader> :<c-u>WhichKey '\'<CR>

" TODO: get the full path and just pass that to inf_mr
" Returns the current filename
function! s:getCurrentFileName() abort "{{{
    return expand('%:t')
endfunction"}}}

" Makes xaringan use the current file

let g:xaringan#sendCmd = 'xaringan::inf_mr(moon = paste0(getwd(), "/'
            \ . <SID>getCurrentFileName()
            \ . '"))'

" Custom keybind
nnoremap <silent> <LocalLeader>rx
            \ :call g:SendCmdToR(g:xaringan#sendCmd)
            \ <CR>

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

" Makes java use javaComplete
autocmd FileType java setlocal omnifunc=javacomplete#Complete

" Disable deoplete on some filetypes...
autocmd FileType tex call deoplete#custom#buffer_option('auto_complete', v:false)
autocmd FileType r call deoplete#custom#buffer_option('auto_complete', v:false)
autocmd FileType rmarkdown call deoplete#custom#buffer_option('auto_complete', v:false)

augroup my_cm_setup
    autocmd!
    autocmd BufEnter * call ncm2#enable_for_buffer()
    autocmd Filetype tex call ncm2#register_source({
                \ 'name' : 'vimtex-cmds',
                \ 'priority': 8,
                \ 'complete_length': -1,
                \ 'scope': ['tex'],
                \ 'matcher': {'name': 'prefix', 'key': 'word'},
                \ 'word_pattern': '\w+',
                \ 'complete_pattern': g:vimtex#re#ncm2#cmds,
                \ 'on_complete': ['ncm2#on_complete#omni', 'vimtex#complete#omnifunc'],
                \ })
    autocmd Filetype tex call ncm2#register_source({
                \ 'name' : 'vimtex-labels',
                \ 'priority': 8,
                \ 'complete_length': -1,
                \ 'scope': ['tex'],
                \ 'matcher': {'name': 'combine',
                \             'matchers': [
                \               {'name': 'substr', 'key': 'word'},
                \               {'name': 'substr', 'key': 'menu'},
                \             ]},
                \ 'word_pattern': '\w+',
                \ 'complete_pattern': g:vimtex#re#ncm2#labels,
                \ 'on_complete': ['ncm2#on_complete#omni', 'vimtex#complete#omnifunc'],
                \ })
    autocmd Filetype tex call ncm2#register_source({
                \ 'name' : 'vimtex-files',
                \ 'priority': 8,
                \ 'complete_length': -1,
                \ 'scope': ['tex'],
                \ 'matcher': {'name': 'combine',
                \             'matchers': [
                \               {'name': 'abbrfuzzy', 'key': 'word'},
                \               {'name': 'abbrfuzzy', 'key': 'abbr'},
                \             ]},
                \ 'word_pattern': '\w+',
                \ 'complete_pattern': g:vimtex#re#ncm2#files,
                \ 'on_complete': ['ncm2#on_complete#omni', 'vimtex#complete#omnifunc'],
                \ })
    autocmd Filetype tex call ncm2#register_source({
                \ 'name' : 'bibtex',
                \ 'priority': 8,
                \ 'complete_length': -1,
                \ 'scope': ['tex'],
                \ 'matcher': {'name': 'combine',
                \             'matchers': [
                \               {'name': 'prefix', 'key': 'word'},
                \               {'name': 'abbrfuzzy', 'key': 'abbr'},
                \               {'name': 'abbrfuzzy', 'key': 'menu'},
                \             ]},
                \ 'word_pattern': '\w+',
                \ 'complete_pattern': g:vimtex#re#ncm2#bibtex,
                \ 'on_complete': ['ncm2#on_complete#omni', 'vimtex#complete#omnifunc'],
                \ })
augroup END

" Sort-of-autoreload for Rmarkdown...
" Only activate when necessary!
" TODO: make a plugin out of this, it's the perfect opportunity!
" autocmd! BufWritePost *.Rmd call RMakeRmd("default")

" Triggers neomake
"autocmd! BufWritePost,BufEnter * Neomake

call neomake#configure#automake({
            \ 'BufWritePost': {'delay': 200},
            \ 'BufWinEnter': {'delay': 1000},
            \ }, 500)

" Auto-closes R
autocmd! VimLeave * if exists("g:SendCmdToR") && string(g:SendCmdToR) != "function('SendCmdToR_fake')" | call RQuit("nosave") | endif

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


