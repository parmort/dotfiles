if exists(':CompilerSet') != 2
  command -nargs=* CompilerSet setlocal <args>
endif

CompilerSet makeprg=rspec

CompilerSet errorformat=
      \%P\ \ %*\\d)\ %o,
      \%P)\ %o,
      \%E%.%#Failure/Error:\ raise%.%#,
      \%E%.%#Failure/Error:\ fill_in%.%#,
      \%E%.%#Failure/Error:\ click_button%.%#,
      \%E%.%#Failure/Error:\ click_link%.%#,
      \%E%.%#Failure/Error:\ expect(page).to\ have_selector%.%#,
      \%E%.%#Failure/Error:\ %m,
      \%-C%*[\ ]expected:%.%#,
      \%-C%*[\ ](compared\ using%.%#,
      \%-C%*[\ ][Screenshot\ Image]%.%#,
      \%-C%*[\ ]Did\ you\ mean?%.%#,
      \%-Z%*[\ ]#\ ./%f:%l%.%#,
      \%-Z%.%#Caused\ by:%.%#,
      \%-C%*[\ ]#%.%#,
      \%+C%.%#,
      \%-GRun\ options:%.%#,
      \%-G%*[\ ]Got\ %*\\d\ failure%.%#and\ %*\\d\ other\ error%.%#,
      \%-G%*\\d\ example%.%#%*\\d\ failure%.%#,
      \%-GFinished\ in%.%#,
      \%-Grspec%.%#,
      \%-G%*[\ ]#%.%#,
      \%-GFailed\ examples:,
      \%-GFailures:,
      \%-G
