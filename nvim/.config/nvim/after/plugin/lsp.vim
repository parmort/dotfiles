if !has('nvim')
  finish
endif

lua << END

local lsp = require'nvim_lsp'

lsp.tsserver.setup{}
lsp.vimls.setup{}

END

function! s:ConfigureBuffer() abort
  nnoremap <buffer> <silent> <leader>e <cmd>lua vim.lsp.util.show_line_diagnostics()<CR>
  nnoremap <buffer> <silent> <C-]> <cmd>lua vim.lsp.buf.definition()<CR>
  nnoremap <buffer> <silent> gd <cmd>lua vim.lsp.buf.declaration()<CR>
  nnoremap <buffer> <silent> K <cmd>lua vim.lsp.buf.hover()<CR>

  if exists('+signcolumn')
    setlocal signcolumn=yes
  endif
endfunction

sign define LspDiagnosticsErrorSign text=>>
sign define LspDiagnosticsWarningSign text=>>

augroup ParmortLspAutocmds
  autocmd!
  autocmd Filetype typescript,vim call s:ConfigureBuffer()
augroup END
