FROM huaixiaoz/build:latest

MAINTAINER huaixiaoz "hello@ifnot.cc"

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
  sed -ri 's/^PermitRootLogin\s+.*/PermitRootLogin yes/' /etc/ssh/sshd_config && \
  sed -ri 's/UsePAM yes/#UsePAM yes/g' /etc/ssh/sshd_config && \
  sed -ri 's/#ListenAddress 0.0.0.0/ListenAddress 0.0.0.0/g' /etc/ssh/sshd_config

EXPOSE 22
VOLUME /build/source

CMD ["/usr/sbin/sshd", "-D"]
