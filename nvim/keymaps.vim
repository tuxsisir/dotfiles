" map leaders
noremap <Leader>s :w<CR>

" delete all buffers
noremap <Leader>bda :bufdo bd<CR>

" remove highlights
noremap <Leader>n :noh<CR>

noremap <Leader>r :so %<CR>

noremap <Leader>e :syntax sync minlines=10000<CR>

noremap <F3> :Autoformat<CR>
noremap <F4> :FZF<CR>

noremap <Leader>gfd :Gvdiffsplit<CR>
nnoremap <Leader>g :<C-u>call gitblame#echo()<CR>

map <C-S-n> :Sexplore<CR>
map <C-S-n> :Vexplore!<CR>
map <C-S-a> :Buffers<CR>

" fzf
nmap <C-p> :Files<CR>
nmap <C-s> :Rg<CR>
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

" Close the current buffer
nnoremap <silent> <Leader>x :close<CR>

" Delete buffer
noremap <Leader>xx :bd<CR>

" cyber-git
noremap <silent> <Leader>cg :FloatermNew lazygit<CR>

" cyber-quickmenu
noremap <silent> <Leader>cq :call quickmenu#toggle(0)<CR>

" cyber-floaterm
noremap <silent> <Leader>cf :FloatermNew<CR>
