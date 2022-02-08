"" -------------------- ----------------- --------------------
"" -------------------- VIM CONFIGURATION --------------------
"" -------------------- ----------------- --------------------
"" @tuxsisir

source $HOME/mydots/nvim/base.vim

" make swapfiles be kept in a central location to avoid polluting file system
set directory^=$HOME/.vim/swapfiles//

source $HOME/mydots/nvim/plugins.vim
source $HOME/mydots/nvim/quickmenu.vim
source $HOME/mydots/nvim/general.vim
source $HOME/mydots/nvim/keymaps.vim
source $HOME/mydots/nvim/lightline.vim
source $HOME/mydots/nvim/startify.vim
source $HOME/mydots/nvim/vimwiki.vim

" Paths
" brew install ctags-exuberant
let g:Tlist_Ctags_Cmd='/usr/local/Cellar/ctags/5.8_1/bin/ctags'

let g:python_host_prog = '/usr/bin/python2'
" let g:python2_host_prog = '/usr/local/bin/python2'
let g:python3_host_prog = '/usr/local/bin/python3'

let g:set_conceallevel=0

" INDENT LINE
let g:indent_blankline_filetype_exclude = [
            \ 'lspinfo', 'packer',
            \ 'checkhealth', 'help', '', 'startify', 'quickmenu'
            \ ]

let g:indent_blankline_context_char_list = ['┃', '║', '╬', '█']

let g:indent_blankline_char_list = ['┊']

let g:indent_blankline_show_first_indent_level = v:false
let g:indent_blankline_use_treesitter = v:true
let g:indent_blankline_show_end_of_line = v:true

" -----

" GIT GUTTER
" allow us to override the color
let g:gitgutter_override_sign_column_highlight = 0

" default is 4 seconds - reduce to 100ms
set updatetime=100

" -- GIT GUTTER

" Netrw
let g:netrw_localrmdir='rm -r'
" let g:netrw_browse_split = 4
" let g:netrw_altv = 1
" let g:netrw_winsize = 30
let g:netrw_banner = 1

let g:netrw_liststyle = 3
" let g:netrw_keepdir = 0
let g:netrw_list_hide= '.*\.swp$,*.pyc,node_modules,__pycache__,.DS_Store'
" -- Netrw

" Color Scheme --

" set background=dark

" colorscheme OceanicNext

" let g:oceanic_next_terminal_bold=1
" let g:oceanic_next_terminal_italic=1
" colorscheme palenight
" colorscheme dracula
" colorscheme palenight
colorscheme onehalfdark

function! ToggleBackground()
  if &background=="dark"
    " set background=light
    " colorscheme solarized8_flat
  else
    " set background=dark
    " colorscheme OceanicNext
  endif
endfunction
nnoremap <F5> :call ToggleBackground()<CR>

" -- Color Scheme

syntax on
set ruler                        " Show row and column ruler information
let &colorcolumn="80"

" HIGHLIGHTS
highlight ColorColumn ctermbg=13 guibg=MediumPurple4
highlight Comment cterm=italic gui=italic
highlight Normal guibg=NONE ctermbg=NONE
highlight Comment cterm=italic gui=italic


" ALE / Lint --
source $HOME/mydots/nvim/ale.vim
" -- ALE / Lint


" Ulti Snippets
" let g:UltiSnipsExpandTrigger="<tab>"
" let g:UltiSnipsJumpForwardTrigger="<c-b>"
" let g:UltiSnipsJumpBackwardTrigger="<c-z>"
" let g:UltiSnipsSnippetDirectories=[$HOME.'/.config/nvim/UltiSnips']
" -- Ulti Snippets


" set re=1

" blamer.nvim
" let g:blamer_enabled = 1
let g:blamer_delay = 500



" RIPGREP
let g:rg_command = 'rg --vimgrep -S'


let g:LanguageClient_serverCommands = {
        \ 'vue': ['/usr/local/bin/vls'],
        \ 'python': ['/usr/local/bin/pyls'],
        \ }

" Virtual Text Rocks
let g:LanguageClient_hideVirtualTextsOnInsert = 1
let g:LanguageClient_virtualTextPrefix = " •••➜ "
let g:LanguageClient_useFloatingHover = 1

let virtualTextDisplay = {
            \        '1': {
            \            "name": "Error",
            \            "texthl": "ALEError",
            \            "signText": "✖",
            \            "signTexthl": "ALEErrorSign",
            \            "virtualTexthl": "Whitespace",
            \            "ctermbg": "NONE",
            \            "ctermfg": "9",
            \        },
            \        '2': {
            \            "name": "Warning",
            \            "texthl": "ALEWarning",
            \            "signText": "⚠",
            \            "signTexthl": "ALEWarningSign",
            \            "virtualTexthl": "Whitespace",
            \            "ctermbg": "NONE",
            \            "ctermfg": "11",
            \        },
            \        '3': {
            \            "name": "Information",
            \            "texthl": "ALEInfo",
            \            "signText": "ℹ",
            \            "signTexthl": "ALEInfoSign",
            \            "virtualTexthl": "Whitespace",
            \        },
            \        '4': {
            \            "name": "Hint",
            \            "texthl": "ALEInfo",
            \            "signText": "➤",
            \            "signTexthl": "ALEInfoSign",
            \            "virtualTexthl": "Whitespace",
            \        },
            \    }

let g:LanguageClient_diagnosticsDisplay = virtualTextDisplay

" let g:LanguageClient_useVirtualText = 'Diagnostics'

set omnifunc=syntaxcomplete#Complete

" note that if you are using Plug mapping you should not use `noremap` mappings.
nmap <F5> <Plug>(lcn-menu)
" Or map each action separately
nmap <silent>K <Plug>(lcn-hover)
nmap <silent> gd <Plug>(lcn-definition)
nmap <silent> <F8> <Plug>(lcn-rename)

" let $LANGUAGECLIENT_DEBUG=1
" let g:LanguageClient_loggingLevel='DEBUG'
" let g:LanguageClient_autoStart=0
" let g:LanguageClient_loggingFile =  expand('~/nvimLanguageClient.log')

