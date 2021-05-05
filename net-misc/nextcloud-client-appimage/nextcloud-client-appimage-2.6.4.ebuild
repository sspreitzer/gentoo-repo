# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7

DESCRIPTION="Desktop Syncing Client for Nextcloud"
HOMEPAGE="https://github.com/nextcloud/desktop"
SRC_URI="https://download.nextcloud.com/desktop/releases/Linux/Nextcloud-${PV}-x86_64.AppImage"

LICENSE="GPL-2.0"
SLOT="0"
KEYWORDS="amd64"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

RESTRICT="binchecks strip"

S="${WORKDIR}"

src_install() {
  cp ${DISTDIR}/Nextcloud-${PV}-x86_64.AppImage nextcloud
  dobin nextcloud
}
