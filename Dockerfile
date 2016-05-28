FROM ubuntu:latest
MAINTAINER huaixiaoz "hello@itmp.top"

# Install dependencies
RUN apt-get update && apt-get upgrade -y && apt-get install openjdk-8-jdk \
  git-core gnupg flex bison gperf build-essential \
  zip curl zlib1g-dev gcc-multilib g++-multilib libc6-dev-i386 \
  lib32ncurses5-dev x11proto-core-dev libx11-dev lib32z-dev ccache \
  libgl1-mesa-dev libxml2-utils xsltproc unzip \
  bc vim psmisc htop  bash-completion cloc net-tools iputils-ping netcat openssh-server \
  -y

# Setup environment
RUN useradd --shell /bin/bash --home-dir /build --create-home --password hello hello

VOLUME /build/source

#USER hello
#RUN mkdir ~/bin ~/source && PATH=~/bin:$PATH
RUN curl https://storage.googleapis.com/git-repo-downloads/repo > /bin/repo && chmod a+x /bin/repo

WORKDIR /build
