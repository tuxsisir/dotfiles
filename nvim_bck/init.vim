"" -------------------- ----------------- --------------------
"" -------------------------NVIM CONFIG ----------------------
"" -------------------- ----------------- --------------------
"" Author: @tuxsisir
"" Email: samratsisir294@gmail.com
"" Website: https://tuxsisir.github.io


let s:core_conf_files = [
      \ 'plugins.vim',
      \ 'general.vim',
      \ 'base.vim',
      \ 'ale.vim',
      \ 'mappings.vim',
      \ 'startify.vim',
      \ 'vimwiki.vim',
      \ 'lightline.vim',
      \ 'quickmenu.vim',
      \ 'globals.vim',
      \ ]

for s:fname in s:core_conf_files
  execute printf('source %s/core/%s', stdpath('config'), s:fname)
endfor

