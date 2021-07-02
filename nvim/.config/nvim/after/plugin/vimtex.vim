" Turn off default mappings
let g:vimtex_mappings_enabled = 0

call deoplete#custom#var('omni', 'input_patterns', {
      \   'tex': g:vimtex#re#deoplete
      \ })
