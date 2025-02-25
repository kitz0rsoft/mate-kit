# Distributed under the terms of the GNU General Public License v2

EAPI=7

MATE_LA_PUNT="yes"

inherit mate

DESCRIPTION="The MATE Desktop configuration tool"
LICENSE="FDL-1.1+ GPL-2+ LGPL-2+ LGPL-2.1+ HPND"
SLOT="0"
KEYWORDS="*"

IUSE="accountsservice appindicator debug nls"

COMMON_DEPEND="
	>=app-accessibility/at-spi2-core-2.36.0:2
	>=dev-libs/glib-2.50:2
	>=dev-libs/libxml2-2.10.4:2
	>=gnome-base/dconf-0.13.4
	>=gnome-base/librsvg-2.0:2
	>=mate-base/libmatekbd-1.26.0
	>=mate-base/mate-desktop-1.26.0
	>=mate-base/caja-1.26.0
	>=mate-base/mate-menus-1.26.0
	>=media-libs/fontconfig-1:1.0
	media-libs/freetype:2
	media-libs/libcanberra:0[gtk3]
	sys-auth/polkit[introspection]
	x11-apps/xmodmap
	x11-libs/cairo
	x11-libs/gdk-pixbuf:2
	>=x11-libs/gtk+-3.22:3
	x11-libs/libX11
	x11-libs/libXScrnSaver
	x11-libs/libXcursor
	x11-libs/libXext
	>=x11-libs/libXi-1.5
	x11-libs/libXrandr
	x11-libs/libXrender
	>=x11-libs/libxklavier-4
	x11-libs/pango
	>=x11-wm/marco-1.26.0:=
	accountsservice? ( sys-apps/accountsservice )
	appindicator? ( dev-libs/libayatana-appindicator )
"

RDEPEND="${COMMON_DEPEND}"

BDEPEND="${COMMON_DEPEND}
	app-text/yelp-tools
	dev-util/desktop-file-utils
	dev-util/glib-utils
	>=sys-devel/gettext-0.19.8
	x11-base/xorg-proto
	virtual/pkgconfig
"

PATCHES=(
	# https://github.com/mate-desktop/mate-control-center/issues/701
	"${FILESDIR}"/${PN}-1.26.0-ayatana-detection.patch
)

src_configure() {
	mate_src_configure \
		--disable-update-mimedb \
		$(use_enable appindicator) \
		$(use_enable nls) \
		$(use_enable debug)
}
