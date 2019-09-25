#!/bin/bash
#
# Install macvim with activated rbenv ruby
#
HERE=$(pwd)
brew unlink macvim || true
RUBY="$(rbenv which ruby)"
echo "Building macvim with $RUBY"
sed -E -i '' "s|--enable-rubyinterp\",|--enable-rubyinterp\", \"--with-ruby-command=$RUBY\",|" /usr/local/Homebrew/Library/Taps/homebrew/homebrew-core/Formula/macvim.rb
brew install --force --build-from-source macvim
cd /usr/local/Homebrew/Library/Taps/homebrew/homebrew-core || exit 1
git reset --hard
cd "$HERE" || true
