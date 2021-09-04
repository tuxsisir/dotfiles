set hidden
set number                              " show line numbers and relative number
" set relativenumber                    " relative number
set linebreak                           " break lines
set showbreak=+++                       " wrapped line prefix
set textwidth=100                       " line wrap (number of cols)
set showmatch                           " highlight braces
" set spell                             " spell check

" search options
set hlsearch
set ignorecase
set smartcase
set incsearch

autocmd BufWritePre * %s/\s\+$//e       " trim white spaces on save

filetype plugin indent on

set autoindent                          " auto-indent new lines
set expandtab                           " use spaces instead of tabs
set shiftwidth=4                        " number of auto-indent spaces
set smartindent                         " enable smart indent
set smarttab                            " enable smart tabs
set softtabstop=4                       " number of spaces per tab

" copy and paste to os clipboard

set clipboard+=unnamedplus
" set paste
" set go+=a

"" use unix as the standard file type
set ffs=unix,dos,mac

set foldmethod=syntax
set foldnestmax=10
set foldlevel=2

set nofoldenable


set nocursorline                          " sets cursorline

set mouse=a
set visualbell

" conceal level
" set concealcursor=nvic
set conceallevel=0

set laststatus=2

set undolevels=1000               " number of undo levels

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

" Indentation --

set list
" set listchars=space:·,trail:.
set listchars=tab:→\ ,space:.,nbsp:␣,trail:•

" -- Indentation
"

set wildignore+=*.pyc,node_modules,__pycache__,*DS_Store

set splitbelow
set splitright

" set autochdir

" set listchars=tab:→\ ,space:·,nbsp:␣,trail:•,eol:¶,precedes:«,extends:» " Show special characters
