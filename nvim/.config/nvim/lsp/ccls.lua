return {
  cmd = { 'ccls' },
  filetypes = { 'c', 'cpp' },
  root_markers = { 'compile_commands.json', '.ccls', '.git' },
  workspace_required = true, -- Needs to have a root directory'cpp'
}
