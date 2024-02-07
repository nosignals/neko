# See /LICENSE for more information.
# This is free software, licensed under the GNU General Public License v3.
# Copyright (C) 2024 nosignal

include $(TOPDIR)/rules.mk

PKG_MAINTAINER:=nosignal <https://github.com/nosignals/neko>
PKG_NAME:=luci-app-neko
PKG_VERSION:=1.1.8-beta

PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)

define Package/$(PKG_NAME)
	CATEGORY:=LuCI
	SUBMENU:=3. Applications
	TITLE:=LuCI support for mihomo
	PKGARCH:=all
	DEPENDS:=+kmod-tun +bash +curl
endef

define Package/$(PKG_NAME)/description
    A LuCI support for mihomo
endef

include $(INCLUDE_DIR)/package.mk

define Build/Prepare
	mkdir -p $(PKG_BUILD_DIR)
	$(CP) $(CURDIR)/root $(PKG_BUILD_DIR)
	$(CP) $(CURDIR)/luasrc $(PKG_BUILD_DIR)
	$(CP) $(CURDIR)/htdocs $(PKG_BUILD_DIR)
	chmod 0755 $(PKG_BUILD_DIR)/root/etc/init.d/neko
	chmod 0755 $(PKG_BUILD_DIR)/root/etc/neko/core/*
	chmod 0755 $(PKG_BUILD_DIR)/root/etc/uci-defaults/99_neko
	sed -i "s/0.0.0-beta/$(PKG_VERSION)/g" $(PKG_BUILD_DIR)/root/etc/neko/core/neko
endef

define Build/Configure
endef

define Build/Compile
endef

define Package/$(PKG_NAME)/preinst
#!/bin/sh
	if [ -f "/etc/config/neko" ]; then
		cp -f "/etc/config/openclash" "/tmp/neko.bak"
		cp -rf "/etc/neko" "/tmp/neko"

		rm -rf /etc/neko/core/*
		rm -rf /www/nekoclash/
	fi
	exit 0
endef

define Package/$(PKG_NAME)/postinst
#!/bin/sh
	if [ -f "/tmp/neko.bak" ]; then
		cp -rf "/tmp/neko/core/mihomo" "/tmp/neko/core/mihomo"
		cp -rf "/tmp/neko/geoip.metadb" "/tmp/neko/geoip.metadb"
		cp -rf "/tmp/neko/geosite.db" "/tmp/neko/geosite.db"
	fi
	exit 0
endef

define Package/$(PKG_NAME)/prerm
#!/bin/sh
	uci set neko.cfg.enabled='0'
	uci set neko.cfg.php_server='0'
	uci commit neko
	
	cp -rf "/etc/neko/" "/tmp/neko/"
	cp -rf "/www/nekoclash/" "/tmp/neko/nekoclash/"
	exit 0
endef

define Package/$(PKG_NAME)/postrm
#!/bin/sh
	rm -rf /etc/neko/
	rm -rf /www/nekoclash/
	exit 0
endef

define Package/$(PKG_NAME)/install
	$(INSTALL_DIR) $(1)/etc/neko
	$(INSTALL_DIR) $(1)/usr/lib/lua/luci
	$(CP) $(PKG_BUILD_DIR)/root/* $(1)/
	$(CP) $(PKG_BUILD_DIR)/luasrc/* $(1)/usr/lib/lua/luci/
	$(CP) $(PKG_BUILD_DIR)/htdocs/* $(1)/www/
endef

$(eval $(call BuildPackage,$(PKG_NAME)))