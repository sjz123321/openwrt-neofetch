# This is free software, licensed under the GNU General Public License v3.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=neofetch
PKG_VERSION:=v1.0
PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)-$(PKG_VERSION)
include $(INCLUDE_DIR)/package.mk

define Package/$(PKG_NAME)
	SECTION:=Utilities
	CATEGORY:=Utilities
	TITLE:=Neofetch for openwrt
	DEPENDS:=+bash
	URL:=https://github.com/sjz123321/openwrt-neofetch
endef

define Package/$(PKG_NAME)/config
endef

define Package/$(PKG_NAME)/description
Displays information about your OS
endef

define Build/Prepare
	if [ -n `ls $(PKG_BUILD_DIR)/shadowtunnel-$(PKG_VERSION)/$(PKG_VERSION)/neofetch` ] 
	then 
		cd $(PKG_BUILD_DIR)/shadowtunnel-$(PKG_VERSION)/$(PKG_VERSION)/neofetch/
		git pull
		rm -f !(neofetch)
		chmod +x neofetch
	else
		git clone https://github.com/dylanaraps/neofetch.git $(PKG_BUILD_DIR)/shadowtunnel-$(PKG_VERSION)/$(PKG_VERSION)/neofetch
		cd $(PKG_BUILD_DIR)/shadowtunnel-$(PKG_VERSION)/$(PKG_VERSION)/neofetch/
		rm -f !(neofetch)
		chmod +x neofetch
	fi
endef

define Build/Configure
endef

define Build/Compile
endef

define Package/$(PKG_NAME)/install 
	$(INSTALL_DIR) $(1)/usr/bin/
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/ $(1)/usr/bin/
endef 

$(eval $(call BuildPackage,$(PKG_NAME)))
