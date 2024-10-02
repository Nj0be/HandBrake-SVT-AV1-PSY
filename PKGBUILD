# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix
# Contributor: HurricanePootis <hurricanepootis@protonmail.com>
# Contributor: graysky <graysky AT archlinux DOT us>
# Contributor: jiribb <jiribb@gmail.com>
# Contributor: David Spicer <azleifel at googlemail dot com>
# Contributor: Andrew Brouwers
# Contributor: ponsfoot <cabezon dot hashimoto at gmail dot com>
# Contributor: Stefan Husmann <stefan-husmann@t-online.de>

pkgbase=handbrake-svt-av1-psy-git
pkgname=(handbrake-svt-av1-psy-git handbrake-svt-av1-psy-cli-git)
pkgver=1.8.0.r135.gdeb4c4578
pkgrel=1
pkgdesc="Multithreaded video transcoder. Enabled: x265, nvenc, fdk-aac, qsv, vce, numa, hardened. Last stable branch"
arch=(i686 x86_64)
url="https://handbrake.fr/"
license=(GPL-2.0-only)
source=("HandBrake::git+https://github.com/HandBrake/HandBrake.git" "HandBrake-SVT-AV1-PSY::git+https://github.com/Nj0be/HandBrake-SVT-AV1-PSY.git")
_commondeps=(libxml2 libass libvorbis opus speex libtheora lame libjpeg-turbo
             x264 libx264.so jansson libvpx libva numactl)
_guideps=(gst-plugins-base gtk4 libgudev)
makedepends=(git intltool python nasm wget cmake meson cargo-c base-devel
             "${_commondeps[@]}" "${_guideps[@]}")
optdepends=('libdvdcss: for decoding encrypted DVDs'
            'intel-media-sdk: for enabling Intel QSV'
            'nvidia-utils: for Nvidia users, enable Nvidia nvenc'
            'cuda: for Nvidia users, enable Nvidia nvdec'
            'amf-amdgpu-pro: for enabling AMD AMF')
sha256sums=('SKIP' 'SKIP')
options=(!lto)

pkgver() {
  cd "HandBrake"
  git describe --long | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  ./HandBrake-SVT-AV1-PSY/patch.sh
  cd "HandBrake"

  ./configure \
    --prefix=/usr \
    --lto=on \
    --enable-qsv \
    --launch-jobs=0 \
    --launch
    #--harden \
    #--enable-x265 \
    #--enable-libdovi \
    #--enable-numa \
    #--enable-fdk-aac \
    #--enable-nvdec \
    #--enable-nvenc \
    #--enable-vce
}

package_handbrake-svt-av1-psy-git() {
  pkgdesc="Multithreaded video transcoder"
  depends=("${_commondeps[@]}" "${_guideps[@]}")
  optdepends+=('gst-plugins-good: for video previews'
               'gst-libav: for video previews')
  provides=(handbrake)
  conflicts=(handbrake)

  cd "$srcdir/HandBrake/build"

  make DESTDIR="$pkgdir" install
  rm "$pkgdir/usr/bin/HandBrakeCLI"
}

package_handbrake-svt-av1-psy-cli-git() {
  pkgdesc="Multithreaded video transcoder (CLI)"
  depends=("${_commondeps[@]}")
  provides=(handbrake-cli)
  conflicts=(handbrake-cli)

  cd "$srcdir/HandBrake/build"
  install -D HandBrakeCLI "$pkgdir/usr/bin/HandBrakeCLI"
}
