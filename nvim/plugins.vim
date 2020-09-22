call plug#begin('~/.config/nvim/bundle')

" Colorschemes

Plug 'drewtempelmeyer/palenight.vim'                " colorscheme
Plug 'mhartington/oceanic-next'                     " colorscheme
Plug 'dracula/vim', { 'as': 'dracula' }             " colorscheme
Plug 'hardcoreplayers/oceanic-material'
Plug 'sonph/onehalf', {'rtp': 'vim/'}

Plug 'Chiel92/vim-autoformat'
Plug 'vimwiki/vimwiki'
Plug 'itchyny/lightline.vim'
Plug 'skywind3000/quickmenu.vim'
Plug 'voldikss/vim-floaterm'
Plug 'mengelbrecht/lightline-bufferline'
" Plug 'preservim/nerdcommenter'                      " comment out
" Plug 'editorconfig/editorconfig-vim'

" fuzzy

Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" LanguageClient
Plug 'autozimu/LanguageClient-neovim', {
            \ 'branch': 'next',
            \ 'do': 'bash install.sh',
            \ }

" good to have
" Plug 'tpope/vim-surround'
Plug 'Yggdroot/indentLine'
Plug 'mhinz/vim-startify'
Plug 'majutsushi/tagbar'
Plug 'dense-analysis/ale'

" Plug 'alvan/vim-closetag'
"" GIT
" Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'APZelos/blamer.nvim'                                      " Blamer
Plug 'sheerun/vim-polyglot'
" Plug 'mattn/gist-vim'
" Plug 'mattn/webapi-vim'


" polyglot
" Plug 'posva/vim-vue'

" COC
" Plug 'neoclide/coc.nvim', {'branch': 'release'}
" Plug 'liuchengxu/vista.vim'

" REST
" Plug 'diepm/vim-rest-console'
" Plug 'baverman/vial'
" Plug 'baverman/vial-http'

" VimDB - for interacting with databases
" Plug 'tpope/vim-dadbod'

" vim auto format


" Plug 'brooth/far.vim'
" Plug 'skanehira/preview-markdown.vim'

" Plug 'vifm/vifm.vim'

" ----------- SNIPPETS ----------------
" Track the engine.
" Plug 'SirVer/ultisnips'
" Snippets are separated from the engine. Add this if you want them:
" Plug 'honza/vim-snippets'

call plug#end()
