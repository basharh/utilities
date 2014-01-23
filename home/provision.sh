#!/usr/bin/env bash

if ![ $(id -u) = 0 ]; then
    echo "You should be root!"
    exit 1
fi
apt-get -qq update
apt-get -qq install -y git zsh openssh-server unzip

su bashar
HOME = /home/bashar

mkdir $HOME/.vim
mkdir $HOME/.vim/bundle
mkdir $HOME/.vim/autoload

mkdir $HOME/packages
git clone git@github.com:basharh/utilities.git
git clone git@github.com:scrooloose/nerdtree.git
git clone git@github.com:scrooloose/nerdcommenter.git
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

