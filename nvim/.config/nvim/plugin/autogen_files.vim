function! s:chkdir(dir)
  if !isdirectory(a:dir) && confirm("Create directory ".a:dir."?", "&Yes\n&No") ==# 1
    call mkdir(a:dir, 'p')
    echom 'Directory `'.a:dir.'` created.'
  endif
endfunction

call s:chkdir($XDG_CACHE_HOME . '/nvim/swap//')
call s:chkdir($XDG_CACHE_HOME . '/nvim/backup//')
call s:chkdir($XDG_CACHE_HOME . '/nvim/undo//')

" swapfile and backup file
if exists('$SUDO_USER')
  set noswapfile
  set nobackup
  set nowritebackup
else
  set directory=$XDG_CACHE_HOME/nvim/swap//
  set directory+=.
  set backupdir=$XDG_CACHE_HOME/nvim/backup//
  set backupdir+=.
endif

" keep past undos
if has('persistent_undo')
  if exists('$SUDO_USER')
    set noundofile
  else
    set undodir=$XDG_CACHE_HOME/nvim/undo//
    set undodir+=.
    set undofile
  endif
endif
