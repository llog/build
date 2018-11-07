FROM ubuntu:latest

MAINTAINER huaixiaoz "hello@ifnot.cc"

# add Android SDK platform tools to path if existes
RUN echo "\n# add Android SDK platform tools to path\
\nif [ -d \"\$HOME/platform-tools\" ] ; then\
\n    PATH=\"\$HOME/platform-tools:\$PATH\"\
\nfi\n" >> ~/.profile

ENV TERM xterm

# Install dependencies
RUN apt-get update && apt-get upgrade -y && apt-get install \
  openjdk-8-jdk \
  bc bison build-essential curl flex g++-multilib gcc-multilib git gnupg gperf \
  imagemagick lib32ncurses5-dev lib32readline-dev lib32z1-dev liblz4-tool \
  libncurses5-dev libsdl1.2-dev libssl-dev libwxgtk3.0-dev libxml2 libxml2-utils \
  lzop pngcrush rsync schedtool squashfs-tools xsltproc zip zlib1g-dev \
  -y && \
  apt-get clean && \
  rm -fr /var/lib/apt/lists/* /tmp/* /var/tmp/* /var/cache/*

# Install repo
RUN curl https://storage.googleapis.com/git-repo-downloads/repo > /usr/local/bin/repo && \
  chmod a+x /usr/local/bin/repo

# Setup environment
RUN useradd --shell /bin/bash --home-dir /build --create-home --password hello hello

VOLUME /build/source

WORKDIR /build
