if has_key(w:, 'qf_toc') || get(w:, 'quickfix_title') =~# '\<TOC$'
  let ft_undo = get(b:, 'undo_ftplugin', '')
  let b:undo_ftplugin = 'set lcs<' .. (!empty(ft_undo) ? '| ' .. ft_undo : '' )
  setlocal lcs+=nbsp:\\u0020
endif
