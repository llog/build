## Android Build Environment(Linux: based on _latest_ **ubuntu**)

- default: the default Android Source Build Environment (form [https://wiki.lineageos.org/devices/hydrogen/build#download-the-source-code](https://wiki.lineageos.org/devices/hydrogen/build#download-the-source-code))
- ssh: install __openssh-server__ and sshd-enabled; the default **root password** is **root**
- my: the __root password __ you should _never_ know... sry about that xd:_

### Again: the __huaixiaoz/build:ssh root password is root__

## How to use(Usage)
```
docker pull huaixiaoz/build
docker run --rm -it huaixiaoz/build
```
and then: do __what you want__

### basically you can do:

1. repo init https://...
2. repo sync -jxx
3. source build/envsetup.sh
4. brunch model

__have fun and enjoy!! __

### About __huaixiaoz/build:ssh__
```
docker pull huaixiaoz/build:ssh
docker run --rm -it -p xx:22 huaixiaoz/build:ssh
docker run --privileged --restart=always -d --publish 33:22 --volume /build:/home/dp/code/aosp --name build --hostname build huaixiaoz/build:ssh
```
now you ssh login to do __what you want__

__really, the root is root, you should change it.__


## Build Status

[![Build Status](https://travis-ci.org/llog/build.svg?branch=master)](https://travis-ci.org/llog/build)
