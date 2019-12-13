function! s:chkdir(dir)
  if !isdirectory(a:dir) && confirm("Create directory ".a:dir."?", "&Yes\n&No") ==# 1
    call mkdir(a:dir, 'p')
    echom 'Directory `'.a:dir.'` created.'
  endif
endfunction

call s:chkdir($HOME . '/.vim/tmp/swap//')
call s:chkdir($HOME . '/.vim/tmp/backup//')
call s:chkdir($HOME . '/.vim/tmp/undo//')

" swapfile and backup file
if exists('$SUDO_USER')
  set noswapfile
  set nobackup
  set nowritebackup
else
  set directory=~/.vim/tmp/swap//
  set directory+=.
  set backupdir=~/.vim/tmp/backup//
  set backupdir+=.
endif

" keep past undos
if has('persistent_undo')
  if exists('$SUDO_USER')
    set noundofile
  else
    set undodir=~/.vim/tmp/undo//
    set undodir+=.
    set undofile
  endif
endif
