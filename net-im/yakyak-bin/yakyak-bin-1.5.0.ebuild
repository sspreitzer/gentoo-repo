# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit rpm gnome2-utils xdg-utils

DESCRIPTION="Desktop chat client for Google Hangouts"
HOMEPAGE="https://github.com/yakyak/yakyak"
SRC_URI="https://github.com/yakyak/yakyak/releases/download/v${PV}/yakyak-${PV}-linux-x86_64.rpm"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64"
IUSE="gnome"

DEPEND=""
RDEPEND="${DEPEND}"

RESTRICT="binchecks strip"

S="${WORKDIR}"

src_prepare() {
  default
  use gnome && xdg_environment_reset
}

src_unpack() {
  rpm_unpack yakyak-${PV}-linux-x86_64.rpm
}

src_install() {
  cp -r "${S}/usr"  "${D}/" || die "Install failed!"
  cp -r "${S}/opt"  "${D}/" || die "Install failed!"
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
