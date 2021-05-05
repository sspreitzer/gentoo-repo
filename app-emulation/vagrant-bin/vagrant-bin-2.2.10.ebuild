# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit rpm

DESCRIPTION="A tool for building and distributing development environments"
HOMEPAGE="https://www.vagrantup.com/"
SRC_URI="https://releases.hashicorp.com/vagrant/${PV}/vagrant_${PV}_x86_64.rpm"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

RESTRICT="binchecks strip mirror"

S="${WORKDIR}"

src_install() {
  cp -R "${S}/opt" "${D}/" || die "Install failed!"
  cp -R "${S}/usr" "${D}/" || die "Install failed!"
}
