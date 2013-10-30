#!/usr/bin/env sh

# Install homebrew
ruby <(curl -fsSkL raw.github.com/mxcl/homebrew/go)
./.brew

# Install RVM
curl -L https://get.rvm.io | bash -s stable --ruby

# OS X defaults
./.osx

# sync home dir
./sync_home.sh

# install prezto
git clone --recursive https://github.com/sorin-ionescu/prezto.git "$HOME/.zprezto"

# change default shell to zsh
chsh -s /bin/zsh
