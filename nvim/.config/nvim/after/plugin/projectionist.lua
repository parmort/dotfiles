if not vim.fn.exists('g:loaded_projectionist') then
  return
end

vim.g.projectionist_heuristics = {
  ['*'] = {
    ['*.lua'] = { dispatch = ':so %' }
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

  ['*.tex'] = {
    ['*.tex'] = {
      type = 'latex',
      alternate = '{}_refs.bib',
    },
    ['*_refs.bib'] = {
      type = 'bibtex',
      alternate = '{}.tex',
      make = 'biber {}',
    }
  }
}
