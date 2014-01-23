#!/usr/bin/env bash

set -e # Exit on error

if [ $(id -u) != 0 ]; then
    echo "You should be root!"
    exit 1
fi

userdel -r bashar
addgroup bashar
useradd -m -g bashar -G sudo,adm bashar
chsh -s /bin/zsh bashar

#apt-get -q update
apt-get -q install -y git zsh openssh-server unzip
