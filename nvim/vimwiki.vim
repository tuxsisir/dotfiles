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

" vim wiki
let g:vimwiki_list = [{'path': '~/projects/tuxnuxt/content', 'syntax': 'markdown', 'ext': '.md'}]
