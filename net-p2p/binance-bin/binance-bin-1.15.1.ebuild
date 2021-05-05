# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit rpm xdg-utils

DESCRIPTION="Binance Desktop Application"
HOMEPAGE="https://binance.com"
SRC_URI="https://github.com/binance/desktop/releases/download/v${PV}/binance-${PV}-x86_64-linux.rpm -> ${P}-x86_64-linux.rpm"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

RESTRICT="mirror strip"

S="${WORKDIR}"

src_prepare() {
  default
  xdg_environment_reset
}

src_unpack() {
  rpm_unpack ${P}-x86_64-linux.rpm
}

src_install() {
  cp -r "${S}/opt"  "${D}/opt" || die "Install failed!"
  cp -r "${S}/usr"  "${D}/usr" || die "Install failed!"
  dosym /opt/Binance/binance /usr/bin/binance
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
