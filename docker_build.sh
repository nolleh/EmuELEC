#!/bin/sh
# docker run --rm -v `pwd`:/build -w /build -it -e PROJECT=Amlogic-ce -e DEVICE=Amlogic-ng -e ARCH=arm coreelec make image

docker build --pull -t emuelec-test tools/docker/aarch64/test
docker run --rm -v `pwd`:/build -w /build -it -e PROJECT=Rockchip -e DEVICE=OdroidGoAdvance -e ARCH=aarch64 -e DISTRO=EmuELEC emuelec-test make image

