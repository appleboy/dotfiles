# This is a comment
FROM ubuntu:14.04

MAINTAINER Bo-Yi Wu <appleboy.tw@gmail.com>

ENV DEBIAN_FRONTEND noninteractive

# RUN apt-get update
RUN apt-get install -y git rsync tmux
RUN locale-gen en_US en_US.UTF-8 && dpkg-reconfigure locales
RUN cd ~ && git clone https://github.com/appleboy/dotfiles.git
RUN chmod 755 /root/dotfiles/bootstrap.sh
RUN /root/dotfiles/bootstrap.sh -f

CMD /bin/bash
