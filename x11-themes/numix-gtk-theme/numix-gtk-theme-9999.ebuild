# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit gnome2 git-r3

DESCRIPTION="Numix Project GTK theme"
HOMEPAGE="http://numixproject.org"
SRC_URI=""

EGIT_REPO_URI="https://github.com/numixproject/numix-gtk-theme.git"

LICENSE="GPLv3"
SLOT="0"
KEYWORDS=""
IUSE=""

DEPEND="x11-libs/gtk+:2
        dev-ruby/sass"
RDEPEND="${DEPEND}
         x11-themes/gtk-engines-murrine"

RESTRICT="binchecks strip"

src_prepare() {
  eapply_user
  find ${S} -type f -executable -exec chmod -x {} \;
  chmod +x scripts/utils.sh
  gnome2_src_prepare
}

src_configure() { true; }

src_compile() { true; }

src_install() {
  dodoc README.md
  dodoc LICENSE
  dodoc CREDITS
  emake install DESTDIR=${D}
}
