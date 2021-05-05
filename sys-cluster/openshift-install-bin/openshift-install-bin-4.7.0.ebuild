# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7

VTAG="2021-04-11-124433"

DESCRIPTION="The Community Distribution of Kubernetes that powers Red Hat OpenShift"
HOMEPAGE="https://www.okd.io"
SRC_URI="https://github.com/openshift/okd/releases/download/${PV}-0.okd-${VTAG}/openshift-install-linux-${PV}-0.okd-${VTAG}.tar.gz"
LICENSE="Apache-2.0"
SLOT="4"
KEYWORDS="amd64"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

RESTRICT="binchecks strip"

S="${WORKDIR}"

src_install() {
	dobin openshift-install
	dodoc README.md
}
