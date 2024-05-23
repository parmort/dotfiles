if not vim.fn.exists('g:loaded_projectionist') then
  return
end

vim.g.projectionist_heuristics = {
  ['*'] = {
    ['*.ts'] = { dispatch = 'yarn start', console = 'node' },
    ['*.js'] = { console = 'node' },
    ['*.lua'] = { dispatch = ':so %' }
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

  ['src/&include/'] = {
    ['src/main.cpp'] = { type = 'implementation' },
    ['src/*.cpp'] = {
      type = 'implementation',
      alternate = 'include/{}.hpp',
      template = {
        '#include "{}.hpp"'
      }
    },
    ['include/*.hpp'] = {
      type = 'header',
      alternate = 'src/{}.cpp',
      template = {
        '#pragma once'
      }
    }
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
