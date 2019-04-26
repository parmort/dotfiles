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
