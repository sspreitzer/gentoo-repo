# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

DESCRIPTION="Write, Plan, and Create Infrastructure as Code"
HOMEPAGE="https://www.terraform.io/"
SRC_URI="https://releases.hashicorp.com/terraform/${PV}/terraform_${PV}_linux_amd64.zip"

LICENSE="MPL-2.0"
SLOT="0"
KEYWORDS="amd64"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

RESTRICT="binchecks strip"

S="${WORKDIR}"

src_install() {
  dobin terraform
}
