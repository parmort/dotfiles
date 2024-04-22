if not vim.fn.exists('g:loaded_projectionist') then
  return
end

vim.g.projectionist_heuristics = {
  ['*'] = {
    ['*.ts'] = { dispatch = 'yarn start', console = 'node' },
    ['*.js'] = { console = 'node' },
    ['*.lua'] = { dispatch = ':luafile {}' }
  },

  ['*.rb&*_test.rb'] = {
    ['*_test.rb'] = {
      type = 'test',
      alternate = '{}.rb',
      dispatch = 'ruby {file}'
    },
    ['*.rb'] = {
      type = 'source',
      alternate = '{}_test.rb',
      dispatch = 'ruby {}_test.rb'
    }
  },

  ['src/*.c&inc/*.h'] = {
    ['src/*.c'] = { type = 'source', alternate = 'inc/{}.h' },
    ['inc/*.h'] = { type = 'header', alternate = 'src/{}.c' }
  },

  ['*.component.ts'] = {
    ['*.component.ts'] = {
      type = 'component',
      alternate = '{}.component.html'
    },
    ['*.component.html'] = {
      type = 'html',
      alternate = '{}.component.html'
    }
  }
}
