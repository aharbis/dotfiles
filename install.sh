#!/bin/bash

# Absolte path to dot files repo directory
DOTFILES_DIR="$( cd "$(dirname "$0")" ; pwd -P )"
GITCONFIG_LINK="${DOTFILES_DIR}/git/.gitconfig_link"

# Check for existing gitconfig link file
if [[ -f "$GITCONFIG_LINK" ]]; then
    echo "Using existing generated .gitconfig"
else
    # prompt for name and email to use in .gitconfig
    read -p "Enter name for .gitconfig: " name
    read -p "Enter email for .gitconfig: " email
    sed "s|REPLACE_NAME|${name}|g" ${DOTFILES_DIR}/git/.gitconfig > $GITCONFIG_LINK
    sed -i "s|REPLACE_EMAIL|${email}|g" $GITCONFIG_LINK
fi

# Remove existing dot files
echo "Removing existing dot files..."
rm -rf ~/.vim_runtime
rm -rf ~/.vimrc
rm -rf ~/.tmux.conf
rm -rf ~/.gitconfig

# Install amix/vimrc - https://github.com/amix/vimrc
echo "Installing amix/vimrc..."
git clone --depth=1 https://github.com/amix/vimrc.git ~/.vim_runtime
sh ~/.vim_runtime/install_awesome_vimrc.sh

# Add custom config to amix/vimrc
echo "Applying custom config to amix/vimrc..."
ln -sf ${DOTFILES_DIR}/vim/my_configs.vim ~/.vim_runtime/my_configs.vim

# Create symlinks in the home directory
echo "Creating symlinks..."
ln -sf ${DOTFILES_DIR}/tmux/.tmux.conf ~/.tmux.conf
ln -sf ${GITCONFIG_LINK} ~/.gitconfig

echo "Installation complete!"
