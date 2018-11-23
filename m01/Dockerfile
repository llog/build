FROM ubuntu:xenial

MAINTAINER huaixiaoz "hello@ifnot.cc"

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
RUN useradd --shell /bin/bash --home-dir /dp --create-home --password dp dp
RUN useradd --shell /bin/bash --home-dir /build --create-home --password hello hello

# Install sshd
# Install dependencies
RUN apt-get update && apt-get upgrade -y && apt-get install \
  openssh-server \
  psmisc htop vim cloc bsdmainutils tree net-tools \
  -y && \
  apt-get clean && \
  rm -fr /var/lib/apt/lists/* /tmp/* /var/tmp/* /var/cache/*

# Exec sshd
RUN mkdir /var/run/sshd && \
  echo 'root:root' | chpasswd && \
  echo 'hello:world' | chpasswd && \
  echo 'dp:00' | chpasswd && \
  sed -ri 's/^PermitRootLogin\s+.*/PermitRootLogin yes/' /etc/ssh/sshd_config && \
  sed -ri 's/UsePAM yes/#UsePAM yes/g' /etc/ssh/sshd_config && \
  sed -ri 's/#ListenAddress 0.0.0.0/ListenAddress 0.0.0.0/g' /etc/ssh/sshd_config

ENV LC_ALL C

EXPOSE 22
VOLUME /code

CMD ["/usr/sbin/sshd", "-D"]
