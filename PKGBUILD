# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Your Name <youremail@domain.com>
pkgname=minfetch
pkgver=1.0.0
pkgrel=1
pkgdesc="a simple customisable fetch script"
arch=('any')
url="https://github.com/xXTacticalWaffleXx/minfetch"
license=('GPL')
provides=("minfetch")
conflicts=("minfetch")
options=()
source=("https://raw.githubusercontent.com/xXTacticalWaffleXx/minfetch/main/fetch.sh")
md5sums=('73f6f5e9aae9f847c94b678482be8b77')

package() {
  install -Dm755 "fetch.sh" -t "${pkgdir}/usr/bin"
}
