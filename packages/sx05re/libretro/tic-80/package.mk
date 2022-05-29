# SPDX-License-Identifier: GPL-2.0-or-later
# Copyright (C) 2020-present Shanti Gilbert (https://github.com/shantigilbert)

PKG_NAME="tic-80"
PKG_VERSION="3a4c813d49f110d701d98fd0d96decb5ca0cbf05"
PKG_LICENSE="MIT"
PKG_SITE="https://github.com/nesbox/TIC-80"
PKG_URL="$PKG_SITE.git"
PKG_DEPENDS_TARGET="toolchain"
PKG_LONGDESC="TIC-80 is a fantasy computer for making, playing and sharing tiny games."
GET_HANDLER_SUPPORT="git"

PKG_CMAKE_OPTS_TARGET="-DBUILD_LIBRETRO=ON \
					   -DBUILD_PLAYER=ON \
					   -DBUILD_DEMO_CARTS=OFF \
                       -DBUILD_SOKOL=OFF \
                       -DBUILD_SDL=ON \
                       -DBUILD_WITH_MRUBY=OFF \
                       -DCMAKE_BUILD_TYPE=Release"

makeinstall_target() {
  mkdir -p $INSTALL/usr/lib/libretro
  cp $PKG_BUILD/.$TARGET_NAME/lib/tic80_libretro.so $INSTALL/usr/lib/libretro/tic80_libretro.so
}
