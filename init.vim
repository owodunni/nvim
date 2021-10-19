set nocompatible            " disable compatibility to old-time vi
set showmatch               " show matching brackets.
set ignorecase              " case insensitive matching
set mouse=a
set hlsearch                " highlight search results
set tabstop=2               " number of columns occupied by a tab character
set softtabstop=2           " see multiple spaces as tabstops so <BS> does the right thing
set expandtab               " converts tabs to white space
set shiftwidth=2            " width for autoindents
set autoindent              " indent a new line the same amount as the line just typed
set number                  " add line numbers
set wildmode=longest,list   " get bash-like tab completions
set cc=80                   " set an 80 column border for good coding style
filetype plugin indent on   " allows auto-indenting depending on file type
syntax on                   " syntax highlighting

:let mapleader = ","

" splitting https://neovim.io/doc/user/windows.html
set splitbelow
set splitright

nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Enable folding
set foldmethod=indent
set foldlevel=99

" Enable folding with the spacebar
nnoremap <space> za

" terminal
:tnoremap <Esc> <C-\><C-n>

" Plugins are managed with vim-plug
" https://github.com/junegunn/vim-plug
call plug#begin()
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

Plug 'scrooloose/nerdTree'

Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'davidhalter/jedi-vim'
Plug 'deoplete-plugins/deoplete-jedi'

Plug 'jiangmiao/auto-pairs'

Plug 'neomake/neomake'

Plug 'tmhedberg/SimpylFold'

Plug 'morhetz/gruvbox'

Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown'
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}

Plug 'tpope/vim-fugitive'

Plug 'junegunn/fzf', { 'do': { -> fzf#install()  }  }
Plug 'junegunn/fzf.vim'

Plug 'rust-lang/rust.vim'
Plug 'espizo/vim-gitcommit-issue-id'

"These plugins gave me funcy behaviours might have to disable these when not 
".js or .sol files
"Plug 'pangloss/vim-javascript'
"Plug 'TovarishFin/vim-solidity'
call plug#end()

" airline
let g:airline_theme='bubblegum'
let g:airline#extensions#tabline#formatter = 'unique_tail_improved'

" nerdtree
nmap <C-n> :NERDTreeToggle<CR>
let NERDTreeShowHidden=1

" jedi-vim
let g:jedi#completions_enabled = 0
let g:jedi#use_splits_not_buffers = "right"

" deoplete
inoremap <expr> <C-j> pumvisible() ? "\<C-n>" : "\<C-j>"
inoremap <expr> <C-k> pumvisible() ? "\<C-p>" : "\<C-k>"
let g:deoplete#enable_at_startup = 1

if has('win32')
  let g:python3_host_prog = 'C:\Program Files\Python38\python.exe'
endif

" Code linting
let g:neomake_python_enabled_makers = ['pylint']

" colorscheme
set background=dark
colorscheme gruvbox

" Markdown preview
let g:mkdp_auto_close = 0

" FZF file search
nnoremap \ :Rg<CR>
nnoremap <C-T> :Files<cr>
nnoremap <Leader>b :Buffers<cr>
nnoremap <Leader>s :BLines<cr>

" Use system clipboard
set clipboard=unnamedplus

" one can set a personal spelling file. Pressing zg on a word will add it.
" http://thejakeharding.com/tutorial/2012/06/13/using-spell-check-in-vim.html
" set spellfile=file/in/version/control/en.utf-8.add
set spell
set spelllang=en_us

" Rust
let g:rustfmt_autosave = 1
