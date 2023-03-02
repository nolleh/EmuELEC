# SPDX-License-Identifier: GPL-2.0-or-later
# Copyright (C) 2020-present Shanti Gilbert (https://github.com/shantigilbert)

PKG_NAME="dosbox-x"

if [[ "${DEVICE}" == "Amlogic-old" ]]; then
PKG_VERSION="286e859e08b60a04c0b4c2bc952432122c957a9c"
PKG_SHA256="1a44710e38b05f67e76da74f46bbea4bb8b73ed4a28044575dfa24765bc65d7c"
else
PKG_VERSION="ed9788a6d71e5a91071e9e9a6e9e9098edade78f"
PKG_SHA256="beacd9fec28a4815d90ff543f8b879d04b4e1c0d1195a34a04a9e4417829b2e0"
fi
PKG_LICENSE="GPLv2"
PKG_SITE="https://github.com/joncampbell123/dosbox-x"
PKG_URL="$PKG_SITE/archive/${PKG_VERSION}.tar.gz"
PKG_DEPENDS_TARGET="toolchain linux glibc glib systemd dbus alsa-lib SDL2 SDL2_net SDL_sound libpng zlib libvorbis flac libogg fluidsynth-git munt"
PKG_LONGDESC="DOSBox-X fork of the DOSBox project."
PKG_TOOLCHAIN="autotools"
PKG_BUILD_FLAGS="+lto"

pre_configure_target() {
  cd ${PKG_BUILD}
  rm -rf .${TARGET_NAME}

  PKG_CONFIGURE_OPTS_TARGET="--prefix=/usr \
                             --enable-core-inline \
                             --enable-dynrec \
                             --enable-unaligned_memory \
                             --disable-sdl \
							 --enable-sdl2 \
							 --enable-mt32 \
                             --with-sdl2-prefix=${SYSROOT_PREFIX}/usr"
}

pre_make_target() {
  # Define DOSBox version
  sed -e "s/SVN/SDL2/" -i ${PKG_BUILD}/config.h

if [[ "${DEVICE}" == "GameForce" ]] || [[ "${DEVICE}" == "OdroidGoAdvance" ]] ; then
		cp $PKG_DIR/include/gpio.h ${SYSROOT_PREFIX}/usr/include/linux
fi
 	
}

post_makeinstall_target() {
  # Create config directory & install config
  mkdir -p ${INSTALL}/usr/config/emuelec/configs/dosbox-x/
  cp -a ${PKG_DIR}/scripts/* ${INSTALL}/usr/bin/
  cp -a ${PKG_DIR}/config/*  ${INSTALL}/usr/config/emuelec/configs/dosbox-x/
  
if [[ "${DEVICE}" == "GameForce" ]] || [[ "${DEVICE}" == "OdroidGoAdvance" ]] ; then
	echo ${TOOLCHAIN}/${TARGET_NAME}/sysroot/usr/include/linux/gpio.h
	rm ${TOOLCHAIN}/${TARGET_NAME}/sysroot/usr/include/linux/gpio.h
fi
}
