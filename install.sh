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

# install oh my zsh
git clone git://github.com/robbyrussell/oh-my-zsh.git $HOME/.oh-my-zsh
chsh -s /bin/zsh
