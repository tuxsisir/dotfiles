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

" make swapfiles be kept in a central location to avoid polluting file system
set directory^=$HOME/.vim/swapfiles//

let s:plugins = '~/mydots/nvim/plugins.vim'
let s:general = '~/mydots/nvim/general.vim'
let s:keymaps = '~/mydots/nvim/keymaps.vim'

execute 'source' s:plugins
execute 'source' s:general
execute 'source' s:keymaps

" Yggdroot - indentline

let g:indentLine_enabled = 1
" let g:indentLine_concealcursor = 'nvic'
" let g:indentLine_conceallevel = 0
" let g:indentLine_setConceal = 1
let g:indentLine_char_list = ['┊']

let g:indentLine_color_term = 236

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
call quickmenu#append("# Git", '')

" use fugitive to show diff
call quickmenu#append("git diff", 'Gvdiff', "use fugitive's Gvdiff on current document")
call quickmenu#append("git status", 'Gstatus', "use fugitive's Gstatus on current document")

call g:quickmenu#append('# Directories', '')
call g:quickmenu#append('dots', 'edit ~/mydots/nvim/init.vim | normal c', 'Go to dots')
call g:quickmenu#append('logapp', 'edit ~/projects/dockerized/logapp/backend/logapp | normal c', 'Go to logapp')
call g:quickmenu#append('FuseCodehub', 'edit ~/projects/fuse-machines/fuse-jupyterhub/jupyterhub_config.py | normal c', 'Go to FC')
call g:quickmenu#append('Codehub Customize', 'edit ~/projects/fuse-machines/codehub-customize/local-codehub/jupyterhub/jupyterhub_config.py | normal c','Go to CC')

call quickmenu#append("# Misc", '')
call quickmenu#append("Turn spell %{&spell? 'off':'on'}", "set spell!", "enable/disable spell check (:set spell!)")

call quickmenu#append("# Python", '')
call quickmenu#append("Sort Imports", "CocCommand python.sortImports", "")

noremap <silent><F9> :call quickmenu#toggle(0)<cr>
let g:quickmenu_ft_blacklist= ['netrw', 'nerdtree']

let g:quickmenu_padding_right = 8
let g:quickmenu_padding_left = 8

call quickmenu#header("CyberVim")

" Color Scheme --

set background=dark

" colorscheme OceanicNext

" let g:oceanic_next_terminal_bold=1
" let g:oceanic_next_terminal_italic=1
" colorscheme palenight
colorscheme dracula
" colorscheme palenight

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
"
syntax on
set ruler                        " Show row and column ruler information
let &colorcolumn="80"


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
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"
let g:UltiSnipsSnippetDirectories=[$HOME.'/.config/nvim/UltiSnips']
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
" -- nerd commenter

set re=1

" blamer.nvim
" let g:blamer_enabled = 1
let g:blamer_delay = 500

" vim polyglot disable
let g:polyglot_disabled = ['css', 'yaml', 'yml']

" vim wiki
let g:vimwiki_list = [{'path': '~/vimwiki/', 'syntax': 'markdown', 'ext': '.md'}]

" RIPGREP

let g:rg_command = 'rg --vimgrep -S'

" ------------------ COC -------------------------
" ------------------------------------------------
" ------------------------------------------------

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
if has("patch-8.1.1564")
  " Recently vim can merge signcolumn and number column into one
  set signcolumn=number
else
  set signcolumn=yes
endif

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current
" position. Coc only does snippet and additional edit on confirm.
" <cr> could be remapped by other vim plugin, try `:verbose imap <CR>`.
if exists('*complete_info')
  inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
else
  inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
endif

" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current buffer.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

" Use CTRL-S for selections ranges.
" Requires 'textDocument/selectionRange' support of LS, ex: coc-tsserver
" nmap <silent> <C-s> <Plug>(coc-range-select)
" xmap <silent> <C-s> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Mappings using CoCList:
" Show all diagnostics.
nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions.
nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
" Show commands.
nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document.
nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols.
nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list.
nnoremap <silent> <space>p  :<C-u>CocListResume<CR>
