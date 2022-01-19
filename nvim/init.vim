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

let g:python_host_prog = '/usr/local/bin/python3'
" let g:python2_host_prog = '/usr/local/bin/python2'
let g:python3_host_prog = '/usr/local/bin/python3'

if exists('+termguicolors')
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
  set termguicolors
endif

" vim polyglot disable
" let g:polyglot_disabled = ['vue', 'yaml', 'yml', 'startify', 'quickmenu']

" make swapfiles be kept in a central location to avoid polluting file system
set directory^=$HOME/.vim/swapfiles//

let s:plugins = '~/mydots/nvim/plugins.vim'
let s:general = '~/mydots/nvim/general.vim'
let s:keymaps = '~/mydots/nvim/keymaps.vim'

execute 'source' s:plugins
execute 'source' s:general
execute 'source' s:keymaps

let g:set_conceallevel=0
let g:indentLine_setConceal = 2
let g:indentLine_concealcursor = ""

" -----

" GIT GUTTER
" allow us to override the color
let g:gitgutter_override_sign_column_highlight = 0

" default is 4 seconds - reduce to 100ms
set updatetime=100
" --

" Netrw
let g:netrw_localrmdir='rm -r'
" let g:netrw_browse_split = 4
" let g:netrw_altv = 1
" let g:netrw_winsize = 30
let g:netrw_banner = 1

let g:netrw_liststyle = 3
" let g:netrw_keepdir = 0
let g:netrw_list_hide= '.*\.swp$,*.pyc,node_modules,__pycache__,.DS_Store'

" quickmenu
call quickmenu#reset()

" enable cursorline (L) and cmdline help (H)
let g:quickmenu_options = "HL"
let g:quickmenu_padding_right = 4
" new section
call quickmenu#append("# LSP", '')
call g:quickmenu#append("Format Document", "call LanguageClient#textDocument_formatting()", "LSP Format Document")

call g:quickmenu#append('# Directories', '')
call g:quickmenu#append('dots', 'edit ~/mydots/nvim/init.vim | normal c', 'Go to dots')


call quickmenu#append("# Misc", '')
call quickmenu#append("Turn spell %{&spell? 'off':'on'}", "set spell!", "enable/disable spell check (:set spell!)")

call quickmenu#append("# Python", '')
call quickmenu#append("Sort Imports", "CocCommand python.sortImports", "")

noremap <silent><F9> :call quickmenu#toggle(0)<cr>
let g:quickmenu_ft_blacklist= ['netrw']

let g:quickmenu_padding_right = 8
let g:quickmenu_padding_left = 8

call quickmenu#header("CyberVim")

" Color Scheme --

set background=dark

" colorscheme OceanicNext

" let g:oceanic_next_terminal_bold=1
" let g:oceanic_next_terminal_italic=1
" colorscheme palenight
" colorscheme dracula
" colorscheme palenight
colorscheme onehalfdark

" function! ToggleBackground()
    " if &background=="dark"
        " set background=light
        " colorscheme solarized8_flat
    " else
        " set background=dark
        " colorscheme OceanicNext
    " endif
" endfunction

" nnoremap <F5> :call ToggleBackground()<CR>

" -- Color Scheme

syntax on
set ruler                        " Show row and column ruler information
let &colorcolumn="80"

" HIGHLIGHTS
highlight ColorColumn ctermbg=13 guibg=MediumPurple4
highlight Comment cterm=italic gui=italic
highlight Normal guibg=NONE ctermbg=NONE
highlight Comment cterm=italic gui=italic

" LIGHTLINE
source $HOME/mydots/nvim/lightline.vim
" -- LIGHTLINE

" VIM Startify --
source $HOME/mydots/nvim/startify.vim
" -- VIM Startify



" -- filetype plugin
filetype plugin indent on
" filetype plugin --

" ALE / Lint --
source $HOME/mydots/nvim/ale.vim
" -- ALE / Lint


" Ulti Snippets
" let g:UltiSnipsExpandTrigger="<tab>"
" let g:UltiSnipsJumpForwardTrigger="<c-b>"
" let g:UltiSnipsJumpBackwardTrigger="<c-z>"
" let g:UltiSnipsSnippetDirectories=[$HOME.'/.config/nvim/UltiSnips']
" -- Ulti Snippets

function! VimWikiLink()
  let s:link = matchstr(getline('.'), '\[\[\zs.\{-}\ze\]\]')
  if s:link != ""
    silent exec "!open http://localhost:8642/" . s:link
  else
    echo "Link not found in line."
  endif
endfunction

function! VimWikiNotebook()
  let s:link = matchstr(getline('.'), '\[\[\zs.\{-}\ze\]\]')
  if s:link != ""
    silent exec "!open http://localhost:8888/notebooks/" . s:link
  else
    echo "Link not found in line."
  endif
endfunction

map <leader>ol :call VimWikiLink()<cr>
map <leader>on :call VimWikiNotebook()<cr>

" set re=1

" blamer.nvim
" let g:blamer_enabled = 1
let g:blamer_delay = 500


" vim wiki
let g:vimwiki_list = [{'path': '~/projects/tuxsisir-hugo/', 'syntax': 'markdown', 'ext': '.md'}]

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

set signcolumn=yes

" function! CloseHiddenBuffers()
"     " >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
"     " close any buffers hidden
"     " <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
"     let open_buffers = []
"
"     for i in range(tabpagenr('$'))
"         call extend(open_buffers, tabpagebuflist(i + 1))
"     endfor
"
"     for num in range(1, bufnr("$") + 1)
"         if buflisted(num) && index(open_buffers, num) == -1
"             exec "bdelete ".num
"         endif
"     endfor
" endfunction
"
" au BufEnter * call CloseHiddenBuffers()

map <C-k> :Sexplore<CR>
