# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit gnome2 git-r3

DESCRIPTION="Numix Project cursor icon theme"
HOMEPAGE="http://numixproject.org"
SRC_URI=""

EGIT_REPO_URI="https://github.com/numixproject/numix-cursor-theme.git"

LICENSE="GPLv3"
SLOT="0"
KEYWORDS=""
IUSE=""

DEPEND="app-shells/bash
        media-gfx/inkscape
        x11-apps/xcursorgen"
RDEPEND="${DEPEND}"

RESTRICT="binchecks strip"

src_configure() { true; }

src_compile() {
  bash ./build.sh
  gnome2_src_compile
}

src_install() {
  dodoc README.md
  dodoc LICENSE
  mkdir -p ${D}/usr/share/icons
  cp -r ${S}/Numix-Cursor ${D}/usr/share/icons/
  cp -r ${S}/Numix-Cursor-Light ${D}/usr/share/icons/
}

pkg_preinst() { gnome2_icon_savelist; }
pkg_postinst() { gnome2_icon_cache_update; }
pkg_postrm() { gnome2_icon_cache_update; }
