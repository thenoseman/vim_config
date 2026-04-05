" https://github.com/tpope/vim-projectionist/blob/master/doc/projectionist.txt
let g:projectionist_heuristics = {
  \   "package.json": {
  \     "src/*.js": {
  \       "alternate": [
  \         "tests/unit/{}.spec.js", 
  \         "tests/unit/{}.test.js",
  \         "test/unit/{}.spec.js",
  \         "test/unit/{}.spec.ts", 
  \         "test/unit/{}.test.ts", 
  \         "test/unit/{}.test.js", 
  \       ],
  \       "type": "source"
  \     },
  \     "src/*.vue": {
  \       "alternate": ["test/unit/{}.test.ts", "test/unit/{dirname}.test.ts", "test/unit/{dirname}/{dirname|basename}.test.ts"],
  \       "type": "source"
  \     },
  \     "tests/unit/*.spec.js": {
  \       "alternate": ["src/{}.vue", "src/{}.js", "src/{}/index.vue", "src/{dirname|basename}/index.vue", "src/{dirname}/index.vue"],
  \       "type": "test"
  \     },
  \     "test/unit/*.spec.js": {
  \       "alternate": ["src/{}.js", "src/{}.ts"],
  \       "type": "test"
  \     },
  \     "test/unit/*.test.ts": {
  \       "alternate": ["src/{}.ts", "src/{}.vue", "src/{}.js"],
  \       "type": "test"
  \     },
  \     "src/*.ts": {
  \       "alternate": [
  \          "test/unit/{}.test.ts", 
  \          "tests/unit/{}.test.js",
  \          "test/unit/{}.spec.ts", 
  \          "tests/unit/{}.spec.js", 
  \       ],
  \       "type": "source"
  \     }
  \   }
  \ }
