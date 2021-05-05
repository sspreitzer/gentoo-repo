# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7

AV="v20180908"
AR="${PR//r/M}"

DESCRIPTION="The Eclipse-based LDAP browser and directory client"
HOMEPAGE="https://directory.apache.org/studio/"
SRC_URI="https://mirror.init7.net/apache/directory/studio/${PV}.${AV}-${AR}/ApacheDirectoryStudio-${PV}.${AV}-${AR}-linux.gtk.x86_64.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="amd64"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND} virtual/jdk"

RESTRICT="binchecks strip"

S="${WORKDIR}/ApacheDirectoryStudio"

src_install() {
  dodir /opt/ApacheDirectoryStudio
  cp -r "${S}" "${D}/opt" || die "Install failed!"
}
