#!/usr/bin/env bash

for file in .{bash_logout,bash_profile,bash_profile}; do
  ln -si $HOME/dotfiles/$file $HOME/$file
done
