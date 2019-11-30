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
      \ "src/*.c&include/*.h": {
      \   "src/*.c": { "type": "implement", "alternate": "include/{}.h" },
      \   "include/*.h": { "type": "header", "alternate": "src/{}.c" },
      \ },
      \ "*.cpp&*.hpp": {
      \   "*.cpp": { "type": "src", "alternate": "{}.hpp" },
      \   "*.hpp": { "type": "header", "alternate": "{}.cpp" }
      \ },
      \ "test/factories.rb|test/factories/*.rb": {
      \   "test/factories.rb": { "type": "factory" },
      \   "test/factories/*.rb": { "type": "factory" }
      \ },
      \ "spec/factories.rb|spec/factories/*.rb": {
      \   "spec/factories.rb": { "type": "factory" },
      \   "spec/factories/*.rb": { "type": "factory" }
      \ }
      \ }
