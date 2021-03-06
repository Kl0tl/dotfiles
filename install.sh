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

for cmd in {node,npm}; do
  sudo ln -si $HOME/dotfiles/bin/$cmd /usr/local/bin/$cmd
done

npm completion > /usr/local/etc/bash_completion.d/npm

/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
brew tap Homebrew/bundle
brew bundle

sudo bash -c "echo $(brew --prefix)/bin/bash >> /etc/shells"
chsh -s $(brew --prefix)/bin/bash
