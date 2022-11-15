set showtabline=4
set noshowmode

 function! GitStatus()
   let [a,m,r] = GitGutterGetHunkSummary()
   return printf('+%d ~%d -%d', a, m, r)
 endfunction

let g:lightline = {
            \ 'colorscheme': 'darcula',
            \ 'mode_map': {
            \    'n' : 'N',
            \    'i' : 'I',
            \    'R' : 'R',
            \    'v' : 'V',
            \    'V' : 'VL',
            \    "\<C-v>": 'VB',
            \    'c' : 'C',
            \    's' : 'S',
            \    'S' : 'SL',
            \    "\<C-s>": 'SB',
            \    't': 'T',
            \ },
            \ 'component': {
            \   'charvaluehex': '0x%B'
            \ },
            \ }
let g:lightline.active = {
         \ 'left': [ [ 'mode', 'paste' ],
         \           [ 'gitbranch', 'githunk', 'readonly', 'modified', 'absolutepath' ] ],
         \ 'right': [ [ 'linter_checking', 'linter_errors', 'linter_warnings', 'linter_infos', 'linter_ok' ],
         \            [ 'lineinfo' ],
         \            [ 'percent' ],
         \            [ 'fileformat', 'fileencoding', 'filetype', 'charvaluehex' ] ]
         \ }

let g:lightline.tabline = {'left': [['buffers']], 'right': [['close']]}

let g:lightline.component_expand = {
            \  'buffers': 'lightline#bufferline#buffers',
            \  'linter_checking': 'lightline#ale#checking',
            \  'linter_infos': 'lightline#ale#infos',
            \  'linter_warnings': 'lightline#ale#warnings',
            \  'linter_errors': 'lightline#ale#errors',
            \  'linter_ok': 'lightline#ale#ok',
            \ }
let g:lightline.component_type   = {
            \  'buffers': 'tabsel',
            \  'linter_checking': 'right',
            \  'linter_infos': 'right',
            \  'linter_warnings': 'warning',
            \  'linter_errors': 'error',
            \  'linter_ok': 'right',
            \ }

let g:lightline.component_function   = {
      \   'gitbranch': 'gitbranch#name',
      \   'githunk': 'GitStatus'
      \ }
let g:lightline#bufferline#filename_modifier = ':t'
let g:lightline#bufferline#show_number = 1
let g:lightline#bufferline#modified = '~'
let g:lightline#bufferline#unnamed = '[No Name]'

let g:lightline.component_raw = {'buffers': 1}
let g:lightline#bufferline#clickable = 1
let g:lightline#bufferline#ordinal_separator = ':'
