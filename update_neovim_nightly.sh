#!/bin/bash

# Navigate to neovim folder
cd $HOME/src/contribute/tools/neovim/

# Retrieve latest version of nightly neovim
git fetch --all --tags -f --prune
git checkout tags/nightly

# Build neovim from source with necessary config
mkdir -p $HOME/.local/nvim
echo "Build..."
make CMAKE_BUILD_TYPE=Release CMAKE_INSTALL_PREFIX=$HOME/.local/nvim

# Install neovim to local folder
echo "Install..."
make install
sudo rm /usr/bin/nvim
sudo ln -s $HOME/.local/nvim/bin/nvim /usr/bin/nvim

# Clean up afterward
make clean
git clean -xdf
git checkout master
