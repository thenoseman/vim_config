" https://github.com/tpope/vim-projectionist/blob/master/doc/projectionist.txt
let g:projectionist_heuristics = {
  \   "*.gemspec": {
  \     "app/models/*.rb": { "alternate": "spec/models/{}_spec.rb" },
  \     "spec/models/*_spec.rb": { "alternate": "app/models/{}.rb" },
  \     "app/controllers/*.rb": { "alternate": "spec/controllers/{}_spec.rb" },
  \     "spec/controllers/*_spec.rb": { "alternate": "app/controllers/{}.rb" },
  \     "app/helpers/*.rb": { "alternate": "spec/helpers/{}_spec.rb" },
  \     "spec/helpers/*_spec.rb": { "alternate": "app/helpers/{}.rb" }
  \   },
  \   "package.json": {
  \     "src/*.js": {
  \       "alternate": [
  \         "tests/unit/{}.spec.js", 
  \         "tests/unit/{}.test.js",
  \         "test/unit/{}.spec.js",
  \         "test/unit/{}.spec.ts", 
  \         "test/unit/{}.test.ts", 
  \         "test/unit/{}.test.js", 
  \         "tests/unit-jest/{}.test.js", 
  \         "tests/unit-jest/{}.test.ts", 
  \         "tests/unit-mocha/{}.spec.js", 
  \         "tests/unit-mocha/{}.spec.ts"
  \       ],
  \       "type": "source"
  \     },
  \     "src/*.vue": {
  \       "alternate": ["tests/unit/{}.spec.js", "tests/unit/{dirname}.spec.js", "tests/unit/{dirname}/{dirname|basename}.spec.js"],
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
  \       "alternate": ["src/{}.js", "src/{}.ts"],
  \       "type": "test"
  \     },
  \     "src/*.ts": {
  \       "alternate": [
  \          "tests/unit/{}.spec.js", 
  \          "test/unit/{}.spec.ts", 
  \          "tests/unit/{}.test.js",
  \          "test/unit/{}.test.ts", 
  \          "tests/unit-jest/{}.test.js", 
  \          "tests/unit-jest/{}.test.ts", 
  \          "tests/unit-mocha/{}.spec.js", 
  \          "tests/unit-mocha/{}.spec.ts"
  \       ],
  \       "type": "source"
  \     }
  \   }
  \ }
