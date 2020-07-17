" ALE Asynchronous Lint Engine --

let g:ale_linters = {
            \   'javascript': ['eslint'],
            \   'python': [],
            \   'scss': ['scsslint']
            \ }

let g:ale_fixers = {
            \  'python': ['autopep8', 'yapf'],
            \  'javascript': ['eslint'],
            \  'vue': ['eslint']
            \}

let g:ale_javascript_eslint_executable = 'eslint'

" Change error symbols
let g:ale_sign_error = "\u2717"
let g:ale_sign_warning = "\u26A0"

let g:ale_open_list = 0

" Check on file open
let g:ale_lint_on_enter = 1

" Check on file save
let g:ale_lint_on_save = 1

" Check on text change
let g:ale_lint_on_text_changed = 0

let g:ale_lint_delay = 100      " ms
let g:ale_sign_column_always = 1

let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
" let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'

let g:ale_virtualenv_dir_names = ['.virtualenvs', 'virtualenvs']


" -- ALE Asynchronous Lint Engine
