hi User1 guifg=#EBCB8B guibg=#333333
hi User2 guifg=#bf5858 guibg=#333333
hi User3 guifg=#ab8e38 guibg=#333333
set statusline=
      \%1*%{custom#statusline#mode()}\ %*%{custom#statusline#name()}\ \ %{custom#statusline#git()}%{custom#statusline#mod()}
      \%=%{custom#statusline#type()}\ [%2*%{custom#statusline#err()}%*,\ %3*%{custom#statusline#warn()}%*]\
      \ [U+%0004.B]\ [%4.l/%Lℓ,\ %3.p%%]
