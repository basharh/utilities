#!/usr/bin/env bash

set -e # Exit on error

HOME=/home/bashar
SSH_FOLDER=$HOME/.ssh
AUTHORIZED_KEYS=$HOME/.ssh/authorized_keys

if [ ! -d $SSH_FOLDER ] || [ ! -f $AUTHORIZED_KEYS ]; then
    mkdir $SSH_FOLDER
    touch $AUTHORIZED_KEYS
fi

mkdir $HOME/.vim
mkdir $HOME/.vim/bundle
mkdir $HOME/.vim/autoload

mkdir $HOME/packages
cd $HOME/packages
#git clone git@github.com:basharh/utilities.git
#git clone git@github.com:scrooloose/nerdtree.git
#git clone git@github.com:scrooloose/nerdcommenter.git
git clone https://github.com/basharh/utilities.git
git clone https://github.com/scrooloose/nerdtree.git
git clone https://github.com/scrooloose/nerdcommenter.git
git clone https://github.com/tpope/vim-pathogen.git
wget --content-disposition 'http://www.vim.org/scripts/download_script.php?src_id=20953'
unzip -d bufexplorer bufexplorer-7.4.2.zip

cd $HOME;
ln -s $HOME/packages/utilities/home/.zshenv
ln -s $HOME/packages/utilities/home/.zshrc
ln -s $HOME/packages/utilities/home/.inputrc
ln -s $HOME/packages/utilities/home/.vimrc

cd $HOME/.vim/bundle
ln -s $HOME/packages/utilities/home/.vim/bundle/bashar
ln -s $HOME/packages/nerdtree
ln -s $HOME/packages/nerdcommenter
ln -s $HOME/packages/bufexplorer

cd $HOME/.vim/autoload
ln -s $HOME/packages/vim-pathogen/autoload/pathogen.vim

#chsh -s /bin/zsh bashar
