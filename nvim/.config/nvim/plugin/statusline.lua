local function mod(name)
  return string.format([[%%{luaeval("require'parmort.statusline'.%s()")}]], name)
end

function Statusline()
  return table.concat {
    mod('mode'),
    mod('git_branch'),
    mod('name'),
    mod('spell'),
    mod('fmod'),
    '%=',  -- RIGHT ALIGN
    mod('ftype'),
    mod('obsession'),
    mod('fformat'),
    '[%p%%]'
  }
end

vim.opt.statusline = '%!v:lua.Statusline()'
