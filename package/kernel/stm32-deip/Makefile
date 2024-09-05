include $(TOPDIR)/rules.mk
include $(INCLUDE_DIR)/kernel.mk

PKG_NAME:=stm32-deip
PKG_RELEASE=1
PKG_LICENSE:=GPL-2.0-only

PKG_SOURCE_URL:=https://github.com/STMicroelectronics/tttech-tsn-swch-content.git
PKG_SOURCE_PROTO:=git
PKG_SOURCE_DATE:=2024-06-13
PKG_SOURCE_VERSION:=c7fcfd8106c9de97cccf4ec8bcbbb541c6cf694e
PKG_MIRROR_HASH:=638f738cf97625d3d04a09fe0002df5d17ed3831539021e2497dfb4ed6496ac2

PKG_MAINTAINER:=Thomas Richard <thomas.richard@bootlin.com>

include $(INCLUDE_DIR)/package.mk

define KernelPackage/stm32-deip
  TITLE:=STM32 switch glue layer
  SUBMENU:=Network Devices
  FILES:= $(PKG_BUILD_DIR)/st.stm32-deip/stm32_deip.ko
endef

define Build/Compile
	+$(KERNEL_MAKE) $(PKG_JOBS) \
		$(PKG_MAKE_FLAGS) \
		M="$(PKG_BUILD_DIR)/st.stm32-deip" \
		modules
endef

define Build/Install
endef

$(eval $(call KernelPackage,stm32-deip))

