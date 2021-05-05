# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit rpm

DESCRIPTION="A hackable text editor for the 21st Century"
HOMEPAGE="https://nordvpn.com"
SRC_URI="https://repo.nordvpn.com/yum/nordvpn/centos/x86_64/Packages/n/nordvpn-${PV}-${PR//r}.x86_64.rpm"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64"
IUSE="systemd no_nordvpn_sbinip_fix"

DEPEND="net-firewall/iptables dev-libs/libxslt"
RDEPEND="${DEPEND}"

RESTRICT="binchecks strip"

S="${WORKDIR}"

src_install() {
  cp -r "${S}/etc"  "${D}" || die "Install failed!"
  cp -r "${S}/usr"  "${D}" || die "Install failed!"
  cp -r "${S}/var"  "${D}" || die "Install failed!"
  if ! use no_nordvpn_sbinip_fix; then
    dodir /sbin
    ln -s /bin/ip "${D}/sbin/ip"
  fi
}

pkg_postinst() {
  if use systemd; then
    systemctl -q daemon-reload
	systemctl -q enable nordvpnd.socket
	systemctl -q enable nordvpnd.service
	systemctl -q start nordvpnd.socket
	systemctl -q start nordvpnd.service
  else
    update-rc.d nordvpn defaults &>/dev/null || :
	/etc/init.d/nordvpn restart &>/dev/null || :
  fi
}

pkg_prerm() {
  if use systemd; then
    systemctl -q stop nordvpnd.service
    systemctl -q stop nordvpnd.socket
    systemctl -q disable nordvpnd.service
    systemctl -q disable nordvpnd.socket
    systemctl -q daemon-reload
  else
    /etc/init.d/nordvpn stop &>/dev/null || :
	update-rc.d -f nordvpn remove &>/dev/null || :
  fi
}

pkg_postrm() {
  ewarn "It is recommended you delete the following folders/files:"
  ewarn "- /root/.config/nordvpn"
  ewarn "- {HOMEPATH}/*/.config/nordvpn"
  ewarn "- /var/log/nordvpn"
}
