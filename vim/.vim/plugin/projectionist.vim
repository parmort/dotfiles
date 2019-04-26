let g:projectionist_heuristics = {
      \ "*.rb&*_test.rb": {
      \   "*_test.rb": {
      \     "type": "test",
      \     "alternate": "{}.rb",
      \     "dispatch": "ruby {file}"
      \   },
      \   "*.rb": {
      \     "type": "implement",
      \     "alternate": "{}_test.rb",
      \     "dispatch": "ruby {}_test.rb"
      \   }
      \ },
      \ "src/*.c&src/*.h&test/test_*.c": {
      \   "src/*.c": { "type": "implement", "alternate": "src/{}.h" },
      \   "src/*.h": { "type": "header", "alternate": "src/{}.c" },
      \   "test/test_*.c": { "type": "test" }
      \ }
      \ }
