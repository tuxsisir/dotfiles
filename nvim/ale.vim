" ALE Asynchronous Lint Engine --

let g:ale_linters = {
            \   'javascript': ['eslint'],
            \   'python': ['pylint'],
            \   'vue': ['eslint'],
            \ }

let g:ale_fixers = {
            \  'python': ['autopep8', 'yapf'],
            \  'javascript': ['prettier'],
            \  'vue': ['prettier']
            \}

" Disable fixers for any file containing 'skylens' in its path.
let g:ale_pattern_options = {
            \  'skylens': {'ale_fixers': {
            \  'python': ['autopep8', 'yapf'],
            \  'javascript': ['eslint'],
            \  'vue': ['eslint']
            \ }
            \ }
            \ }

" Disable fixers for any file containing 'skylens' in its path.
let g:ale_pattern_options = {
            \  'tuxnuxt': {'ale_fixers': {
            \  'python': ['autopep8', 'yapf'],
            \  'javascript': ['eslint'],
            \  'vue': ['eslint']
            \ }
            \ }
            \ }

let g:ale_javascript_eslint_executable = 'eslint'

" Change error symbols
let g:ale_sign_error = "\u2717"
let g:ale_sign_warning = "\u26A0"

highlight ALEErrorSign ctermbg=NONE guifg=red gui=underline
highlight ALEWarningSign ctermbg=NONE guifg=yellow gui=underline

let g:ale_open_list = 0

" Check on file open
let g:ale_lint_on_enter = 0

" Check on file save
let g:ale_lint_on_save = 0

" Check on text change
let g:ale_lint_on_text_changed = 0

let g:ale_lint_delay = 100      " ms
let g:ale_sign_column_always = 1

let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format = 'ALE: [%linter%] %s [%severity%]'

let g:ale_virtualenv_dir_names = ['.virtualenvs', 'virtualenvs']

let g:ale_python_pylint_use_msg_id = 1

" -- ALE Asynchronous Lint Engine
