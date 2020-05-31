call plug#begin('~/.config/nvim/bundle')

" General
Plug 'drewtempelmeyer/palenight.vim'                " colorscheme
Plug 'dracula/vim', { 'as': 'dracula' }             " colorscheme
Plug 'preservim/nerdcommenter'                      " comment out
Plug 'editorconfig/editorconfig-vim'

" fuzzy

Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" good to have
Plug 'tpope/vim-surround'
Plug 'Yggdroot/indentLine'
Plug 'alvan/vim-closetag'

Plug 'mhinz/vim-startify'
Plug 'majutsushi/tagbar'
Plug 'w0rp/ale'

"" GIT
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
" Plug 'mattn/gist-vim'
Plug 'mattn/webapi-vim'
Plug 'APZelos/blamer.nvim'


" polyglot
Plug 'sheerun/vim-polyglot'
" Plug 'posva/vim-vue'

" COC
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'liuchengxu/vista.vim'

" REST
" Plug 'diepm/vim-rest-console'
" Plug 'baverman/vial'
" Plug 'baverman/vial-http'

" VimDB - for interacting with databases
" Plug 'tpope/vim-dadbod'

" Ulti Snippets
" Plug 'SirVer/ultisnips'
" Plug 'honza/vim-snippets'

" vim auto format
Plug 'Chiel92/vim-autoformat'

Plug 'vimwiki/vimwiki'

Plug 'itchyny/lightline.vim'
Plug 'skywind3000/quickmenu.vim'

" Plug 'mengelbrecht/lightline-bufferline'
" Plug 'neomake/neomake'
" Plug 'vim-scripts/matchit.zip'

call plug#end()

