# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit rpm gnome2-utils xdg-utils

DESCRIPTION="A hackable text editor for the 21st Century"
HOMEPAGE="https://atom.io"
SRC_URI="https://github.com/atom/atom/releases/download/v${PV}/atom.x86_64.rpm -> ${P}.x86_64.rpm"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64"
IUSE="gnome"

DEPEND=""
RDEPEND="${DEPEND}"

RESTRICT="binchecks strip"

S="${WORKDIR}/usr"

src_prepare() {
  default
  use gnome && xdg_environment_reset
}

src_unpack() {
  rpm_unpack ${P}.x86_64.rpm
}

src_install() {
  cp -r "${S}"  "${D}" || die "Install failed!"
}

pkg_preinst() {
  use gnome && gnome2_icon_savelist
}

pkg_postinst() {
  use gnome && gnome2_icon_cache_update
  use gnome && xdg_desktop_database_update
  use gnome && xdg_mimeinfo_database_update
}

pkg_postrm() {
  use gnome && gnome2_icon_cache_update
  use gnome && xdg_desktop_database_update
  use gnome && xdg_mimeinfo_database_update
}
