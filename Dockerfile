# This is a comment
FROM ubuntu:14.04

MAINTAINER Bo-Yi Wu <appleboy.tw@gmail.com>

ENV DEBIAN_FRONTEND noninteractive

WORKDIR /root

# RUN apt-get update
RUN apt-get install -y git rsync tmux curl
RUN locale-gen en_US en_US.UTF-8 && dpkg-reconfigure locales
RUN git clone https://github.com/appleboy/dotfiles.git
RUN chmod 755 dotfiles/bootstrap.sh
RUN ./dotfiles/bootstrap.sh -f

CMD /bin/bash
