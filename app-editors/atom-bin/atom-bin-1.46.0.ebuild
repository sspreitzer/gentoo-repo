# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit rpm xdg-utils

DESCRIPTION="A hackable text editor for the 21st Century"
HOMEPAGE="https://atom.io"
SRC_URI="https://github.com/atom/atom/releases/download/v${PV}/atom.x86_64.rpm -> ${P}.x86_64.rpm"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

RESTRICT="mirror strip"

S="${WORKDIR}/usr"

src_prepare() {
  default
  xdg_environment_reset
}

src_unpack() {
  rpm_unpack ${P}.x86_64.rpm
}

src_install() {
  cp -r "${S}"  "${D}" || die "Install failed!"
}

pkg_postinst() {
  xdg_icon_cache_update
  xdg_desktop_database_update
  xdg_mimeinfo_database_update
}

pkg_postrm() {
  xdg_icon_cache_update
  xdg_desktop_database_update
  xdg_mimeinfo_database_update
}
