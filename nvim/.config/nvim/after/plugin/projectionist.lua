if not vim.fn.exists('g:loaded_projectionist') then
  return
end

vim.g.projectionist_heuristics = {
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
  },
}
