# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

DESCRIPTION="Build Automated Machine Images"
HOMEPAGE="https://www.packer.io/"
SRC_URI="https://releases.hashicorp.com/packer/${PV}/packer_${PV}_linux_amd64.zip"

LICENSE="MPL2"
SLOT="0"
KEYWORDS="amd64"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""

RESTRICT="binchecks strip"

S="${WORKDIR}"

src_install() {
  dobin packer
}
