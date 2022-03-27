#!/bin/sh

DOT_FILES=( .gitconfig .hyper.js .vimrc .zshalias .zshenv .zshrc .yabairc)
SCRIPT_DIR=$(cd $(dirname $0) && pwd)
ORG_DIR=$HOME/dotfile_org

for file in ${DOT_FILES[@]}
do
  if [ -a $HOME/$file ]; then
    mkdir -p $ORG_DIR
    mv -i $HOME/$file $ORG_DIR/$file
    echo "move original file: $ORG_DIR/$file"
  fi
  ln -s $SCRIPT_DIR/$file $HOME/$file
  echo "add symlink: $file"
done