set nocompatible          " Make vim behave like vim, not vi
filetype plugin indent on " Turn on filetype detection. See ':h filetype'
set hidden                " Don't quit abandoned buffers
set nowrap                " Don't wrap lines
set autoindent            " Copy indent from previous line
set copyindent            " Copy indent structure (i.e. tabs and spaces)
set bs=eol,start,indent   " Make the backspace behave normally except indent
set clipboard=unnamedplus " Make vim use the C-c clipboard
set scrolloff=3           " Set scrolloff
set linebreak             " Wrap lines at `breakat`
setglobal spelllang=en_us " Spellchecking
set signcolumn=yes        " Keep the gutter always on
set cmdheight=2           " Raise height below statusline to 2 lines (better for COC)
set updatetime=300        " Lower time for CursorHold autocmds
set noshowmode            " Don't show mode messages
set laststatus=2          " Always display statusline
set smarttab              " <Tab> and <Backspace> become smart
set expandtab             " Expand tabs to x number of spaces
set shiftround            " Round indent to gel with shiftwidth

set shortmess=filmnrx     " Use abbreviations in messages
set shortmess+=I          " Don't show the intro message
set shortmess+=A          " Don't show the "Attention" swapfile message
set shortmess+=c          " Don't show completion messages

set list                  " Display chars set in listchars
set listchars=trail:·     " Trailing space
set listchars+=tab:»·     " Explicit tabs (usually expanded)
set listchars+=nbsp:∅     " Non-breaking space (almost never occurrs)
set listchars+=extends:»  " When line extends past right of screen
set listchars+=precedes:« " When line extends past left of screen

" Set tab spacing (handy helper in ftplugins)
call parmort#settabspace(2)

set path+=**              " Recurse into subdirectories
set wildmenu              " The command completion menu
set wildignore=*.o        " Ignore files from wildmenu
set wildignore+=node_modules

if exists('+belloff')
  set belloff=all         " Turn off all error sounds
endif

if exists('+colorcolumn')
  set cc=81               " Make the colorcolumn appear on column 81
endif

set number                " Line numbers (only current line with &relativenumber)
if exists('+relativenumber')
  set relativenumber      " Make fancy line numbers appear
endif

syntax enable             " Pretty colors
if exists('+syntax')
  set cursorline          " Make it easier to see current line
endif

set ignorecase            " Search is case-insensitive
if has('extra_search')
  set hlsearch            " Highlight current search
  set incsearch           " Jump to the closest match while typing search
endif

if has('folding')
  if has('windows')
    set fillchars=vert:┃  " Make the border between vertical windows seamless
  endif
endif

if has('windows')
  set splitbelow          " Prefer splitting below current split
endif

if has('vertsplit')
  set splitright          " Prefer splitting to the right of current split
endif

" Set the statusline
set statusline=
      \%{parmort#statusline#mode()}\ %{parmort#statusline#git()}%{parmort#statusline#name()}\ %{parmort#statusline#ff()}%{parmort#statusline#spell()}%{parmort#statusline#mod()}
      \%=%{parmort#statusline#type()}\ %{parmort#statusline#coc()}%{parmort#statusline#obsession()}[U+%0004.B]\ [%4.l/%4.Lℓ,\ %3.p%%]

if has('windows')
  set showtabline=2       " Always show the tabline
  set tabline=%!parmort#tabline#line() " Set the tabline
endif
