FROM phusion/baseimage:0.9.18

MAINTAINER Bo-Yi Wu <appleboy.tw@gmail.com>

ENV DEBIAN_FRONTEND noninteractive

WORKDIR /root

# RUN apt-get update
RUN apt-get -y update && apt-get install -y git rsync tmux curl
RUN locale-gen en_US en_US.UTF-8 && dpkg-reconfigure locales
RUN git clone https://github.com/appleboy/dotfiles.git
RUN chmod 755 dotfiles/bootstrap.sh
RUN ./dotfiles/bootstrap.sh -f

# Clean up APT when done.
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

CMD /bin/bash
