FROM arm64v8/ubuntu:focal

ARG DEBIAN_FRONTEND=noninteractive

RUN apt-get update \
 && apt-get dist-upgrade -y \
 && apt-get install -y locales sudo \
 && rm -rf /var/lib/apt/lists/*

RUN locale-gen en_US.UTF-8 \
 && update-locale LANG=en_US.UTF-8 LANGUAGE=en_US:en
ENV LANG=en_US.UTF-8 \
    LANGUAGE=en_US:en \
    LC_ALL=en_US.UTF-8

RUN adduser --disabled-password --gecos '' docker \
 && adduser docker sudo \
 && echo '%sudo ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers

# enmuelc dependencies
RUN apt-get update && apt-get install -y \
  gcc make git unzip wget xz-utils libsdl2-dev libsdl2-mixer-dev \
  libfreeimage-dev libfreetype6-dev libcurl4-openssl-dev \
  rapidjson-dev libasound2-dev libgl1-mesa-dev build-essential \
  libboost-all-dev cmake fonts-droid-fallback libvlc-dev libvlccore-dev \
  vlc-bin texinfo premake4 golang libssl-dev curl patchelf xmlstarlet default-jre xsltproc

# derived from core-elec dependencies
RUN apt-get update && apt-get --fix-broken install -y \
 bash bc sed patch patchutils tar bzip2 gzip perl gawk gperf zip unzip diffutils texinfo lzop python python3 \
    g++ xfonts-utils xfonts-utils xfonts-utils xsltproc default-jre-headless cpio \
    libncurses5-dev libssl-dev \
    u-boot-tools \
    xz-utils make file libxml-parser-perl \
    libjson-perl libparse-yapp-perl \
    golang-go \
    openssh-client \
    qemu-user-binfmt \
 --no-install-recommends \
 && rm -rf /var/lib/apt/lists/*

# make path corresponds with scripts/checkdeps
RUN apt-get update && apt-get install -y libc6-amd64-cross bison

RUN mkdir -p /lib64 \ 
    && mkdir -p /lib/x86_64-linux-gnu

RUN cp /usr/x86_64-linux-gnu/lib64/ld-linux-x86-64.so.2 /lib64/ \
    && cp /usr/x86_64-linux-gnu/lib/libc.so.6 /lib/x86_64-linux-gnu/libc.so.6

USER docker

