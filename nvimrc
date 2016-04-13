let mapleader=" "

"""""""""""""""""""
"
" Plugins!
"
"""""""""""""""""""
filetype off
call plug#begin()
Plug 'ctrlpvim/ctrlp.vim'
"Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
"Plug 'junegunn/fzf.vim'
Plug 'scrooloose/nerdtree'
Plug 'bling/vim-airline'
Plug 'jeffkreeftmeijer/vim-numbertoggle'
Plug 'chriskempson/base16-vim'
Plug 'brycehill/oceanic-next'
Plug 'romainl/flattened'
Plug 'tpope/vim-obsession'
Plug 'tpope/vim-unimpaired'
Plug 'jlanzarotta/bufexplorer'
Plug 'easymotion/vim-easymotion'
Plug 'benekastah/neomake'
Plug 'Raimondi/delimitMate'
Plug 'tpope/vim-commentary'

" Syntax"
Plug 'othree/yajs.vim'
Plug 'mattn/emmet-vim'
Plug 'othree/html5.vim'
Plug 'leafgarland/typescript-vim'
Plug 'hail2u/vim-css3-syntax'
Plug 'wavded/vim-stylus'
Plug 'dag/vim2hs'
Plug 'evanmiller/nginx-vim-syntax'
Plug 'digitaltoad/vim-jade'
Plug 'editorconfig/editorconfig-vim'
Plug 'ap/vim-css-color'
"Plugin 'vim-scripts/ctags.vim'
"Plugin 'Valloric/YouCompleteMe'
"Plugin 'Shougo/deoplete.nvim'

" Faster searching
Plug 'rking/ag.vim'

" Git it
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
call plug#end()

filetype plugin indent on

"""""""""""""""""""""""""""
"
" Settings
"
""""""""""""""""""""""""""""
set guifont=Source\ Code\ Pro\ for\ Powerline:h12
set clipboard=unnamed
set gdefault
set cursorline
set colorcolumn=80
set ruler
set nowrap
set tabstop=4
set expandtab
set shiftwidth=4
set softtabstop=4
set nolist
set ignorecase
set smartcase
set noerrorbells
set nostartofline
set shortmess=atIiA
"set showcmd
set scrolloff=10
set suffixesadd+=.js " For gf to find require/imports
"set mouse=niv

if exists("&relativenumber")
	set relativenumber
"	au BufReadPost * set relativenumber
endif

" Strip trailing whitespace (,ss)
function! StripWhitespace()
	let save_cursor = getpos(".")
	let old_query = getreg('/')
	:%s/\s\+$//e
	call setpos('.', save_cursor)
	call setreg('/', old_query)
endfunction
noremap <leader>ss :call StripWhitespace()<CR>
highlight ExtraWhitespace ctermbg=darkgreen guibg=darkgreen
" Show trailing whitespace:
:match ExtraWhitespace /\s\+$/

" Ag
let g:ag_working_path_mode="r"

" Airline
"let g:airline#extensions#tabline#enabled = 1
"let g:airline#extensions#tabline#left_sep = ''
"let g:airline#extensions#tabline#right_sep = ''
"let g:airline#extensions#tabline#left_alt_sep = ''
"let g:airline#extensions#tabline#left_alt_sep = ''
let g:airline#extensions#tabline#right_alt_sep = ''
let g:airline_left_sep = ''
let g:airline_right_sep = ''
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline_theme = 'oceanicnext'

" BufExplorer
let g:bufExplorerShowRelativePath=1

" Emmet
let g:user_emmet_install_global = 0
autocmd FileType html,css EmmetInstall
imap <expr> <tab> emmet#expandAbbrIntelligent("\<tab>")

" CtrlP
nnoremap <leader>p :CtrlP<CR>
nnoremap <leader>u :CtrlPBuffer<CR>
nnoremap <leader>m :CtrlPMRU<CR>

" Use ag for fast ctrlps
if executable('ag')
    let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
    let g:ctrlp_use_caching = 0
endif

" FZF
" nnoremap <leader>p :FZF<CR>
" let g:ctrlp_working_path_mode = 'r'
" let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git\'

" Delimitmate
let delimitMate_expand_cr = 1

" NeoVim
let $NVIM_TUI_ENABLE_CURSOR_SHAPE=1

" NERDTree
let NERDTreeChDirMode=2
let NERDTreeShowBookmarks=1

" Neomake
"let g:neomake_open_list=2 " Open List or Error
autocmd! BufWritePost * Neomake
let g:neomake_javascript_jshint_maker = {
    \ 'args': ['--verbose'],
    \ 'errorformat': '%A%f: line %l\, col %v\, %m \(%t%*\d\)',
    \ }
let g:neomake_javascript_enabled_makers = ['jshint']

let g:neomake_warning_sign = {
  \ 'text': '•',
  \ 'texthl': 'WarningMsg',
  \ }

let g:neomake_error_sign = {
  \ 'text': '•',
  \ 'texthl': 'ErrorMsg',
  \ }

set statusline+=%#warningmsg#
set statusline+=%*
set hidden

" Deoplete
let g:deoplete#enable_at_startup = 1

""""""""""""""""""""""
"
" Mappings
"
""""""""""""""""""""""
" Open File Tree
nnoremap <leader>n :NERDTreeToggle<CR>

" Comments
map <Leader>c gcc<ESC>
function! CommentToggle()
    execute ':silent! s/\([^ ]\)/\/\/ \1/'
    execute ':silent! s/^\( *\)\/\/ \/\/ /\1/'
endfunction
nnoremap <Leader>/ :call CommentToggle()<CR>
vnoremap <Leader>/ :call CommentToggle()<CR>

" Navigate between buffers
nnoremap <leader>l :bnext<CR>
nnoremap <leader>h :bprevious<CR>
nmap <leader>jj :BuffergatorMruCyclePrev<cr>
nmap <leader>kk :BuffergatorMruCycleNext<cr>
nmap <leader>bq :bp <BAR> bd #<cr>

" Git Shortcuts
nmap <leader>gb :Gblame<CR>
nmap <leader>gs :Gstatus<CR>
nmap <leader>gd :Gdiff<CR>

" Command Mode
:cnoremap <C-a>  <Home>

" Insert Mode
inoremap jj <ESC> <CR>

" Normal Mode
nmap <S-Enter> O<Esc>
nmap <CR> o<Esc>
nnoremap <Leader>a :Ag!<space>
nnoremap <leader>w :w<CR>
nnoremap <leader>q :q<CR>
nnoremap <leader>, :e ~/.nvimrc <CR>

syntax enable
let $NVIM_TUI_ENABLE_TRUE_COLOR=1
colorscheme OceanicNext
set background=dark

