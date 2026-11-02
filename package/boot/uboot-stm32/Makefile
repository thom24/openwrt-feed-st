#
# Copyright (C) 2024 Bootlin
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_VERSION:=2023.10-stm32mp-r3
PKG_RELEASE:=1

PKG_SOURCE_PROTO:=git
PKG_SOURCE_URL:=https://github.com/STMicroelectronics/u-boot.git
PKG_SOURCE_VERSION:=v$(PKG_VERSION)
PKG_MIRROR_HASH:=072af60d420974eb032970b19ff9a6dd4c9e7f73e4c9497e9a470c1817ae6aec
PKG_MAINTAINER:=Thomas Richard <thomas.richard@bootlin.com>

UBOOT_USE_INTREE_DTC:=1

include $(INCLUDE_DIR)/u-boot.mk
include $(INCLUDE_DIR)/package.mk

define U-Boot/Default
  BUILD_TARGET:=stm32
  UBOOT_IMAGE:=u-boot.bin u-boot.dtb
  DEVICE_TREE:=$(1)
endef

define U-Boot/stm32mp15
  BUILD_SUBTARGET:=stm32mp1
  UBOOT_CONFIG:=stm32mp15
endef

define U-Boot/stm32mp13
  BUILD_SUBTARGET:=stm32mp1
  UBOOT_CONFIG:=stm32mp13
endef

define U-Boot/stm32mp25
  BUILD_SUBTARGET:=stm32mp2
  UBOOT_CONFIG:=stm32mp25
endef

define U-Boot/stm32mp23
  BUILD_SUBTARGET:=stm32mp2
  UBOOT_CONFIG:=stm32mp23
endef

define U-Boot/stm32mp21
  BUILD_SUBTARGET:=stm32mp2
  UBOOT_CONFIG:=stm32mp21
endef

define U-Boot/stm32mp157f-dk2
  $(call U-Boot/stm32mp15)
  NAME:=STM32MP157F-DK2
endef

define U-Boot/stm32mp135f-dk
  $(call U-Boot/stm32mp13)
  NAME:=STM32MP135F-DK
endef

define U-Boot/stm32mp257f-ev1
  $(call U-Boot/stm32mp25)
  NAME:=STM32MP257F-EV1
endef

define U-Boot/stm32mp257f-dk
  $(call U-Boot/stm32mp25)
  NAME:=STM32MP257F-DK
endef

define U-Boot/stm32mp257f-dk
  $(call U-Boot/stm32mp25)
  NAME:=STM32MP257F-DK
endef

define U-Boot/stm32mp235f-dk
  $(call U-Boot/stm32mp23)
  NAME:=STM32MP235F-DK
endef

define U-Boot/stm32mp215f-dk
  $(call U-Boot/stm32mp21)
  NAME:=STM32MP215F-DK
endef

UBOOT_TARGETS := \
	stm32mp157f-dk2 \
	stm32mp135f-dk \
	stm32mp257f-ev1 \
	stm32mp257f-dk \
	stm32mp235f-dk \
	stm32mp215f-dk

UBOOT_MAKE_FLAGS += DEVICE_TREE=$(DEVICE_TREE)

define Build/InstallDev
	$(INSTALL_DIR) $(STAGING_DIR_IMAGE)
	$(foreach img,$(UBOOT_IMAGE), \
		$(CP) $(PKG_BUILD_DIR)/$(img) $(STAGING_DIR_IMAGE)/$(BUILD_VARIANT)-$(img); \
	)
endef

define Package/u-boot/install/default
endef

$(eval $(call BuildPackage/U-Boot))
