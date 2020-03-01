#!/bin/bash

# Absolte path to dot files repo directory
DOTFILES_DIR="$( cd "$(dirname "$0")" ; pwd -P )"

# Remove existing dot files
echo "Removing existing dot files..."
rm -rf ~/.vim_runtime
rm -rf ~/.vimrc

# Install amix/vimrc - https://github.com/amix/vimrc
echo "Installing amix/vimrc..."
git clone --depth=1 https://github.com/amix/vimrc.git ~/.vim_runtime
sh ~/.vim_runtime/install_awesome_vimrc.sh

# Add custom config to amix/vimrc
echo "Applying custom config to amix/vimrc..."
ln -sf ${DOTFILES_DIR}/vim/my_configs.vim ~/.vim_runtime/my_configs.vim

echo "Installation complete!"
