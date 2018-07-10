set nocompatible
let mapleader=" "

""""""""""""""""""
"
" Plugins
"
"" """"""""""""""""
filetype off
call plug#begin()
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

" " UI
" Plug 'scrooloose/nerdtree'
Plug 'bling/vim-airline'
" Plug 'vim-airline/vim-airline-themes'
Plug 'ryanoasis/vim-devicons'
" Plug 'tpope/vim-obsession'
" Plug 'tpope/vim-unimpaired'
" Plug 'easymotion/vim-easymotion'
" Plug 'w0rp/ale'
" Plug 'Raimondi/delimitMate'
Plug 'tpope/vim-commentary'
" Plug 'JamshedVesuna/vim-markdown-preview'

" " Colors
Plug 'chriskempson/base16-vim'
Plug 'mhartington/oceanic-next'
" Plug 'altercation/vim-colors-solarized'
" Plug 'flazz/vim-colorschemes'
" Plug 'ntpeters/vim-better-whitespace'

" " Syntax
" Plug 'sheerun/vim-polyglot'
Plug 'pangloss/vim-javascript'
" "Plug 'othree/html5.vim'
" "Plug 'hail2u/vim-css3-syntax'
"Plug 'mxw/vim-jsx'
" Plug 'othree/yajs.vim'
" Plug 'ruanyl/vim-fixmyjs'
" " Plug 'othree/javascript-libraries-syntax.vim'
" " Plug 'mattn/emmet-vim'
" Plug 'editorconfig/editorconfig-vim'
" Plug 'ap/vim-css-color'


" " Dark Powered neo-completion
" Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }

" " Git it
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
" Open GitHub
Plug 'tpope/vim-rhubarb'

call plug#end()

filetype plugin indent on

""""""""""""""""""""
"
" Settings
"
"
"""""""""""""""""""""
set background=dark
set guifont=Source\ Code\ Pro\ for\ Powerline:h14
set ignorecase
set smartcase
set relativenumber number
set incsearch
set hlsearch
set ignorecase
set expandtab
set gdefault
set shiftwidth=2
set softtabstop=2
set title
set showmode
set showcmd
set clipboard=unnamed
set mouse=a
set noerrorbells
set colorcolumn=80
set ruler
set cursorline
set suffixesadd+=.js " For gf to find require/imports
set backspace=indent,eol,start
set shortmess+=A
syntax on
filetype plugin indent on

" " Airline
" let g:airline_powerline_fonts = 1
" let g:airline#extensions#tabline#enabled = 1
" let g:airline_section_y = ''
" " let g:airline_section_z = airline#section#create_right(['percentage'])
" let g:airline#extensions#tabline#fnamemod = ':t'
" " let g:airline#extensions#tabline#buffer_idx_mode = 1
" let g:airline#extensions#branch#enabled = 0
" let g:airline#extensions#hunks#enabled = 0
" " Show buffer number in tab - rarely use
" " let g:airline#extensions#tabline#buffer_idx_mode = 1

" " Ale Linting
" let g:ale_linters = {
" \   'javascript': ['eslint'],
" \   'html': []
" \}
" let g:ale_sign_column_always = 1
" let g:ale_lint_on_enter = 0
" let g:ale_lint_delay=300
" let g:airline#extensions#ale#enabled = 1
" let g:ale_set_highlights=0


" " Comments
" map <Leader>c gcc<ESC>
" function! CommentToggle()
"     execute ':silent! s/\([^ ]\)/\/\/ \1/'
"     execute ':silent! s/^\( *\)\/\/ \/\/ /\1/'
" endfunction
" nnoremap <Leader>/ :call CommentToggle()<CR>
" vnoremap <Leader>/ :call CommentToggle()<CR>

" Change cursor shape in diff modes
let &t_SI = "\<Esc>]50;CursorShape=1\x7"
let &t_SR = "\<Esc>]50;CursorShape=2\x7"
let &t_EI = "\<Esc>]50;CursorShape=0\x7"

" FZF
nnoremap <leader>p :FZF<CR>

" " Git stuff
" nmap <leader>gb :Gblame<CR>
" nmap <leader>gs :Gstatus<CR>
" nmap <leader>gd :Gdiff<CR>

" cnoremap <C-a>  <Home>

" inoremap jj <ESC> <CR>
" inoremap <F1> <ESC>

" " NerdTree
" nnoremap <leader>n :NERDTreeToggle<CR>

" " vim-jsx
" "let g:jsx_ext_required = 0
" """"""""""""""""""""""
" "
" " Commands
" "
" """"""""""""""""""""""
" " Save on Focus out
" au FocusLost * :wa

" """"""""""""""""""""""
" "
" " Mappings
" "
" """"""""""""""""""""""
" "nmap <S-Enter> O<Esc>
" nmap <CR> o<Esc>
" nnoremap <Leader>a :Ag!<space>
" nnoremap <leader>w :w<CR>
" nnoremap <leader>q :q<CR>
" nnoremap <leader>, <C-w><C-v><C-l>:e ~/.vimrc<CR>
" nnoremap <tab> %
" nnoremap <F1> <ESC>
" nnoremap ; :
" " Clear search highlighting
" nnoremap <leader>c :noh<CR>
" " Delete until semi
" nnoremap d; dt;

" "New Vertical Split
" nnoremap <Leader>v <C-w>v<C-w>h
" nnoremap <C-x> :split<CR>
" " Move around splits quicker
" nnoremap <C-h> <C-w>h
" nnoremap <C-j> <C-w>j
" nnoremap <C-k> <C-w>k
" nnoremap <C-l> <C-w>l
" " Buffer deletion
" nnoremap <leader>d :bdelete<CR>
" nnoremap <leader>d! :bdelete!<CR>
" nnoremap <leader>gd :term git diff %<cr>

" vnoremap <tab> %
" vnoremap <F1> <ESC>

" Theme
syntax enable
" for vim 7
set t_co=256

" for vim 8
if (has("termguicolors"))
  set termguicolors
endif

colorscheme base16-oceanicnext
