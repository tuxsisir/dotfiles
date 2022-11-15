" map leaders
noremap <Leader>s :w<CR>

" delete all buffers
noremap <Leader>bda :bufdo bd<CR>

" remove highlights
noremap <Leader>n :noh<CR>

noremap <Leader>r :so %<CR>

noremap <Leader>e :syntax sync minlines=10000<CR>

noremap <F3> :Autoformat<CR>

noremap <Leader>gfd :Gvdiffsplit<CR>
nnoremap <Leader>g :<C-u>call gitblame#echo()<CR>

map <C-n> :Sexplore<CR>
map <C-n> :Vexplore!<CR>
map <C-a> :Buffers<CR>

nmap <C-p> :Files<CR>
nmap <C-s> :Rg<CR>

" telescope - help commands
" noremap <silent> <Leader>ct :Telescope help_tags<CR>

" gitgutter
nmap ]h <Plug>(GitGutterNextHunk)
nmap [h <Plug>(GitGutterPrevHunk)
" - gitgutter

" Buffers
nmap <C-l>   :bn<CR>
nmap <C-h>   :bp<CR>
" -- Buffers
"
map <C-i> :ALEFix<CR>


" REMAPS
map <F2> :Startify<CR>

" delete word on alt backspace
imap <A-BS> <C-W>

" Close the current buffer
nnoremap <silent> <Leader>xx :close<CR>

" Delete buffer
noremap <Leader>x :bd<CR>

" git
noremap <silent> <Leader>cg :FloatermNew lazygit<CR>

" quickmenu
noremap <silent> <Leader>cq :call quickmenu#toggle(0)<CR>

" floaterm
noremap <silent> <Leader>cf :FloatermNew<CR>

" map <C-k> :Sexplore<CR>
nmap <C-k> :ALEFix<CR>
