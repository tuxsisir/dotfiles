"" -------------------- ----------------- --------------------
""  QuickMenu
"" -------------------- ----------------- --------------------

call quickmenu#reset()

" enable cursorline (L) and cmdline help (H)
let g:quickmenu_options = "HL"
let g:quickmenu_padding_right = 4
" new section
"
call quickmenu#append("# Startify", '')
call g:quickmenu#append("Open Startify", "Startify", "Open Startify")

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

call quickmenu#header("Neovim")

" -- Quickmenu
