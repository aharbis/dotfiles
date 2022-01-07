#!/bin/bash

set -e

DOTFILES_DIR="$( cd "$(dirname "$0")" ; pwd -P )"
GITCONFIG_LINK="${DOTFILES_DIR}/git/.gitconfig_link"
ENV_CONFIG="${DOTFILES_DIR}/.env"

if [[ -f "${ENV_CONFIG}" ]]; then
    echo "Using existing env config"
    source ${ENV_CONFIG}
else
    read -p "Enter name: " NAME
    read -p "Enter email: " EMAIL
    echo "NAME=\"${NAME}\"" > ${ENV_CONFIG}
    echo "EMAIL=\"${EMAIL}\"" >> ${ENV_CONFIG}
fi

echo "Removing existing dot files"
rm -rf ~/.vim_runtime
rm -rf ~/.vimrc
rm -rf ~/.tmux.conf
rm -rf ~/.gitconfig
rm -rf ${GITCONFIG_LINK}

echo "Generating .gitconfig"
sed "s|REPLACE_NAME|${NAME}|g" ${DOTFILES_DIR}/git/.gitconfig > $GITCONFIG_LINK
sed -i "s|REPLACE_EMAIL|${EMAIL}|g" $GITCONFIG_LINK

echo "Installing amix/vimrc"
git clone --depth=1 https://github.com/amix/vimrc.git ~/.vim_runtime
sh ~/.vim_runtime/install_awesome_vimrc.sh

echo "Applying custom config to amix/vimrc"
ln -sf ${DOTFILES_DIR}/vim/my_configs.vim ~/.vim_runtime/my_configs.vim

echo "Creating symlinks"
ln -sf ${DOTFILES_DIR}/tmux/.tmux.conf ~/.tmux.conf
ln -sf ${GITCONFIG_LINK} ~/.gitconfig

echo "Installation complete!"
