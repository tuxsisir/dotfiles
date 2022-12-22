" bare minimum vim conf

let mapleader=";"
noremap <Leader>s :w<CR>

color pablo                 " color scheme
syntax on                   " enable syntax highlighting
set number                  " show line numbers
set linebreak               " break lines
set showbreak=+++           " wrapped line prefix
set textwidth=100           " line wrap (number of cols)
set showmatch               " highlight braces

set spell

set hlsearch                " highlight search results

" enable smart case search and ignore-case
set smartcase
set ignorecase
set incsearch

" tabs & indentation
set autoindent              " auto-indent new lines
set expandtab               " use spaces instead of tabs
set shiftwidth=4            " number of auto-indent spaces
set smartindent             " enable smart indent
set smarttab                " enable smart tabs
set softtabstop=4           " number of spaces per tab

" copy and paste to os clipboard
set clipboard^=unnamed,unnamedplus
set paste
set go+=a

" use unix as the standard file type
set ffs=unix,dos,mac

set ruler                   " Show row and column ruler information
set undolevels=1000         " number of undo levels

set backspace=indent,eol,start " allow backspacing over everything in insert mode
