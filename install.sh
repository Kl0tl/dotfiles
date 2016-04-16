#!/usr/bin/env bash

for file in .{bash_logout,bash_profile,bash_profile}; do
  ln -si $HOME/dotfiles/$file $HOME/$file
done

checkout git@github.com:rupa/z.git z

checkout git@github.com:creationix/nvm.git nvm

function checkout {
  git clone $1 $HOME/dotfiles/$2 &&
    cd $_ && git checkout `git describe --abbrev=0 --tags`
}
