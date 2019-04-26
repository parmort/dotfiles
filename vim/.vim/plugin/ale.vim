let g:ale_set_loclist = 1
let g:ale_set_quickfix = 0
let g:ale_open_list = 0
let g:ale_linters = {
      \  'javascript': ['eslint'],
      \  'python': ['pylint', 'flake8'],
      \  'html': ['htmlhint'],
      \  'java': ['javac'],
      \  'asm': []
      \ }

let g:ale_sign_column_always = 1
let g:ale_sign_error = '‣'
let g:ale_sign_warning = '•'

hi ALEWarning ctermfg=3 guifg=#ab8e38 cterm=underline
hi ALEError ctermfg=1 guifg=#bf5858 cterm=underline
hi ALEWarningSign ctermbg=3 guibg=#ab8e38 ctermfg=0 guifg=#2b2b2b
hi ALEErrorSign ctermbg=1 guibg=#bf5858 ctermfg=0 guifg=#2b2b2b
