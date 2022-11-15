call plug#begin('~/.config/nvim/bundle')

" Colorschemes
Plug 'drewtempelmeyer/palenight.vim'
Plug 'mhartington/oceanic-next'
Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'hardcoreplayers/oceanic-material'
Plug 'sonph/onehalf', {'rtp': 'vim/'}
Plug 'lifepillar/vim-solarized8'

Plug 'vimwiki/vimwiki'
Plug 'itchyny/lightline.vim'
Plug 'skywind3000/quickmenu.vim'
Plug 'voldikss/vim-floaterm'
Plug 'mengelbrecht/lightline-bufferline'
Plug 'lukas-reineke/indent-blankline.nvim'
" Plug 'preservim/nerdcommenter'
" Plug 'editorconfig/editorconfig-vim'

" fuzzy
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" telescope
" Plug 'nvim-lua/plenary.nvim'
" Plug 'nvim-telescope/telescope.nvim'

" LanguageClient
Plug 'autozimu/LanguageClient-neovim', {
            \ 'branch': 'next',
            \ 'do': './install.sh',
            \ }

" Plug 'gko/vim-coloresque'

" note that if you are using Plug mapping you should not use `noremap` mappings.
" nmap <F5> <Plug>(lcn-menu)
" " Or map each action separately
" nmap <silent>K <Plug>(lcn-hover)
" nmap <silent> gd <Plug>(lcn-definition)
" nmap <silent> <F2> <Plug>(lcn-rename)

" good to have
Plug 'tpope/vim-surround'
Plug 'jiangmiao/auto-pairs'
" Plug 'Yggdroot/indentLine'
Plug 'mhinz/vim-startify'
Plug 'majutsushi/tagbar'
Plug 'dense-analysis/ale'
" Plug 'codota/tabnine-vim'
Plug 'alvan/vim-closetag'
Plug 'itchyny/vim-gitbranch'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

"" GIT
" Plug 'junegunn/gv.vim'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'APZelos/blamer.nvim'                                      " Blamer
" Plug 'sheerun/vim-polyglot'
Plug 'junegunn/goyo.vim'
Plug 'maximbaz/lightline-ale'
" Plug 'itchyny/calendar.vim'
Plug 'cespare/vim-toml', { 'branch': 'main' }
Plug 'ap/vim-css-color', { 'branch': 'master' }

" Plug 'mattn/gist-vim'
" Plug 'mattn/webapi-vim'


" polyglot

" COC
" Plug 'neoclide/coc.nvim', {'branch': 'release'}
" Plug 'liuchengxu/vista.vim'

" REST
" Plug 'diepm/vim-rest-console'
" Plug 'baverman/vial'
" Plug 'baverman/vial-http'
" VimDB - for interacting with databases
" Plug 'tpope/vim-dadbod'
" Plug 'brooth/far.vim'
" Plug 'skanehira/preview-markdown.vim'
" Plug 'vifm/vifm.vim'

" ----------- SNIPPETS ----------------
" Track the engine.
" Plug 'SirVer/ultisnips'
" Snippets are separated from the engine. Add this if you want them:
" Plug 'honza/vim-snippets'
"
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'dstein64/vim-startuptime'
Plug 'posva/vim-vue'
Plug 'scrooloose/nerdcommenter'

call plug#end()


" CLOSE TAGS AND AUTO PAIRS
" let g:AutoPairsFlyMode = 1
let g:closetag_filenames = '*.html,*.xhtml,*.phtml,*.vue'
let g:closetag_filetypes = 'html,xhtml,phtml,vue'

" DEOPLETE
let g:deoplete#enable_at_startup = 1

" let g:vue_pre_processors = []
