FROM ubuntu:16.04

RUN apt-get update --fix-missing
RUN apt-get -y install zsh
RUN apt-get -y install git
RUN apt-get -y install vim
RUN apt-get -y install curl
RUN apt-get -y install screen
RUN apt-get -y install openssh-server
RUN ssh-keygen -A
RUN mkdir /var/run/sshd
RUN useradd -m -G sudo -p WR8hPeYDSKEGs -s /bin/zsh bashar

WORKDIR /home/bashar

USER bashar
COPY provision_bashar.sh /home/bashar
RUN /bin/sh provision_bashar.sh

USER root
CMD ["/usr/sbin/sshd", "-D"]
