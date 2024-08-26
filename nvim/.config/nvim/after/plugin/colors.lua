vim.opt.background    = 'dark'
vim.opt.termguicolors = true

local confs = vim.api.nvim_get_runtime_file('lua/parmort/colors/*.lua', true)

local patterns = {}
for i,file in ipairs(confs) do
  patterns[i] = string.sub(string.match(file, 'parmort.+'), 16, -5)
end

local grp = vim.api.nvim_create_augroup('parmortColorSchemes', { clear = true })

vim.api.nvim_create_autocmd({'ColorSchemePre'}, {
  pattern = table.concat(patterns, ','), group = grp,
  callback = function(ev)
    require('parmort.colors.'..ev.match).colors_pre()
  end
})

vim.api.nvim_create_autocmd({'ColorScheme'}, {
  pattern = table.concat(patterns, ','), group = grp,
  callback = function(ev)
    require('parmort.colors.'..ev.match).colors()
    require('parmort.colors').colors()
  end
})

vim.cmd.colorscheme 'nord'
