local user_command = vim.api.nvim_create_user_command

user_command(
  'SourceConf',
  'call parmort#sourceConf()',
  { bar = true }
)

user_command(
  'Mksession',
  'call parmort#mks#mkses(<q-args>, <bang>0)',
  {
    bar = true,
    bang = true,
    nargs = '?',
    complete = 'customlist,parmort#mks#complete'
  }
)

user_command(
  'Rmsession',
  'call parmort#mks#rmses(<q-args>)',
  {
    bar = true,
    nargs = '?',
    complete = 'customlist,parmort#mks#complete'
  }
)
