include $(TOPDIR)/rules.mk
include $(INCLUDE_DIR)/kernel.mk

PKG_NAME:=edge-lkm
PKG_RELEASE=1
PKG_LICENSE:=GPL-2.0-only

PKG_SOURCE_URL:=https://github.com/STMicroelectronics/tttech-tsn-swch-content.git
PKG_SOURCE_PROTO:=git
PKG_SOURCE_DATE:=2024-06-13
PKG_SOURCE_VERSION:=c7fcfd8106c9de97cccf4ec8bcbbb541c6cf694e
PKG_MIRROR_HASH:=638f738cf97625d3d04a09fe0002df5d17ed3831539021e2497dfb4ed6496ac2

PKG_MAINTAINER:=Thomas Richard <thomas.richard@bootlin.com>

include $(INCLUDE_DIR)/package.mk

define KernelPackage/edge-lkm
  TITLE:=EDGE Kernel Driver Modules
  SUBMENU:=Network Devices
  FILES:= $(PKG_BUILD_DIR)/tsn_sw_base.edge-lkm/edgx_pfm_lkm.ko
endef

define Build/Compile
	+$(KERNEL_MAKE) $(PKG_JOBS) \
		M="$(PKG_BUILD_DIR)/tsn_sw_base.edge-lkm" \
		modules
endef

define Build/Install
endef

$(eval $(call KernelPackage,edge-lkm))

