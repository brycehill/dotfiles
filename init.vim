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

" Intelisense, Linting, Formatting
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" UI
Plug 'bling/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'edkolev/tmuxline.vim'
Plug 'ryanoasis/vim-devicons'
Plug 'tpope/vim-obsession'
Plug 'tpope/vim-unimpaired'
Plug 'Raimondi/delimitMate'
Plug 'tpope/vim-commentary'
Plug 'JamshedVesuna/vim-markdown-preview'
Plug 'ntpeters/vim-better-whitespace'
Plug 'unblevable/quick-scope'

" Colors
Plug 'chriskempson/base16-vim'
Plug 'arcticicestudio/nord-vim'
Plug 'tobiasandersen/oceanic-next'
Plug 'KeitaNakamura/neodark.vim'
Plug 'rakr/vim-one'
Plug 'flazz/vim-colorschemes'
Plug 'joshdick/onedark.vim'
Plug 'drewtempelmeyer/palenight.vim'

" Syntax
Plug 'moll/vim-node'
Plug 'styled-components/vim-styled-components', { 'branch': 'main' }
Plug 'jonsmithers/vim-html-template-literals'
Plug 'sheerun/vim-polyglot'
Plug 'mhartington/nvim-typescript', {'do': './install.sh'}
Plug 'leafgarland/typescript-vim'
Plug 'alx741/yesod.vim'
Plug 'pbrisbin/vim-syntax-shakespeare'
Plug 'ryym/vim-riot'
Plug 'reasonml-editor/vim-reason-plus'
Plug 'editorconfig/editorconfig-vim'
" Highlight CSS/SCSS color variables
Plug 'ap/vim-css-color'
" Plug 'shmargum/vim-sass-colors'

" To enable more of the features of rust-analyzer, such as inlay hints and more!
Plug 'neovim/nvim-lspconfig'
Plug 'simrat39/rust-tools.nvim'
Plug 'rust-lang/rust.vim',         { 'for': 'rust' }


" Debugging
Plug 'nvim-lua/plenary.nvim'
Plug 'mfussenegger/nvim-dap'


Plug 'mbbill/undotree'
" Plug 'easymotion/vim-easymotion'
" Auto de-highlight searched words
Plug 'haya14busa/incsearch.vim'
" Surround Shortcuts
Plug 'tpope/vim-surround'

" Terminal
Plug 'christoomey/vim-tmux-navigator'
" Make focus events work in tmux
Plug 'tmux-plugins/vim-tmux-focus-events'

" Dark Powered neo-completion
" Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
" For Denite features
" Plug 'Shougo/denite.nvim'

" Because default foldmethod=syntax is SLOW
Plug 'Konfekt/FastFold'

" Git it
Plug 'tpope/vim-fugitive'
" Bitbucket
Plug 'tommcdo/vim-fubitive'
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
set guifont=Hasklug\ Nerd\ Font:h13\ Bold
" set clipboard=unnamed
set gdefault
set cursorline
set ruler
set nowrap
set autoread
" set autochdir
set synmaxcol=200

set colorcolumn=80

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
set foldlevelstart=99
"Emojis
set completefunc=emoji#complete

"
" Airline
"

let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 0
let g:airline#extensions#tabline#formatter = 'unique_tail_improved'
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline#extensions#hunks#enabled = 0
let g:airline_section_a = airline#section#create(['mode', ' ', 'branch'])
let g:airline_section_b = ''
let g:airline_section_c = airline#section#create([''])
let g:airline_section_y = airline#section#create(['filetype', ' ' , 'ffenc'])
let g:airline_section_z = airline#section#create(['%l'])
let g:_extensions = ['branch', 'quickfix', 'tabline']
" Disable the theme as we'll customize below
" let g:airline#extensions#tmuxline#enabled = 1

" Tmuxline - If not setting theme via plugin
" let g:tmuxline_theme = 'vim_statusline_2'
" let g:tmuxline_powerline_separators = 0
" Configure the tmux line:
" " Session Name  ->  Active Windows  ->  Time
" let g:tmuxline_preset = {
"       \'a'    : '#S',
"       \'cwin'  : '#W',
"       \'win' : ['#W','#I'],
"       \'z'    : '%r'}

"
" Deoplete
"

" let g:deoplete#enable_at_startup = 1
" let g:deoplete#file#enable_buffer_path = 1

" call deoplete#custom#option('max_list', 10)
" call deoplete#custom#option('sources', {
"       \ '_': ['buffer']
"       \})

inoremap <expr><C-j> pumvisible() ? "\<C-n>" : "\<Ctrl-j>"
inoremap <expr><C-k> pumvisible() ? "\<Up>" : "\<Ctrl-k>"

" Disable Interactive History
nnoremap q: <nop>
nnoremap Q <nop>

"
" FZF
"

nnoremap <leader>p :FZF<CR>
nnoremap <leader>t :Tags<CR>
nnoremap <leader>g :BTags<CR>
" Used to delete buffers from buffer pane
" Hopefully supported within FZF someday
let g:fzf_action = {
    \ 'ctrl-q': 'wall | bdelete',
    \ 'ctrl-t': 'tab split',
    \ 'ctrl-x': 'split',
    \ 'ctrl-v': 'vsplit' }

" function! RipgrepFzf(query, fullscreen)
"   let command_fmt = 'rg --column --line-number --no-heading --color=always --smart-case %s || true'
"   let initial_command = printf(command_fmt, shellescape(a:query))
"   let reload_command = printf(command_fmt, '{q}')
"   let spec = {'options': ['--query', a:query, '--bind', 'change:reload:'.reload_command]}
"   call fzf#vim#grep(initial_command, 1, fzf#vim#with_preview(spec), a:fullscreen)
" endfunction

" command! -nargs=* -bang Rg call RipgrepFzf(<q-args>, <bang>0)

"
" Delimitmate
"

let delimitMate_expand_cr = 1
let delimitMate_expand_space = 1
" JS Library Syntax Support
let g:used_javascript_libs = 'jquery,underscore,angularjs,react,ramda'

"
" Markdown
"

" Default: '<C-p>'
let vim_markdown_preview_github=1
let vim_markdown_preview_browser='Google Chrome'



"
" Quick Scope
"

let g:qs_max_chars=80
" Trigger a highlight in the appropriate direction when pressing these keys:
let g:qs_highlight_on_keys = ['f', 'F', 't', 'T']

:set guicursor=n-v-c:block-Cursor/lCursor-blinkon0,i-ci:ver25-Cursor/lCursor,r-cr:hor20-Cursor/lCursor

" Write all buffers before navigating from Vim to tmux pane
let g:tmux_navigator_save_on_switch = 2


"
"TypeScript
"
let g:typescript_indent_disable = 1

"
"CoC
"

" let g:airline#extensions#coc#enabled = 1
let g:jsx_ext_required = 0

" Show Error?
set statusline+=%#warningmsg#
set statusline+=%*
" Only show a line when there are more than one window?
" TextEdit might fail if hidden is not set.
set hidden

" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup

" Give more space for displaying messages.
set cmdheight=2

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
set signcolumn=yes

"
" Polyglot
"

" Enable highlighting for JSDoc
let g:javascript_plugin_jsdoc = 1
let g:javascript_plugin_flow = 1


"
" Netrw
"

let g:netrw_liststyle = 3 " Tree View
let g:netrw_banner = 0

"
" GitGutter
"

" Unmap GitGutter stuff I don't use
let g:gitgutter_map_keys = 0

" Fugitive Bitbucket
let g:fubitive_domain_pattern = 'lstools\.nintendo\.com\bitbucket/projects/repos/'

"
" Rust
"
let g:rustfmt_autosave = 1


"
" Styled Components
"

" Make styled-components
" Maybe remove? if slow?
autocmd BufEnter *.{js,jsx,ts,tsx} :syntax sync fromstart
autocmd BufLeave *.{js,jsx,ts,tsx} :syntax sync clear

"
" Terminal
"
" tnoremap <Esc> <C-\><C-n>

" " Maps ctrl-b + c to open a new tab window
" nnoremap <C-b>c :tabnew +terminal<CR>
" tnoremap <C-b>c <C-\><C-n>:tabnew +terminal<CR>

" " Maps ctrl-b + - to open a new horizontal split with a terminal
" nnoremap <C-b>- :new +terminal<CR>
" tnoremap <C-b>- <C-\><C-n>:new +terminal<CR>

" " Maps ctrl-b + | to open a new vertical split with a terminal
" nnoremap <C-b>| :vnew +terminal<CR>
" tnoremap <C-b>| <C-\><C-n>:vnew +terminal<cr>

" augroup neovim_terminal
"   autocmd!

"   " Enter Terminal-mode (insert) automatically
"   autocmd TermOpen * startinsert

"   " Disables number lines on terminal buffers
"   autocmd TermOpen * :set nonumber norelativenumber
" augroup END


""""""""""""""""""""""
"
" Custom Commands
"
""""""""""""""""""""""


" Save on Focus out
au FocusLost * :wa


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

" Move to end of first line on git commit messages
autocmd FileType gitcommit call cursor(1, 99)



""""""""""""""""""""""
"
" Mappings
"
""""""""""""""""""""""

"
" Normal Mode
"

nnoremap <leader>n :Vexplore<CR>
" Navigate between buffers
nnoremap <leader>o :Buffers<CR>
nnoremap <leader>l :bnext<CR>
nnoremap <leader>h :bprevious<CR>
nnoremap <leader>a :Rg<CR>
nnoremap <leader>w :w<CR>
nnoremap <leader>q :q<CR>
nnoremap <leader>, <C-w><C-v><C-l>:e ~/.config/nvim/init.vim<CR>
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
" Vertical diff splits
set diffopt+=vertical
nnoremap <leader>; :noh<cr>
" Delete Buffer, but keep split open
nmap <leader>bq :bp<bar>bd #<CR>
nmap <S-Enter> O<Esc>
nmap <CR> o<Esc>

" Git Shortcuts
nmap :gb :Gblame<CR>
nmap :gst :Gstatus<CR>
nmap :gd :Gdiff<CR>

" Comments
map <Leader>c gcc<ESC>

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


"
" Command Mode
"

cnoremap <C-a>  <Home>

"
" Visual Mode
"

" Move entire blocks of code
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv


""""""""""""""""""""""""""""
"
" Colors
"
""""""""""""""""""""""""""""


" Customize whitespace to match Nova colorscheme
highlight ExtraWhitespace guibg=#D18EC2
syntax enable
let &t_8f="\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b="\<Esc>[48;2;%lu;%lu;%lum"
set termguicolors


"
" Themes
"

" One Dark
" let g:onedark_hide_endofbuffer=1
" let g:onedark_terminal_italics=1
" let g:airline_theme='onedark'
" colorscheme onedark

" One
let g:airline_theme='one'
let g:one_allow_italics = 1
colorscheme one

" Nord
" let g:nord_italic = 1
" let g:nord_underline = 1
" colorscheme nord

" OceanicNext
" let g:oceanic_next_terminal_bold = 1
" let g:oceanic_next_terminal_italic = 1
" let g:airline_theme='oceanicnext'
" colorscheme OceanicNext

" Neo Dark
" let g:neodark#use_custom_terminal_theme = 1
" let g:airline_theme='neodark'
" colorscheme neodark

highlight ColorColumn ctermbg=gray guibg=gray
" highlight ColorColumn ctermbg=16

