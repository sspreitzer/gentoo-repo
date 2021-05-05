# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit xdg-utils

AV="v20200411"
AR="${PR//r/M}"

DESCRIPTION="The Eclipse-based LDAP browser and directory client"
HOMEPAGE="https://directory.apache.org/studio/"
SRC_URI="https://mirror.init7.net/apache/directory/studio/${PV}.${AV}-${AR}/ApacheDirectoryStudio-${PV}.${AV}-${AR}-linux.gtk.x86_64.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="amd64"
IUSE="gnome"

DEPEND=""
RDEPEND="${DEPEND} virtual/jdk gnome? ( gnome-base/gnome )"

RESTRICT="binchecks strip"

S="${WORKDIR}/ApacheDirectoryStudio"

src_install() {
  dodir /opt/ApacheDirectoryStudio
  cp -r "${S}" "${D}/opt" || die "Install failed!"
  dodir /usr/share/applications
  cat >> "${D}//usr/share/applications/ApacheDirectoryStudio.desktop" <<EOF
[Desktop Entry]
Name=Apache Directory Studio
Exec=/opt/ApacheDirectoryStudio/ApacheDirectoryStudio
Icon=/opt/ApacheDirectoryStudio/icon.xpm
Type=Application
Comment=LDAP-browser
EOF
}

pkg_postinst() {
  use gnome && xdg_desktop_database_update
}

pkg_postrm() {
  use gnome && xdg_desktop_database_update
}

