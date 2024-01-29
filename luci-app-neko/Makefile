# See /LICENSE for more information.
# This is free software, licensed under the GNU General Public License v2.
# Copyright (C) 2024 nosignal

include $(TOPDIR)/rules.mk

PKG_MAINTAINER:=nosignal
PKG_NAME:=luci-app-neko
PKG_VERSION:=1.1.2-beta

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

define Package/$(PKG_NAME)/prerm
#!/bin/sh
	uci set neko.cfg.enabled='0'
	uci commit neko
	cp -rf "/etc/neko" "/tmp/neko"
	cp -rf "/etc/config/neko" "/tmp/neko"
	cp -rf "/etc/init.d/neko" "/tmp/neko"
	cp -rf "/www/nekoclash" "/tmp/neko"
	exit 0
endef

define Package/$(PKG_NAME)/postrm
#!/bin/sh
	rm -rf /tmp/neko
	exit 0
endef
# call BuildPackage - OpenWrt buildroot signature
