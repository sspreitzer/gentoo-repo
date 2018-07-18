# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit gnome2 git-r3

DESCRIPTION="Numix Project icon theme"
HOMEPAGE="http://numixproject.org"
SRC_URI=""

EGIT_REPO_URI="https://github.com/numixproject/numix-icon-theme.git"

LICENSE="GPLv3"
SLOT="0"
KEYWORDS=""
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
         x11-themes/gnome-themes-standard
         x11-themes/hicolor-icon-theme"

RESTRICT="binchecks strip"

src_prepare() {
  eapply_user
  find ${S} -type f -executable -exec chmod -x {} \;
  gnome2_src_prepare
}

src_configure() { true; }

src_install() {
  dodoc readme.md
  dodoc license
  mkdir -p ${D}/usr/share/icons
  cp -r ${S}/Numix ${D}/usr/share/icons/
  cp -r ${S}/Numix-Light ${D}/usr/share/icons/
}

pkg_preinst() { gnome2_icon_savelist; }
pkg_postinst() { gnome2_icon_cache_update; }
pkg_postrm() { gnome2_icon_cache_update; }
