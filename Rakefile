# -*- encoding : utf-8 -*-
desc "Generates a README in markdown format based on annottions in config files"
task :readme do
  keys = []
  leader=nil
  Dir.glob("home/.vim/config/**/*.vim") do |file|
    puts "- Parsing '#{file}'"
    File.open(file,"r") do |vim_file|
      content = vim_file.read

      # scan for @key
      content.scan /@key[ ]*(.*?):[ ]*(.*)$/ do |key_match|
        keys << {:key => $1, :description => $2, :file => File.basename(vim_file).gsub(".vim","")}
      end

      #scan for leader
      #let mapleader = ","
      unless leader
        content.match /mapleader[\s]+=[\s]+["'](.*?)["']/ do |mat|
          leader = mat[1]
        end
      end
    end
  end
  puts "Found LEADER to be __#{leader}__"
  puts keys
end
