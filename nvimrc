let mapleader=" "
"""""""""""""""""""
"
" Plugins!
"
"""""""""""""""""""
filetype off
call plug#begin()
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

" UI
Plug 'scrooloose/nerdtree'
Plug 'bling/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'ryanoasis/vim-devicons'
Plug 'tpope/vim-obsession'
Plug 'tpope/vim-unimpaired'
Plug 'easymotion/vim-easymotion'
Plug 'w0rp/ale'
Plug 'Raimondi/delimitMate'
" Plug 'tpope/vim-commentary'
Plug 'tomtom/tcomment_vim'
Plug 'JamshedVesuna/vim-markdown-preview'
Plug 'ntpeters/vim-better-whitespace'

" Colors
Plug 'chriskempson/base16-vim'
Plug 'mhartington/oceanic-next'
Plug 'altercation/vim-colors-solarized'
Plug 'trevordmiller/nova-vim'
Plug 'flazz/vim-colorschemes'

" Syntax
Plug 'moll/vim-node'
Plug 'sheerun/vim-polyglot'
" Plug 'othree/javascript-libraries-syntax.vim'
Plug 'editorconfig/editorconfig-vim'
Plug 'ap/vim-css-color'
" Used for Prettier formatting
Plug 'sbdchd/neoformat'
" Plug 'mitermayer/vim-prettier', {
  " \ 'do': 'yarn install',
  " \ 'for': ['javascript', 'typescript', 'css', 'less', 'scss'] }

" Surround Shortcuts
Plug 'tpope/vim-surround'

" Terminal
Plug 'kassio/neoterm'
Plug 'christoomey/vim-tmux-navigator'
" Make focus events work in tmux
Plug 'tmux-plugins/vim-tmux-focus-events'
" Dark Powered neo-completion
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }

" Git it
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'

Plug 'junegunn/vim-emoji'

" Open GitHub
Plug 'tpope/vim-rhubarb'
call plug#end()

filetype plugin indent on

"""""""""""""""""""""""""""
"
" Settings
"
""""""""""""""""""""""""""""
set guifont=Hasklug\ Nerd\ Font:h14
set clipboard=unnamed
set gdefault
set cursorline
" set colorcolumn=80
set ruler
set nowrap
set autoread
set synmaxcol=200
set tabstop=4
set expandtab
set number
set shiftwidth=2
set softtabstop=2
set nolist
set ignorecase
set smartcase
set noerrorbells
set nostartofline
set shortmess=atIiA
"set showcmd
set scrolloff=10
" For gf to find require/imports
set suffixesadd+=.js
" So gf finds node_modules
" set path+=$PWD/node_modules
set mouse=niv

" Relative Numbers
if exists("&relativenumber")
  autocmd InsertEnter * :set number
  autocmd InsertLeave * :set relativenumber
endif

" Airline
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
" let g:airline#extensions#tabline#left_sep = ''
" let g:airline#extensions#tabline#right_sep = ''
" let g:airline#extensions#tabline#left_alt_sep = ''
" let g:airline#extensions#tabline#right_alt_sep = ''
" let g:airline_section_c = ''
let g:airline_section_y = ''
" let g:airline_section_z = airline#section#create_right(['percentage'])
let g:airline#extensions#tabline#fnamemod = ':t'
" let g:airline#extensions#tabline#buffer_idx_mode = 1
let g:airline#extensions#branch#enabled = 0
let g:airline#extensions#hunks#enabled = 0
" Show buffer number in tab - rarely use
" let g:airline#extensions#tabline#buffer_idx_mode = 1

" Deoplete
let g:deoplete#enable_at_startup = 1
let g:deoplete#file#enable_buffer_path = 1
inoremap <expr><C-j> pumvisible() ? "\<C-n>" : "\<Ctrl-j>"
inoremap <expr><C-k> pumvisible() ? "\<Up>" : "\<Ctrl-k>"

" FZF
nnoremap <leader>p :FZF<CR>

" Delimitmate
let delimitMate_expand_cr = 1
let delimitMate_expand_space = 1

" JS Library Syntax Support
let g:used_javascript_libs = 'underscore,angularjs,react,ramda'

" Markdown
let vim_markdown_preview_github=1

" Neoformat configuration
autocmd FileType javascript setlocal formatprg=prettier\ --stdin\ --single-quote\ --no-semi
let g:neoformat_try_formatprg = 1
let g:neoformat_enabled_scss = ['prettier']
" let g:neoformat_only_msg_on_error = 1
" autocmd InsertLeave *.js Neoformat
" Prettier
nmap <leader>f :Neoformat<CR>
" let g:prettier#autoformat = 0
" autocmd BufWritePre *.js,*.css,*.scss,*.less Prettier
" nmap <leader>f :PrettierAsync<cr>
" " max line lengh that prettier will wrap on
" g:prettier#config#print_width = 80
" " number of spaces per indentation level
" g:prettier#config#tab_width = 2
" " use tabs over spaces
" g:prettier#config#use_tabs = 'false'
" " print semicolons
" g:prettier#config#semi = 'false'
" " single quotes over double quotes
" g:prettier#config#single_quote = 'true'
" " print spaces between brackets
" g:prettier#config#bracket_spacing = 'false'
" " put > on the last line instead of new line
" g:prettier#config#jsx_bracket_same_line = 'false' 
" " none|es5|all
" g:prettier#config#trailing_comma = 'none'
" flow|babylon|typescript|postcss
" g:prettier#config#parser = 'flow'

" NeoTerm
let g:neoterm_position="vertical"
" Open a terminal and run tests
nmap <leader>yt :T yarn test -- --watch <CR>

" NERDTree
let NERDTreeChDirMode=2
let NERDTreeShowBookmarks=1

:set guicursor=n-v-c:block-Cursor/lCursor-blinkon0,i-ci:ver25-Cursor/lCursor,r-cr:hor20-Cursor/lCursor

" Write all buffers before navigating from Vim to tmux pane
let g:tmux_navigator_save_on_switch = 2

let g:ale_linters = {
\   'javascript': ['eslint'],
\   'html': []
\}
let g:ale_sign_column_always = 1
let g:ale_lint_on_enter = 0
let g:ale_lint_delay=300
let g:airline#extensions#ale#enabled = 1
let g:ale_set_highlights=0

" go to current error/warning
nmap :ll :ll<CR>
" next error/warning
nmap :ln :lnext<CR>
" previous error/warning
nmap :lp :lprev<CR>
set statusline+=%#warningmsg#
set statusline+=%*
set hidden

" Enable highlighting for JSDoc
let g:javascript_plugin_jsdoc = 1

syntax enable
colorscheme nova

" Customize whitespace to match Nova colorscheme
highlight ExtraWhitespace guibg=#D18EC2

" NERDTress File highlighting
function! NERDTreeHighlightFile(extension, fg, bg, guifg, guibg)
  exec 'autocmd FileType nerdtree highlight ' . a:extension .' ctermbg='. a:bg .' ctermfg='. a:fg .' guibg='. a:guibg .' guifg='. a:guifg
  exec 'autocmd FileType nerdtree syn match ' . a:extension .' #^\s\+.*'. a:extension .'$#'
endfunction

call NERDTreeHighlightFile('md', 'blue', 'none', '#83AFE5', 'none')
call NERDTreeHighlightFile('config', 'yellow', 'none', '#DADA93', 'none')
call NERDTreeHighlightFile('conf', 'yellow', 'none', '#DADA93', 'none')
call NERDTreeHighlightFile('json', 'green', 'none', '#A8CE93', 'none')
call NERDTreeHighlightFile('yml', 'green', 'none', '#A8CE93', 'none')
call NERDTreeHighlightFile('html', 'green', 'none', '#A8CE93', 'none')
call NERDTreeHighlightFile('css', 'Magenta', 'none', '#D18EC2', 'none')
call NERDTreeHighlightFile('scss', 'Magenta', 'none', '#D18EC2', 'none')
call NERDTreeHighlightFile('js', 'yellow', 'none', '#DADA93', 'none')
call NERDTreeHighlightFile('ts', 'Blue', 'none', '#6699cc', 'none')
call NERDTreeHighlightFile('ds_store', 'Gray', 'none', '#686868', 'none')
call NERDTreeHighlightFile('gitconfig', 'black', 'none', '#1E272C', 'none')
call NERDTreeHighlightFile('gitignore', 'Gray', 'none', '#6A7D89', 'none')


""""""""""""""""""""""
"
" Commands
"
""""""""""""""""""""""
" Save on Focus out
au FocusLost * :wa

""""""""""""""""""""""
"
" Mappings
"
""""""""""""""""""""""
" Open File Tree
nnoremap <leader>n :NERDTreeToggle<CR>

" Comments
map <Leader>c gcc<ESC>
" function! CommentToggle()
"     execute ':silent! s/\([^ ]\)/\/\/ \1/'
"     execute ':silent! s/^\( *\)\/\/ \/\/ /\1/'
" endfunction
" nnoremap <Leader>/ :call CommentToggle()<CR>
" vnoremap <Leader>/ :call CommentToggle()<CR>

"Emojis
set completefunc=emoji#complete

" Navigate between buffers
" Map fzf.vim ':Buffers'
nnoremap <leader>o :Buffers<CR>
nnoremap <leader>l :bnext<CR>
nnoremap <leader>h :bprevious<CR>
" Delete Buffer, but keep split open
nmap <leader>bq :bp<bar>bd #<CR>

" Git Shortcuts
nmap :gb :Gblame<CR>
nmap :gst :Gstatus<CR>
nmap :gd :Gdiff<CR>

" Unmap GitGutter stuff I don't use
let g:gitgutter_map_keys = 0

" Move to end of first line on git commit messages
autocmd FileType gitcommit call cursor(1, 99)

" Command Mode
cnoremap <C-a>  <Home>

" Normal Mode
nmap <S-Enter> O<Esc>
nmap <CR> o<Esc>
nnoremap <leader>a :Ag<CR>
nnoremap <leader>w :w<CR>
nnoremap <leader>q :q<CR>
nnoremap <leader>, <C-w><C-v><C-l>:e ~/.nvimrc<CR>

"New Vertical Split
nnoremap <Leader>v <C-w>v<C-w>l
" Move around splits quicker
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
nnoremap <leader>d :bdelete<CR>
nnoremap <leader>d! :bdelete!<CR>
nnoremap <leader>gd :term git diff %<cr>

" Visual Mode
" Move entire blocks of code
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv

" Terminal Mode
:tnoremap <Esc> <C-\><C-n>
" Alt Navigation - Maybe move to Ctrl?
:tnoremap <A-h> <C-\><C-n><C-w>h
:tnoremap <A-j> <C-\><C-n><C-w>j
:tnoremap <A-k> <C-\><C-n><C-w>k
:tnoremap <A-l> <C-\><C-n><C-w>l
:nnoremap <A-h> <C-w>h
:nnoremap <A-j> <C-w>j
:nnoremap <A-k> <C-w>k
:nnoremap <A-l> <C-w>l



