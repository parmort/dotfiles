if not vim.g.loaded_projectionist then
  return
end

vim.g.projectionist_heuristics = {
  ['*.tex'] = {
    ['Makefile'] = {
      template = {
        '.PHONY: clean distclean',
        '',
        'doc_name=',
        'bib_file=',
        '',
        '$(doc_name).pdf: $(doc_name).tex $(bib_file)',
        '\tpdflatex $(basename $@)',
        'ifdef $(bib_file)',
        '\tbiber $(basename $@)',
        '\tpdflatex $(basename $@)',
        'endif',
        '\tpdflatex $(basename $@)',
        '',
        'clean:',
        '\tfind . -maxdepth 1 ! -name ".*" ! -name "Makefile" \\',
        '\t\t! -name "*.pdf" ! -name "*.bib" ! -name "*.tex" -delete',
        '',
        'distclean: clean',
        '\trm *.pdf',
      }
    }
  }
}
