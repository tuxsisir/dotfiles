"" -------------------- ----------------- --------------------
"" -------------------- VIM CONFIGURATION --------------------
"" -------------------- ----------------- --------------------
"" @tuxsisir

set encoding=utf-8
let mapleader=";"
set nocompatible                  " iMprove vim with no vi

" Paths

" brew install ctags-exuberant
let g:Tlist_Ctags_Cmd='/usr/local/Cellar/ctags/5.8_1/bin/ctags'
let g:python2_host_prog = '/usr/local/bin/python2'
let g:python3_host_prog = '/usr/local/bin/python3'

"" FONTS / Interface

set termguicolors
if has("gui_running")
    set guifont=FuraMono\ Nerd\ Font\ 9
endif

" make swapfiles be kept in a central location to avoid polluting file system
set directory^=$HOME/.vim/swapfiles//

"" VIM PLUG --

if has('nvim')
    call plug#begin('~/.config/nvim/bundle')
else
    call plug#begin('~/.vim/bundle')
endif

"" Interface
" Colorschemes
Plug 'mhartington/oceanic-next'
Plug 'drewtempelmeyer/palenight.vim'

Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'preservim/nerdcommenter'

Plug 'tpope/vim-surround'
Plug 'Yggdroot/indentLine'
Plug 'alvan/vim-closetag'

Plug 'mhinz/vim-startify'
Plug 'majutsushi/tagbar'
Plug 'w0rp/ale'

"" GIT / GISTHUB
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'mattn/gist-vim'
Plug 'mattn/webapi-vim'
Plug 'zivyangll/git-blame.vim'
Plug 'APZelos/blamer.nvim'

"" fuzzy
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

" Languages
Plug 'sheerun/vim-polyglot'
Plug 'posva/vim-vue'

" COC
" note: don't remove coc and work on auto indent
Plug 'neoclide/coc.nvim', {'do': { -> coc#util#install()}}
Plug 'liuchengxu/vista.vim'

" REST
" Plug 'diepm/vim-rest-console'
Plug 'baverman/vial'
Plug 'baverman/vial-http'

Plug 'tpope/vim-dadbod'

" Ulti Snippets
" Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'

" vim auto format
Plug 'Chiel92/vim-autoformat'

Plug 'vimwiki/vimwiki'

Plug 'itchyny/lightline.vim'
Plug 'mengelbrecht/lightline-bufferline'

call plug#end()

"" -- VIM PLUG

" General --

" enable syntax highlighting
syntax enable

" show line numbers and relative number
set number
" set relativenumber

" break lines
set linebreak

" wrapped line prefix
set showbreak=+++

" line wrap (number of cols)
set textwidth=100

" highlight braces
set showmatch

" spell check
" set spell

" search options
set hlsearch
set ignorecase
set smartcase
set incsearch

autocmd BufWritePre *.* %s/\s\+$//e

" Indentation
autocmd BufRead,BufNewFile *.vue setfiletype vue

filetype plugin indent on
set autoindent                    " auto-indent new lines
set expandtab                     " use spaces instead of tabs
set shiftwidth=4                  " number of auto-indent spaces
set smartindent                   " enable smart indent
set smarttab                      " enable smart tabs
set softtabstop=4                 " number of spaces per tab

" copy and paste to os clipboard

set clipboard+=unnamedplus
" set paste
" set go+=a

"" use unix as the standard file type
set ffs=unix,dos,mac

set foldmethod=syntax
set foldnestmax=10
set nofoldenable
set foldlevel=2

" cursorline
set cursorline

set mouse=a
set visualbell

" conceal level
set concealcursor=v
set conceallevel=2

let g:indentLine_concealcursor = 'v'
let g:indentLine_conceallevel = 2

" map leaders
noremap <Leader>s :w<CR>
noremap <Leader>bd :bd<CR>
noremap <Leader>bda :bufdo bd<CR>
noremap <Leader>n :noh<CR>
noremap <Leader>r :so %<CR>
noremap <Leader>e :syntax sync minlines=10000<CR>
noremap <F3> :Autoformat<CR>
noremap <F4> :FZF<CR>

noremap <Leader>gfd :Gvdiffsplit<CR>
nnoremap <Leader>g :<C-u>call gitblame#echo()<CR>

" -- General

" -----

set undolevels=1000               " number of undo levels

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

" -----

" NERD-Tree --

let NERDTreeShowHidden=1
let NERDTreeMinimalUI = 1
let g:NERDTreeWinPos = "left"
" let NERDTreeDirArrows = 1

map <C-S-n> :NERDTreeToggle<CR>

" ignore certain files/folders
set wildignore+=*.pyc,node_modules,__pycache__
let NERDTreeRespectWildIgnore=1

" -- NERD-Tree

" GIT GUTTER
" allow us to override the color
let g:gitgutter_override_sign_column_highlight = 0

" default is 4 seconds - reduce to 100ms
set updatetime=100
" --

" Color Scheme --
set background=dark
colorscheme palenight

function! ToggleBackground()
    if &background=="dark"
        set background=light
        colorscheme solarized8_flat
    else
        set background=dark
        colorscheme OceanicNext
    endif
endfunction

nnoremap <F5> :call ToggleBackground()<CR>

" -- Color Scheme
"
set ruler                        " Show row and column ruler information
let &colorcolumn="80"

"For oceanic next
let g:oceanic_next_terminal_bold = 1
let g:oceanic_next_terminal_italic = 1

highlight ColorColumn ctermbg=250
highlight Comment cterm=italic gui=italic
highlight Normal guibg=NONE ctermbg=NONE
highlight Comment cterm=italic gui=italic

" LIGHTLINE
set showtabline=2
let g:lightline = {
            \ 'colorscheme': 'wombat',
            \ 'mode_map': {
            \ 'n' : 'N',
            \ 'i' : 'I',
            \ 'R' : 'R',
            \ 'v' : 'V',
            \ 'V' : 'VL',
            \ "\<C-v>": 'VB',
            \ 'c' : 'C',
            \ 's' : 'S',
            \ 'S' : 'SL',
            \ "\<C-s>": 'SB',
            \ 't': 'T',
            \ },
            \ }
let g:lightline.active = {
            \ 'left': [ [ 'mode', 'paste' ],
            \           [ 'readonly', 'absolutepath', 'modified' ] ] }

let g:lightline.tabline          = {'left': [['buffers']], 'right': [['close']]}
let g:lightline.component_expand = {'buffers': 'lightline#bufferline#buffers'}
let g:lightline.component_type   = {'buffers': 'tabsel'}
let g:lightline#bufferline#filename_modifier = ':t'
let g:lightline#bufferline#show_number = 1
let g:lightline#bufferline#modified = '~'

" -- LIGHTLINE

" VIM Startify --
let s:startify_ascii_header = [
            \ '                                        ▟▙            ',
            \ '                                        ▝▘            ',
            \ '██▃▅▇█▆▖  ▗▟████▙▖   ▄████▄   ██▄  ▄██  ██  ▗▟█▆▄▄▆█▙▖',
            \ '██▛▔ ▝██  ██▄▄▄▄██  ██▛▔▔▜██  ▝██  ██▘  ██  ██▛▜██▛▜██',
            \ '██    ██  ██▀▀▀▀▀▘  ██▖  ▗██   ▜█▙▟█▛   ██  ██  ██  ██',
            \ '██    ██  ▜█▙▄▄▄▟▊  ▀██▙▟██▀   ▝████▘   ██  ██  ██  ██',
            \ '▀▀    ▀▀   ▝▀▀▀▀▀     ▀▀▀▀       ▀▀     ▀▀  ▀▀  ▀▀  ▀▀',
            \ '',
            \ ''
            \ ]
let g:startify_custom_header = map(s:startify_ascii_header +
            \ startify#fortune#quote(), '"   ".v:val')

" -- VIM Startify




" Indentation --

" set list
" set listchars=space:·,trail:.

" -- Indentation

" -- fzf

nmap <C-p> :GFiles<CR>
nmap <C-s> :Ag<CR>

" fzf --

" -- filetype plugin

filetype plugin indent on

" filetype plugin --
" ALE Asynchronous Lint Engine --

let g:ale_linters = {
            \   'javascript': ['eslint'],
            \   'python': ['pylint', 'flake8'],
            \   'scss': ['scsslint']
            \ }

let g:ale_fixers = {
            \  'python': ['autopep8', 'yapf'],
            \  'javascript': ['eslint'],
            \  'vue': ['eslint']
            \}

let g:ale_javascript_eslint_executable = 'eslint'

" Change error symbols
let g:ale_sign_error = '=>'
let g:ale_sign_warning = '->'

let g:ale_open_list = 0

" Check on file open
let g:ale_lint_on_enter = 1

" No check on file save
let g:ale_lint_on_save = 1

" Check on text change
let g:ale_lint_on_text_changed = 0

let g:ale_lint_delay = 100      " ms
let g:ale_sign_column_always = 1

let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'

let g:ale_virtualenv_dir_names = ['.virtualenvs', 'virtualenvs']

nmap <C-i> :ALEFix<CR>

" -- ALE Asynchronous Lint Engine

" Ulti Snippets
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"
let g:UltiSnipsSnippetDirectories=[$HOME.'/.config/nvim/UltiSnips']
" -- Ulti Snippets

" Buffers

nmap <C-l>   :bn<CR>
nmap <C-h>   :bp<CR>

" -- Buffers

" COC

" if hidden is not set, TextEdit might fail.
set hidden

" Some server have issues with backup files, see #649
set nobackup
set nowritebackup

" Better display for messages
set cmdheight=2

" Smaller updatetime for CursorHold & CursorHoldI
set updatetime=300

" don't give |ins-completion-menu| messages.
set shortmess+=c

" always show signcolumns
set signcolumn=yes

" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
"inoremap <silent><expr> <TAB>
            "\ pumvisible() ? "\<C-n>" :
            "\ <SID>check_back_space() ? "\<TAB>" :
            "\ coc#refresh()
"inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> for trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> for confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.
" inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

" Use `[c` and `]c` for navigate diagnostics
nmap <silent> [c <Plug>(coc-diagnostic-prev)
nmap <silent> ]c <Plug>(coc-diagnostic-next)

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K for show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
    if &filetype == 'vim'
        execute 'h '.expand('<cword>')
    else
        call CocAction('doHover')
    endif
endfunction

" Highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')

" Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)

" Remap for format selected region
vmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
    autocmd!
    " Setup formatexpr specified filetype(s).
    autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
    " Update signature help on jump placeholder
    autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Remap for do codeAction of selected region, ex: `<leader>aap` for current paragraph
vmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap for do codeAction of current line
nmap <leader>ac  <Plug>(coc-codeaction)
" Fix autofix problem of current line
nmap <leader>qf  <Plug>(coc-fix-current)

" Use `:Format` for format current buffer
command! -nargs=0 Format :call CocAction('format')


" Use `:Fold` for fold current buffer
command! -nargs=? Fold :call     CocAction('fold', <f-args>)
" Using CocList
" Show all diagnostics
nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions
nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
" Show commands
nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document
nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols
nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list
nnoremap <silent> <space>p  :<C-u>CocListResume<CR>


" VIM CLOSETAG
"
" filenames like *.xml, *.html, *.xhtml, ...
" These are the file extensions where this plugin is enabled.
"
let g:closetag_filenames = '*.html,*.xhtml,*.phtml,*.vue'

" filenames like *.xml, *.xhtml, ...
" This will make the list of non-closing tags self-closing in the specified files.
"
let g:closetag_xhtml_filenames = '*.xhtml,*.jsx,*.vue'

" filetypes like xml, html, xhtml, ...
" These are the file types where this plugin is enabled.
"
let g:closetag_filetypes = 'html,xhtml,phtml,*.vue'

" filetypes like xml, xhtml, ...
" This will make the list of non-closing tags self-closing in the specified files.
"
let g:closetag_xhtml_filetypes = 'xhtml,jsx,*.vue'

" integer value [0|1]
" This will make the list of non-closing tags case-sensitive (e.g. `<Link>` will be closed while `<link>` won't.)
"
let g:closetag_emptyTags_caseSensitive = 1

" dict
" Disables auto-close if not in a "valid" region (based on filetype)
"
let g:closetag_regions = {
            \ 'typescript.tsx': 'jsxRegion,tsxRegion',
            \ 'javascript.jsx': 'jsxRegion',
            \ }

" Shortcut for closing tags, default is '>'
"
let g:closetag_shortcut = '>'

" Add > at current position without closing the current tag, default is ''
"
let g:closetag_close_shortcut = '<leader>>'

" -------------
"
" REMAPS
map <F2> :Startify<CR>
imap <A-BS> <C-W>

set laststatus=2

" NERDCommenter
let g:ft = ''
fu! NERDCommenter_before()
    if &ft == 'vue'
        let g:ft = 'vue'
        let stack = synstack(line('.'), col('.'))
        if len(stack) > 0
            let syn = synIDattr((stack)[0], 'name')
            if len(syn) > 0
                let syn = tolower(syn)
                exe 'setf '.syn
            endif
        endif
    endif
endfu
fu! NERDCommenter_after()
    if g:ft == 'vue'
        setf vue
        let g:ft = ' '
    endif
endfu

let g:NERDSpaceDelims = 1
let g:NERDTreeWinPos = "right"
" -- nerd commenter

set re=1

" blamer.nvim
" let g:blamer_enabled = 1
let g:blamer_delay = 500
