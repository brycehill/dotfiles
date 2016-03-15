let mapleader=" "

"""""""""""""""""""
"
" Plugins!
"
"""""""""""""""""""
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'bling/vim-airline'
Plugin 'jeffkreeftmeijer/vim-numbertoggle'
Plugin 'chriskempson/base16-vim'
Plugin 'mhartington/oceanic-next'
Plugin 'tpope/vim-obsession'
Plugin 'tpope/vim-unimpaired'
Plugin 'jlanzarotta/bufexplorer'
Plugin 'easymotion/vim-easymotion'
"Plugin 'benekastah/neomake'

" Syntax"
"Plugin 'vim-scripts/ctags.vim'
Plugin 'othree/yajs.vim'
"Plugin 'scrooloose/syntastic'
Plugin 'Raimondi/delimitMate'
Plugin 'othree/html5.vim'
Plugin 'mustache/vim-mustache-handlebars'
Plugin 'hail2u/vim-css3-syntax'
Plugin 'wavded/vim-stylus'
Plugin 'dag/vim2hs'
Plugin 'evanmiller/nginx-vim-syntax'
Plugin 'digitaltoad/vim-jade'
Plugin 'tpope/vim-commentary'
Plugin 'editorconfig/editorconfig-vim'
Plugin 'ap/vim-css-color'
"Plugin 'Valloric/YouCompleteMe'
"Plugin 'Shougo/deoplete.nvim'

" Git it
Plugin 'tpope/vim-fugitive'
Plugin 'airblade/vim-gitgutter'

" Faster searching
Plugin 'rking/ag.vim'
call vundle#end()
filetype plugin indent on

"""""""""""""""""""""""""""
"
" Settings
"
""""""""""""""""""""""""""""
"highlight SyntasticErrorSign guifg=white guibg=red
set guifont=Source\ Code\ Pro\ for\ Powerline:h12
set clipboard=unnamed
set gdefault
set cursorline
set colorcolumn=80
set ruler
set tabstop=4
set expandtab
set shiftwidth=4
set softtabstop=4
set nolist
set autochdir
set ignorecase
set smartcase
set noerrorbells
set nostartofline
set shortmess=atIiA
"set showcmd
set scrolloff=10
set suffixesadd+=.js " For gf to find require/imports

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

" Use ag for fast ctrlps
if executable('ag')
    let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
    let g:ctrlp_use_caching = 0
endif

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
"let g:airline#extensions#syntastic#enabled = 1
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline_theme = 'oceanicnext'

" Buffergator
let g:buffergator_viewport_split_policy = 'R'

" CtrlP
nnoremap <leader>p :CtrlP<CR>
nnoremap <leader>u :CtrlPBuffer<CR>
nnoremap <leader>m :CtrlPMRU<CR>
let g:ctrlp_working_path_mode = 'r'
let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git\'
if has("gui_macvim")
    map <D-t> :CtrlP<CR>
   imap <D-t> <ESC>:CtrlP<CR>
endif

" Delimitmate
let delimitMate_expand_cr = 1

" NeoVim
let $NVIM_TUI_ENABLE_CURSOR_SHAPE=1

" NERDTree
let NERDTreeChDirMode=2
let NERDTreeShowBookmarks=1

" Neomake
autocmd! BufWritePost * Neomake
let g:neomake_javascript_jshint_maker = {
    \ 'args': ['--verbose'],
    \ 'errorformat': '%A%f: line %l\, col %v\, %m \(%t%*\d\)',
    \ }
let g:neomake_javascript_enabled_makers = ['jshint']
" Syntastic
"let g:syntastic_javascript_checkers = ['eslint'] ", 'jshint']
"let g:syntastic_html_checkers = ['jshint']
"let g:syntastic_html_tidy_exec = 'tidy5'
"let g:syntastic_disabled_filetypes=['html']
"let g:syntastic_enable_signs=1
"let g:syntastic_always_populate_loc_list = 1
"let g:syntastic_check_on_wq = 0
"let g:syntastic_check_on_open = 1
set statusline+=%#warningmsg#
"set statusline+=%{SyntasticStatuslineFlag()}
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
" auto complete file names
"inoremap <Tab> <C-X><C-F>

" Normal Mode
nmap <S-Enter> O<Esc>
nmap <CR> o<Esc>
nnoremap <Leader>a :Ag!<space>
nnoremap <leader>w :w<CR>
nnoremap <leader>q :q<CR>
nnoremap <leader>, :e ~/.nvimrc <CR>

syntax enable
"let g:solarized_bold = 0
"let g:solarized_underline = 0
"let g:solarized_italic = 0
"let $NVIM_TUI_ENABLE_TRUE_COLOR=1
"colorscheme solarized
colorscheme OceanicNext
" base16-flat
set background=dark

