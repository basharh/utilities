#!/usr/bin/env bash

set -e # Exit on error

if [ $(id -u) != 0 ]; then
    echo "You should be root!"
    exit 1
fi

#apt-get -q update
apt-get -q install -y git zsh openssh-server unzip

userdel -r bashar
addgroup bashar
useradd -m -g bashar -G sudo,adm bashar
chsh -s /bin/zsh bashar

UHOME=/home/bashar # user home
chmod a+x provision_user.sh
cp provision_user.sh $UHOME
passwd bashar
