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
" Plug 'scrooloose/nerdtree'
Plug 'bling/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'edkolev/tmuxline.vim'
Plug 'ryanoasis/vim-devicons'
Plug 'tpope/vim-obsession'
Plug 'tpope/vim-unimpaired'
Plug 'w0rp/ale'
Plug 'Raimondi/delimitMate'
Plug 'tpope/vim-commentary'
Plug 'JamshedVesuna/vim-markdown-preview'
Plug 'ntpeters/vim-better-whitespace'
" Auto regenerate ctags
" Plug 'craigemery/vim-autotag'
" Plug 'xolox/vim-easytags'

" Colors
Plug 'chriskempson/base16-vim'
" Plug 'KeitaNakamura/neodark.vim'
Plug 'rakr/vim-one'
Plug 'flazz/vim-colorschemes'
Plug 'joshdick/onedark.vim'

" Syntax
Plug 'moll/vim-node'
Plug 'pangloss/vim-javascript'
Plug 'sheerun/vim-polyglot'

" Plug 'mxw/vim-jsx'
" Plug 'othree/yajs.vim'
Plug 'editorconfig/editorconfig-vim'
Plug 'ap/vim-css-color'
" Highlight SCSS color variables
Plug 'shmargum/vim-sass-colors'

Plug 'mbbill/undotree'
Plug 'easymotion/vim-easymotion'
" Auto de-highlight searched words
Plug 'haya14busa/incsearch.vim'
" Surround Shortcuts
Plug 'tpope/vim-surround'

" Terminal
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
set guifont=Hasklug\ Nerd\ Font:h15
" set clipboard=unnamed
set gdefault
set cursorline
set ruler
set nowrap
set autoread
" set autochdir
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
set path+=$PWD/node_modules
" Strictly for ClearVoice app webpack alias
set path+=$PWD/client
set mouse=niv
set relativenumber
" Maintain undo history between sessions
set undofile
set undodir=~/.config/nvim/undodir

" Folding
set foldmethod=syntax
set foldcolumn=1
let javascript_fold=1
set foldlevelstart=99

" Airline
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'unique_tail_improved'
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline#extensions#hunks#enabled = 0
let g:airline_section_a = airline#section#create(['mode', ' ', 'branch'])
let g:airline_section_b = ''
let g:airline_section_c = airline#section#create([''])
let g:airline_section_y = airline#section#create(['filetype', ' ' , 'ffenc'])
let g:airline_section_z = airline#section#create(['%l'])

let g:_extensions = ['ale', 'branch', 'quickfix', 'tabline']
" Disable the theme as we'll customize below
let g:airline#extensions#tmuxline#enabled = 0
let g:airline#extensions#ale#enabled = 1

" Tmuxline
let g:tmuxline_theme = 'vim_statusline_2'
let g:tmuxline_powerline_separators = 0
" Configure the tmux line:
" " Session Name  ->  Active Windows  ->  Time
let g:tmuxline_preset = {
      \'a'    : '#S',
      \'cwin'  : '#W',
      \'win' : ['#W','#I'],
      \'z'    : '%r'}

" Deoplete
let g:deoplete#enable_at_startup = 1
let g:deoplete#file#enable_buffer_path = 1
inoremap <expr><C-j> pumvisible() ? "\<C-n>" : "\<Ctrl-j>"
inoremap <expr><C-k> pumvisible() ? "\<Up>" : "\<Ctrl-k>"

" FZF
nnoremap <leader>p :FZF<CR>
nnoremap <leader>t :Tags<CR>
nnoremap <leader>g :BTags<CR>


" Delimitmate
let delimitMate_expand_cr = 1
let delimitMate_expand_space = 1

" JS Library Syntax Support
let g:used_javascript_libs = 'jquery,underscore,angularjs,react,ramda'


" Markdown
let vim_markdown_preview_github=1
let vim_markdown_preview_browser='Google Chrome'

" NERDTree
" let NERDTreeChDirMode=2
" let NERDTreeShowBookmarks=1
" let NERDTreeShowHidden=1

:set guicursor=n-v-c:block-Cursor/lCursor-blinkon0,i-ci:ver25-Cursor/lCursor,r-cr:hor20-Cursor/lCursor

" Write all buffers before navigating from Vim to tmux pane
let g:tmux_navigator_save_on_switch = 2

" Enable Ale fixers (for prettier formatting)
let g:ale_fixers = {}
let g:ale_fixers['javascript'] = ['prettier']
let g:ale_fixers['scss'] = ['prettier']
let g:ale_fixers['css'] = ['prettier']
let g:ale_fixers['haskell'] = ['brittany']
" Enabling this is annoying for package.json files
" let g:ale_fixers['json'] = ['prettier']
let g:ale_fix_on_save = 1

nmap <leader>f :ALEFix<CR>

let g:ale_linters = {
\   'javascript': ['eslint'],
\   'html': ['htmlhint'],
\   'liquid': ['htmlhint']
\}
let g:ale_sign_column_always = 1
let g:ale_sign_error = '●' " Less aggressive than the default '>>'
let g:ale_sign_warning = '.'
let g:ale_lint_on_enter = 0
let g:ale_html_htmlhint_use_global = "1"
let g:ale_set_highlights = 0
let g:ale_javascript_prettier_use_local_config = 1

let g:jsx_ext_required = 0

" Show Error?
set statusline+=%#warningmsg#
set statusline+=%*
" Only show a line when there are more than one window?
" set laststatus=
set hidden

" Enable highlighting for JSDoc
let g:javascript_plugin_jsdoc = 1

" Polyglot
" Polyglot broke the JS syntax stuff :(
" let g:polyglot_disabled = ['js']
let g:javascript_plugin_flow = 1

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
" nnoremap <leader>n :NERDTreeToggle<CR>
nnoremap <leader>n :Vexplore<CR>
let g:netrw_liststyle = 3 " Tree View
let g:netrw_banner = 0
" let g:netrw_winsize = 25 " 25% of page
" let g:netrw_browse_split = 4 " Open in previous window




" Comments
map <Leader>c gcc<ESC>

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

" incsearch
map /  <Plug>(incsearch-forward)
map ?  <Plug>(incsearch-backward)
map g/ <Plug>(incsearch-stay)
let g:incsearch#auto_nohlsearch = 1
" Automatic nohsearch
map n  <Plug>(incsearch-nohl-n)
map N  <Plug>(incsearch-nohl-N)
map *  <Plug>(incsearch-nohl-*)
map #  <Plug>(incsearch-nohl-#)
" map g* <Plug>(incsearch-nohl-g*)
" map g# <Plug>(incsearch-nohl-g#)

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
nnoremap <leader>; :noh<cr>

" Visual Mode
" Move entire blocks of code
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv

""""""""""""""""""""""""""""
"
" Colors
"
""""""""""""""""""""""""""""
syntax enable
let &t_8f="\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b="\<Esc>[48;2;%lu;%lu;%lum"
set termguicolors
" One Dark
let g:onedark_terminal_italics=1
let g:airline_theme='onedark'
colorscheme onedark




" let g:one_allow_italics = 1

" OceanicNext
" let g:oceanic_next_terminal_bold = 1
" let g:oceanic_next_terminal_italic = 1
" let g:airline_theme='oceanicnext'
" colorscheme OceanicNext


" Neo Dark
" let g:neodark#use_custom_terminal_theme = 1
" colorscheme neodark
" let g:airline_theme='neodark'

" Customize whitespace to match Nova colorscheme
highlight ExtraWhitespace guibg=#D18EC2

" NERDTrees File highlighting
" function! NERDTreeHighlightFile(extension, fg, bg, guifg, guibg)
"   exec 'autocmd FileType nerdtree highlight ' . a:extension .' ctermbg='. a:bg .' ctermfg='. a:fg .' guibg='. a:guibg .' guifg='. a:guifg
"   exec 'autocmd FileType nerdtree syn match ' . a:extension .' #^\s\+.*'. a:extension .'$#'
" endfunction

" When using `dd` in the quickfix list, remove the item from the quickfix list.
function! RemoveQFItem()
  let curqfidx = line('.') - 1
  let qfall = getqflist()
  call remove(qfall, curqfidx)
  call setqflist(qfall, 'r')
  execute curqfidx + 1 . "cfirst"
  :copen
endfunction
:command! RemoveQFItem :call RemoveQFItem()

" Use map <buffer> to only map dd in the quickfix window. Requires +localmap
autocmd FileType qf map <buffer> dd :RemoveQFItem<cr>

" call NERDTreeHighlightFile('md', 'blue', 'none', '#83AFE5', 'none')
" call NERDTreeHighlightFile('config', 'yellow', 'none', '#DADA93', 'none')
" call NERDTreeHighlightFile('conf', 'yellow', 'none', '#DADA93', 'none')
" call NERDTreeHighlightFile('json', 'green', 'none', '#A8CE93', 'none')
" call NERDTreeHighlightFile('yml', 'green', 'none', '#A8CE93', 'none')
" call NERDTreeHighlightFile('html', 'green', 'none', '#A8CE93', 'none')
" call NERDTreeHighlightFile('css', 'Magenta', 'none', '#D18EC2', 'none')
" call NERDTreeHighlightFile('scss', 'Magenta', 'none', '#D18EC2', 'none')
" call NERDTreeHighlightFile('js', 'yellow', 'none', '#DADA93', 'none')
" call NERDTreeHighlightFile('ts', 'Blue', 'none', '#6699cc', 'none')
" call NERDTreeHighlightFile('ds_store', 'Gray', 'none', '#686868', 'none')
