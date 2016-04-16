#!/usr/bin/env bash

for file in .{bash_logout,bash_profile,bash_profile}; do
  ln -si $HOME/dotfiles/$file $HOME/$file
done

git clone git@github.com:rupa/z.git $HOME/dotfiles/z &&
  cd $_ && git checkout `git describe --abbrev=0 --tags`
