# SPDX-License-Identifier: GPL-2.0-or-later
# Copyright (C) 2019-present Shanti Gilbert (https://github.com/shantigilbert)

PKG_NAME="scummvmsa"
PKG_VERSION="d722f6ab1630c296793f81dbe835db2a2ab17ee5"
PKG_SHA256="5f5e671886ffb09199f74ea39284dc6fe509ed7687898291ea389eb42730978f"
PKG_REV="1"
PKG_LICENSE="GPL2"
PKG_SITE="https://github.com/scummvm/scummvm"
PKG_URL="$PKG_SITE/archive/$PKG_VERSION.tar.gz"
PKG_DEPENDS_TARGET="toolchain SDL2 SDL2_net freetype fluidsynth-git libmad"
PKG_SHORTDESC="Script Creation Utility for Maniac Mansion Virtual Machine"
PKG_LONGDESC="ScummVM is a program which allows you to run certain classic graphical point-and-click adventure games, provided you already have their data files."

pre_configure_target() { 
TARGET_CONFIGURE_OPTS="--host=${TARGET_NAME} --backend=sdl --enable-vkeybd --enable-optimizations --opengl-mode=gles2 --with-sdl-prefix=${SYSROOT_PREFIX}/usr/bin"
}

post_makeinstall_target() {
mkdir -p $INSTALL/usr/config/scummvm/extra 
	cp -rf $PKG_DIR/config/* $INSTALL/usr/config/scummvm/
	cp -rf $PKG_BUILD/backends/vkeybd/packs/*.zip $INSTALL/usr/config/scummvm/extra

mv $INSTALL/usr/local/bin $INSTALL/usr/
	cp -rf $PKG_DIR/bin/* $INSTALL/usr/bin
	
for i in appdata applications doc icons man; do
    rm -rf "$INSTALL/usr/local/share/$i"
  done

 
}

