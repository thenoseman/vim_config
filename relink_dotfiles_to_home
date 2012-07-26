#!/bin/bash
#
# relinks all dotfiles in home to the homedir
#
FILES=`find home -name ".*" -d 1`
for f in $FILES 
do
  linkme=${f/home\//}
  rm ~/$linkme
  ln -s `pwd`/home/$linkme ~/$linkme
done
