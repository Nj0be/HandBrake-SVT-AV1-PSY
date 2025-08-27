# Maintainer: Holger Obermaier <holgerob@gmx.de>
# Contributor: Evangelos Foutras <evangelos@foutrelis.com>
# Contributor: Giovanni Scafora <giovanni@archlinux.org>
# Contributor: Sebastien Piccand <sebcactus gmail com>

pkgname=(
  'handbrake-svt-av1-psy-llvm-optimized'
  'handbrake-svt-av1-psy-llvm-optimized-cli'
)

pkgver=1.9.0
pkgrel=2
arch=('x86_64')
url="https://handbrake.fr/"
license=(GPL-2.0-only)
_commondeps=(
  'bzip2'
  'fribidi'
  'gcc-libs'
  'jansson'
  'lame'
  'libass'
  'libjpeg-turbo'
  'libogg'
  'libtheora'
  'libva'
  'libvorbis'
  'libvpx'
  'libxml2'
  'numactl'
  'opus'
  'speex'
  'x264'
  'xz'
  'zlib'
)
_guideps=(
  'at-spi2-core'
  'cairo'
  'fontconfig'
  'freetype2'
  'gdk-pixbuf2'
  'glib2'
  'gst-plugins-base'
  'gst-plugins-base-libs'
  'gstreamer'
  'gtk4'
  'harfbuzz'
  'libgudev'
  'pango'
)
makedepends=(
  'base-devel'
  'intltool'
  'python'
  'nasm'
  'wget'
  'cmake'
  'meson'
  'git'
  'clang'
  'lld'
  'llvm'
  # AMD VCE encoding on Linux requires Vulkan
  'vulkan-headers'
  "${_commondeps[@]}"
  "${_guideps[@]}"
)
options=('!lto') # https://bugs.archlinux.org/task/72600
source=("HandBrake::git+https://github.com/HandBrake/HandBrake.git" "HandBrake-SVT-AV1-PSY::git+https://github.com/Nj0be/HandBrake-SVT-AV1-PSY.git")
sha256sums=('SKIP' 'SKIP')

pkgver() {
  cd "${srcdir}/HandBrake"
  git describe --long | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

setup_compiler() {
  export CC="/usr/bin/clang"
  unset CFLAGS
  export CXX="/usr/bin/clang++"
  unset CXXFLAGS
  export CPP="/usr/bin/clang-cpp"
  export LD="/usr/bin/lld"
  export LDFLAGS="-fuse-ld=lld"
  export AR="/usr/bin/llvm-ar"
  export RANLIB="/usr/bin/llvm-ranlib"
  export NM="/usr/bin/llvm-nm"
  export ADDR2LINE="/usr/bin/llvm-addr2line"
  export OBJCOPY="/usr/bin/llvm-objcopy"
  export OBJDUMP="/usr/bin/llvm-objdump"
  export READELF="/usr/bin/llvm-readelf"
  export STRIP="/usr/bin/llvm-strip"
}

build() {
  ./HandBrake-SVT-AV1-PSY/patch.sh
  setup_compiler

  local -a CONFIGURE_OPTIONS=(
    --launch-jobs=0
    --prefix=/usr
    --cc="${CC}"
    --ar="${AR}"
    --ranlib="${RANLIB}"
    --strip="${STRIP}"
    --lto=on
    --enable-qsv
    --enable-vce
  )

  cd "${srcdir}/HandBrake" || exit
  ./configure "${CONFIGURE_OPTIONS[@]}"
  make -C build
}

package_handbrake-svt-av1-psy-llvm-optimized() {
  pkgdesc="Multithreaded video transcoder optimized with LLVM"
  depends=(
    'desktop-file-utils'
    'hicolor-icon-theme'
    "${_commondeps[@]}"
    "${_guideps[@]}"
  )
  optdepends=(
    'gst-plugins-good: for video previews'
    'gst-libav: for video previews'
    'intel-media-sdk: Intel QuickSync support'
    'libdvdcss: for decoding encrypted DVDs'
  )
  provides=(handbrake)
  conflicts=(handbrake)

  make \
    --directory="${srcdir}/HandBrake/build" \
    DESTDIR="${pkgdir}" \
    install
  rm "${pkgdir}/usr/bin/HandBrakeCLI"
}

package_handbrake-svt-av1-psy-llvm-optimized-cli() {
  pkgdesc="Multithreaded video transcoder optimized with LLVM (CLI)"
  depends=("${_commondeps[@]}")
  optdepends=(
    'intel-media-sdk: Intel QuickSync support'
    'libdvdcss: for decoding encrypted DVDs'
  )
  provides=(handbrake-cli)
  conflicts=(handbrake-cli)

  install -D "${srcdir}/HandBrake/build/HandBrakeCLI" "${pkgdir}/usr/bin/HandBrakeCLI"
}
