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

let g:python_host_prog = '/usr/bin/python'
let g:python2_host_prog = '/usr/local/bin/python2'
let g:python3_host_prog = '/usr/local/bin/python3'

set termguicolors

" make swapfiles be kept in a central location to avoid polluting file system
set directory^=$HOME/.vim/swapfiles//

" VIM PLUG --
source $HOME/mydots/nvim/plugins.vim
" --

" General
source $HOME/mydots/nvim/general.vim
" --

let g:indentLine_concealcursor = 'nvic'
let g:indentLine_conceallevel = 2

" -----

"" Keymaps --
source $HOME/mydots/nvim/keymaps.vim
"" -- keymaps

" NERD-Tree --

let NERDTreeShowHidden=1
let NERDTreeMinimalUI = 1
let g:NERDTreeWinPos = "left"
let g:NERDTreeWinSize=80
" let NERDTreeDirArrows = 1


" ignore certain files/folders
set wildignore+=*.pyc,node_modules,__pycache__,*DS_Store
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
colorscheme dracula

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

" Start both startify and nerdtree on entering vim
autocmd VimEnter *
            \   if !argc()
            \ |   Startify
            \ |   NERDTree
            \ |   wincmd w
            \ | endif

" vim polyglot disable
let g:polyglot_disabled = ['css', 'yaml', 'yml']


" ----------------------------------------------------------------------------
" --------------------------- COC Configuration C/P -------------------------
" ----------------------------------------------------------------------------
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

" ----------------------------------------------------------------------------


" ----------------------------------------------------------------------------
" --------------------------- VIM CLOSETAG C/P -------------------------------
" ----------------------------------------------------------------------------


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

