# See /LICENSE for more information.
# This is free software, licensed under the GNU General Public License v2.
# Copyright (C) 2024 nosignal

include $(TOPDIR)/rules.mk

PKG_MAINTAINER:=nosignal
PKG_NAME:=luci-app-neko
PKG_VERSION:=1.0-beta

LUCI_TITLE:=LuCI NekoClash
LUCI_DEPENDS:=+kmod-tun +bash
LUCI_PKGARCH:=all
LUCI_DESCRIPTION:=LuCI App NekoClash

include $(TOPDIR)/feeds/luci/luci.mk

define Build/Prepare
	mkdir -p $(PKG_BUILD_DIR)
	$(INSTALL_DIR) $(1)/etc
	$(INSTALL_BIN) postinst $(1)/etc/neko/postinst
endef

define Package/$(PKG_NAME)/install
  $(INSTALL_DIR) $(1)/usr/bin
endef

define Package/$(PKG_NAME)/postinst
	chmod +x $(1)/etc/neko/postinst
	$(1)/etc/neko/postinst
endef

define Package/$(PKG_NAME)/postrm
#!/bin/sh
	rm -rf /etc/neko
	rm -rf /etc/config/neko
	rm -rf /etc/init.d/neko
	rm -rf /www/nekoclash
	exit 0
endef
# call BuildPackage - OpenWrt buildroot signature
