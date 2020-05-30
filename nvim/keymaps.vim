" map leaders
noremap <Leader>s :w<CR>
" noremap <Leader>bd :bd<CR>
noremap <Leader>bda :bufdo bd<CR>
noremap <Leader>n :noh<CR>
noremap <Leader>r :so %<CR>
noremap <Leader>e :syntax sync minlines=10000<CR>
noremap <F3> :Autoformat<CR>
noremap <F4> :FZF<CR>

noremap <Leader>gfd :Gvdiffsplit<CR>
nnoremap <Leader>g :<C-u>call gitblame#echo()<CR>

nnoremap <Leader>bd :bn<cr>:bd<cr>
map <C-S-n> :Sexplore<CR>
map <C-S-a> :Buffers<CR>

" -- fzf
nmap <C-p> :Files<CR>
nmap <C-s> :Ag<CR>
" fzf --
" gitgutter
nmap ]h <Plug>(GitGutterNextHunk)
nmap [h <Plug>(GitGutterPrevHunk)
" - gitgutter

" Buffers
nmap <C-l>   :bn<CR>
nmap <C-h>   :bp<CR>
" -- Buffers
"
nmap <C-i> :ALEFix<CR>


" REMAPS
map <F2> :Startify<CR>
imap <A-BS> <C-W>

