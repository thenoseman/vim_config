#!/bin/bash
#
# Install macvim with activated rbenv ruby
#
HERE=$(pwd)
sed -E -i '' "s|--enable-rubyinterp\",|--enable-rubyinterp\", \"--with-ruby-command=$(rbenv which ruby)\",|" /usr/local/Homebrew/Library/Taps/homebrew/homebrew-core/Formula/macvim.rb
cd /usr/local/Homebrew/Library/Taps/homebrew/homebrew-core || exit 1
git reset --hard
cd "$HERE" || true
