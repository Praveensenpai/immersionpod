# Maintainer: Praveen <praveen@local>
pkgname=immersionpod-git
pkgver=1.0.0
pkgrel=1
pkgdesc="Automated MPD and ImmersionPod setup utility for audio language immersion"
arch=('any')
url="https://github.com/Praveensenpai/immersionpod"
license=('MIT')
depends=('bash' 'mpd' 'mpc' 'ffmpeg' 'curl')
makedepends=('git')
provides=('immersionpod')
conflicts=('immersionpod')
source=("git+https://github.com/Praveensenpai/immersionpod.git")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/${pkgname%-git}" 2>/dev/null || cd "$srcdir"
  git describe --long --tags 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' || echo "1.0.0"
}

package() {
  cd "$srcdir/${pkgname%-git}" 2>/dev/null || cd "$srcdir"
  install -Dm755 bin/impd-setup "$pkgdir/usr/bin/impd-setup"
}
