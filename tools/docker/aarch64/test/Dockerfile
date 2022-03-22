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

RUN apt-get update && apt-get install -y \
  gcc make git unzip wget xz-utils libsdl2-dev libsdl2-mixer-dev \
  libfreeimage-dev libfreetype6-dev libcurl4-openssl-dev \
  rapidjson-dev libasound2-dev libgl1-mesa-dev build-essential \
  libboost-all-dev cmake fonts-droid-fallback libvlc-dev libvlccore-dev \
  vlc-bin texinfo premake4 golang libssl-dev curl patchelf xmlstarlet default-jre xsltproc

# for test stage
RUN apt-get install -y \
 libc6-dev tzdata xfonts-utils lzop \
 --no-install-recommends \
 && rm -rf /var/lib/apt/lists/*

USER docker

