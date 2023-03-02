# SPDX-License-Identifier: GPL-2.0-or-later
# Copyright (C) 2019-2022 Team CoreELEC (https://coreelec.org)
# Copyright (C) 2022-present 7Ji (https://github.com/7Ji)

PKG_NAME="lib32-SDL2_mixer"
PKG_VERSION="$(get_pkg_version SDL2_mixer)"
PKG_NEED_UNPACK="$(get_pkg_directory SDL2_mixer)"
PKG_ARCH="aarch64"
PKG_LICENSE="GPLv3"
PKG_SITE="http://www.libsdl.org/projects/SDL_mixer/release"
PKG_URL=""
PKG_DEPENDS_TARGET="lib32-toolchain lib32-alsa-lib lib32-SDL2 lib32-mpg123-compat lib32-libvorbis lib32-libvorbisidec lib32-libogg lib32-opusfile lib32-libmodplug lib32-flac"
PKG_PATCH_DIRS+=" $(get_pkg_directory SDL2_mixer)/patches"
PKG_LONGDESC="SDL_mixer 2.0.1"
PKG_BUILD_FLAGS="lib32"

PKG_CONFIGURE_OPTS_TARGET="--disable-sdltest \
                           --disable-music-midi-fluidsynth \
                           --enable-music-flac \
                           --enable-music-mod-modplug \
                           --enable-music-ogg-tremor \
                           --enable-music-ogg \
                           --enable-music-mp3"

unpack() {
  ${SCRIPTS}/get SDL2_mixer
  mkdir -p ${PKG_BUILD}
  tar --strip-components=1 -xf ${SOURCES}/SDL2_mixer/SDL2_mixer-${PKG_VERSION}.tar.gz -C ${PKG_BUILD}
}

post_makeinstall_target() {
  safe_remove ${INSTALL}/usr/include
  mv ${INSTALL}/usr/lib ${INSTALL}/usr/lib32
}
