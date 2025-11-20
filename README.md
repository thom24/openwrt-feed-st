# STMicroelectronics feed for OpenWRT

This repository is an OpenWRT feed dedicated to supporting the
[STMicroelectronics](https://www.st.com)
[STM32MP1](https://www.st.com/en/microcontrollers-microprocessors/stm32mp1-series.html)
and
[STM32MP2](https://www.st.com/en/microcontrollers-microprocessors/stm32mp2-series.html)
platforms.

Using this project is not strictly necessary as OpenWrt itself has support for
stm32 target.
But this feed integrates the [STMicroelectronics](https://www.st.com) BSP,
whereas OpenWrt uses upstream components.
And more boards are supported in the feed.

You are using the `openwrt-24.10` branch of the feed, which is based on the
OpenWrt branch `openwrt-24.10`.
Actually the feed is based on OpenWrt
[v24.10.4](https://github.com/openwrt/openwrt/tree/v24.10.4)
([Release Note](https://openwrt.org/releases/24.10/notes-24.10.4)).

## Supported devices

1. `STM32MP157F-DK2`: minimal support for the [STM32MP157F Discovery Kit 2](https://www.st.com/en/evaluation-tools/stm32mp157f-dk2.html)
   board.

2. `STM32MP157F-DK2-DEMO`: based on the `STM32MP157F-DK2` device including
   additional packages like a web interface to configure the device.

3. `STM32MP135F-DK`: minimal support for the [STM32MP135F Discovery Kit](https://www.st.com/en/evaluation-tools/stm32mp135f-dk.html)
   board.

4. `STM32MP135F-DK-DEMO`: based on the `STM32MP135F-DK` device including
   additional packages like a web interface to configure the device.

5. `STM32MP257F-EV1`: minimal support for the [STM32MP257F Evaluation](https://www.st.com/en/evaluation-tools/stm32mp257f-ev1.html)
   board.

6. `STM32MP257F-EV1-DEMO`: based on the `STM32MP257F-EV1` device including
   additional packages like a web interface to configure the device.

7. `STM32MP257F-DK`: minimal support for the [STM32MP257F Discovery Kit](https://www.st.com/en/evaluation-tools/stm32mp257f-dk.html)
   board.

8. `STM32MP257F-DK-DEMO`: based on the `STM32MP257F-DK` device including
   additional packages like a web interface to configure the device.

9. `STM32MP235F-DK`: minimal support for the [STM32MP235F Discovery Kit](https://www.st.com/en/microcontrollers-microprocessors/stm32mp235f.html)
   board. Although this board does not physically exist, it enables users to
   emulate the behavior of an `STM32MP235` system using the `STM32MP257F Discovery Kit`.
   Since the STM32MP235 implements a subset of the STM32MP257 features, this
   configuration allows developers to evaluate the STM32MP235 SoC.

10. `STM32MP235F-DK-DEMO`: based on the `STM32MP235F-DK` device including
    additional packages like a web interface to configure the device.

11. `STM32MP215F-DK`: minimal support for the [STM32MP215F Discovery Kit](https://wiki.st.com/stm32mpu/wiki/STM32MP215x-DKx_-_hardware_description)
    board.

12. `STM32MP215F-DK-DEMO`: based on the `STM32MP215F-DK` device including
    additional packages like a web interface to configure the device.


|Supported features|STM32MP157F-DK2|STM32MP135F-DK|STM32MP257F-EV1|STM32MP257F-DK|STM32MP235F-DK|STM32MP215F-DK|
|------------------|---------------|--------------|---------------|--------------|--------------|--------------|
|Sysupgrade|yes|yes|yes|yes|yes|yes|
|Ethernet|yes|yes|yes|yes|yes|yes|
|Watchdog|yes|yes|yes|yes|yes|yes|
|RTC|yes|yes|yes|yes|yes|yes|
|Hardware RNG (Optee)|yes|yes|yes|yes|yes|yes|
|LED|yes|yes|yes|yes|yes|yes|
|Button|no|yes (USER2)|yes (USER1/USER2)|yes (USER1/USER2)|yes|yes (USER1/USER2)|
|Wifi|yes|yes|x|yes|yes|x|
|USB Type-A|yes|yes|yes|yes|yes|x|
|Remote processors|no|no|yes (demo profile)|yes (demo profile)|yes (demo profile)|yes (demo profile)|
|USB Type-C|no|no|yes dual-role (demo profile)|yes dual-role (demo profile)|yes dual-role (demo profile)|yes dual-role (demo profile)|
|PCIe|x|x|yes root complex (demo profile)|x|x|x|

## BSP

This feed is based on the `STPM32MP1/STM32MP2 BSP v6.1`.

|Components|Version|
|----------|-------|
|TF-A|2.10-stm32mp-r1|
|U-Boot|2023.10-stm32mp-r1|
|OPTEE|4.0.0-stm32mp-r1|
|Linux|OpenWRT kernel + v6.6-stm32mp-r2|

For the kernel, the patches from the v6.6-stm32mp branch until the tag
v6.6-stm32mp-r2 were added.
They are available in `target/linux/stm32/patches-6.6/`.

Some patches were removed as they were applied in Linux, or they are already
applied by OpenWrt.
```
2c9b2c9cac5e ("usb: dwc2: keep the usb stack informed of SetPortFeature failure while Host")
6287f3f5f2e4 ("ASoC: stm32: spdifrx: fix dma channel release in stm32_spdifrx_remove")
8a5e18189df4 ("media: i2c: imx335: Enable regulator supplies")
c5540f6a4d9a ("nvmem: stm32: add support for STM32MP25 BSEC to control OTP data")
eb99d7c27da7 ("crypto: stm32/cryp - call finalize with bh disabled")
31286612453a ("perf list: fix arguments order issue for events printing")
fd68ca2e9089 ("i2c: stm32f7: Do not prepare/unprepare clock during runtime suspend/resume")
1d8ffe3fcfac ("ARM: dts: stm32: fix IPCC EXTI declaration on stm32mp151")
22772c87565e ("clocksource: stm32-lptimer: use wakeup capable instead of init wakeup")
6ab3278ee867 ("pinctrl: devicetree: do not goto err when probing hogs in pinctrl_dt_to_map")
10b245589fa0 ("drm: bridge: adv7511: fill i2s stream capabilities")
a1ff3250129a ("pinctrl: stm32: check devm_kasprintf() returned value")
67f10b41e33e ("drivers: core: fix device leak in __fw_devlink_relax_cycles()")
94508b3dd9f6 ("usb: dwc2: gadget: remove of_node reference upon udc_stop")
07963aca871a ("net: phy: realtek: disable PHY-mode EEE")
89e1b6a95cdf4 ("i2c: stm32f7: Use devm_clk_get_enabled()")
435fd1bcf552b ("i2c: stm32f7: use dev_err_probe upon calls of devm_request_irq")
cf32cfcc2d74e ("i2c: stm32f7: perform most of irq job in threaded handler")
2b1d2978b2b05 ("i2c: stm32f7: simplify status messages in case of errors")
6016e8616824a ("spi: stm32: Check for cfg availability in stm32_spi_probe")
2f38d4c001e8b ("mtd: rawnand: stm32_fmc2: avoid overlapping mappings on ECC buffer")
865a7b9b16b14 ("pinctrl: stm32: Manage irq affinity settings")
d9d7111f3cf5c ("i2c: stm32f7: unmap DMA mapped buffer")
55273980dc97f ("i2c: stm32: fix the device used for the DMA map")
9207b7bce2799 ("mtd: rawnand: stm32_fmc2: fix ECC overwrite")
```

Some patches had to be modified to fix some conflicts.
```
950158c37fbf ("usb: dwc2: hcd: fix power down exiting by system resume")
19458fd268c4 ("media: i2c: imx335: add control of an optional powerdown gpio")
393cf701259c ("mtd: spi-nor: add Octal DTR support for Macronix flash")
1e5eedcdaf1c ("firmware: arm_scmi: optee leverage Ocall2 thread provisioning")
9d36363eee52 ("counter: stm32-timer-cnt: add pm runtime support")
e983ec4d6702 ("pinctrl: stm32: add tristate option for stm32mp257")
a04c279efc3c ("usb: dwc3: Add support in dwc3 to handle usb-role")
b1f3318a0f09 ("ASoC: Update wm8994 codec config")
27c33fae20e0 ("pwm: stm32: lptimer: add pm_runtime support")
dd680178e937 ("counter: stm32-lptimer-cnt: add pm runtime support")
0a222d6c04c9 ("Revert "media: stm32: dcmipp: avoid calling s_stream if state already correct"")
7fdd5f74c211 ("Revert "media: v4l2-subdev: Document and enforce .s_stream() requirements"")
00925911ce6d ("nvmem: stm32: add support for non-secure mirror")
2a41a04bec3f ("arm64: dts: st: add st,stm32mp25-cortex-a7-gic in intc node in stm32mp251.dtsi")
fdfbbb333977 ("counter: stm32-lptimer-cnt: fix error handling when enabling")
d0b3f9979ae5 ("net: phy: realtek: update sequence to disable EEE for RTL8211F")
5e8186da1fa40 ("i2c: stm32f7: add support for stm32mp25 soc")
c32748b702c28 ("iio: adc: stm32: add support for stm32mp25")
d247bababb186 ("net: stmmac: add possibility to use ptp external time")
babfc9ba63a0f ("dmaengine: stm32: New directory for STM32 DMA controllers drivers")
c2ab7c5deab4f ("Revert "net: phy: smsc: add WoL support to LAN8740/LAN8742 PHYs"")
6068e745fc3b5 ("i2c: stm32f7: support i2c_*_dma_safe_msg_buf APIs")
79f24c8b193bf ("usb: dwc2: gadget: enable the gadget as wakeup source")
```

Following patches were not applied due to conflicts. They corresponds to the
empty patches in `target/linux/stm32/patches-6.6/`. They could be applied in the
future if needed.
```
426e1c78e4c1 ("drm/stm: ltdc: set transparency after plane disable")
8d235ec212fa ("drm/stm: ltdc: support of rotation on crtc output")
89f5b97c79ac ("drm/stm: ltdc: add support of plane upscaling")
326eea71a0e4 ("drm/stm: ltdc: refactor interrupt management")
c4ffda2683bb ("drm/stm: ltdc: set color look-up table for each plane")
4909e4745e9c ("drm/stm: ltdc: refactor crtc start sequence")
a3f784f44512 ("drm/stm: ltdc: remove encoder helper functions")
c273a5bad2aa ("drm/stm: ltdc: add lvds clock")
6a508bd6b305 ("drm/stm: refactor probe sequence")
b90306b377d3 ("drm/stm: ltdc:  add property default-on")
66d934a13b5c ("drm/stm: ltdc: move mode valid & fixup to encoder helper functions")
e40cd2b4b75b ("drm/stm: ltdc: Check rotation buffer length")
3d63eeb9313b ("drm/stm: ltdc: Check panel width")
1102333ad31b ("drm/stm: ltdc: set default parent of pixel clock")
1bc5bac55257 ("drm/stm: support of new hardware version for soc MP21")
dc9d876018c6 ("drm/stm: ltdc: Check the security of layer 2.")
73c7bd933066 ("drm/stm: ltdc: remove mode_set_nofb callback")
759efa7b4959 ("drm/stm: ltdc: add plane_atomic_enable callback")
73cc2db18231 ("drm/stm: ltdc: replace pm_runtime_get_sync by pm_runtime_resume_and_get")
662800081ef7 ("drm/stm: ltdc: flush remaining vblank event")
6e8b50d319c9 ("drm/stm: ltdc: Check the security of layer 3.")
3682d604ecbd ("drm/stm: ltdc: reset ltdc on crtc enable")
bba33e9f0619 ("drm/stm: ltdc: set clock parent before set rate")
247114342fd4 ("drm/stm: ltdc: ckeck pm_runtime status")
634d4d01d037 ("drm/stm: ltdc: add clock tolerance module parameter")
cf2f1b885568 ("drm/stm: ltdc: set configuration register masks to 12 bits")
a825a4c45283 ("drm/stm: ltdc: check the secure layer")
```

## Starter Package

If you want to use OpenWrt on STM32MPU platforms without building everything
yourself from source, we provide a Starter Package which contains:

* The prebuilt factory and sysupgrade images for all profiles. Refer to the [flash
  and boot section](#Flashing-and-booting-the-system) to learn how to
  use the pre-built images.

* A Software Development Kit (SDK) that allows you to build and package
  applications for the target.

* An Image Builder that allows you to create custom images without the need
  for compiling them from source. It downloads pre-compiled packages and
  integrates them in a single flashable image.

* A build info file that contains the configuration used to build the Starter
  Package.

* A feed info file that contains the feed configuration used to build the Starter
  Package.

* A Software Bill of Materials (SBOM).

* A target repository (contains kmods and target-specific packages) that allows
  to install additional packages on the device.

* A ST repository that contains packages (non target-specific) from ST feed.

The following table provides links to all these artifacts, compiled with the
latest `openstlinux-6.6-openwrt-24.10.2-mpu-v25.06.11` release.

| Starter Package | stm32mp1 | stm32mp2 |
|-----------------|----------|----------|
| Factory images | [URL](https://bootlin.com/pub/openwrt-st/openstlinux-6.6-openwrt-24.10.2-mpu-v25.06.11/openwrt-stm32-stm32mp1-factory-images.tar.gz) | [URL](https://bootlin.com/pub/openwrt-st/openstlinux-6.6-openwrt-24.10.2-mpu-v25.06.11/openwrt-stm32-stm32mp2-factory-images.tar.gz) |
| Sysupgrade images | [URL](https://bootlin.com/pub/openwrt-st/openstlinux-6.6-openwrt-24.10.2-mpu-v25.06.11/openwrt-stm32-stm32mp1-sysupgrade-images.tar.gz) | [URL](https://bootlin.com/pub/openwrt-st/openstlinux-6.6-openwrt-24.10.2-mpu-v25.06.11/openwrt-stm32-stm32mp2-sysupgrade-images.tar.gz) |
| SDK | [URL](https://bootlin.com/pub/openwrt-st/openstlinux-6.6-openwrt-24.10.2-mpu-v25.06.11/openwrt-sdk-stm32-stm32mp1.Linux-x86_64.tar.zst) | [URL](https://bootlin.com/pub/openwrt-st/openstlinux-6.6-openwrt-24.10.2-mpu-v25.06.11/openwrt-sdk-stm32-stm32mp2.Linux-x86_64.tar.zst) |
| Image Buider | [URL](https://bootlin.com/pub/openwrt-st/openstlinux-6.6-openwrt-24.10.2-mpu-v25.06.11/openwrt-imagebuilder-stm32-stm32mp1.Linux-x86_64.tar.zst) | [URL](https://bootlin.com/pub/openwrt-st/openstlinux-6.6-openwrt-24.10.2-mpu-v25.06.11/openwrt-imagebuilder-stm32-stm32mp2.Linux-x86_64.tar.zst) |
| Build info | [URL](https://bootlin.com/pub/openwrt-st/openstlinux-6.6-openwrt-24.10.2-mpu-v25.06.11/config-stm32-stm32mp1.buildinfo) | [URL](https://bootlin.com/pub/openwrt-st/openstlinux-6.6-openwrt-24.10.2-mpu-v25.06.11/config-stm32-stm32mp2.buildinfo) |
| Feed info | [URL](https://bootlin.com/pub/openwrt-st/openstlinux-6.6-openwrt-24.10.2-mpu-v25.06.11/feeds-stm32-stm32mp1.buildinfo) | [URL](https://bootlin.com/pub/openwrt-st/openstlinux-6.6-openwrt-24.10.2-mpu-v25.06.11/feeds-stm32-stm32mp2.buildinfo) |
| SBOM | [URL](https://bootlin.com/pub/openwrt-st/openstlinux-6.6-openwrt-24.10.2-mpu-v25.06.11/openwrt-stm32-stm32mp1.bom.cdx.json) | [URL](https://bootlin.com/pub/openwrt-st/openstlinux-6.6-openwrt-24.10.2-mpu-v25.06.11/openwrt-stm32-stm32mp2.bom.cdx.json) |
| target repository | [URL](https://bootlin.com/pub/openwrt-st/openstlinux-6.6-openwrt-24.10.2-mpu-v25.06.11/openwrt-stm32-stm32mp1-target-repository.tar.gz) | [URL](https://bootlin.com/pub/openwrt-st/openstlinux-6.6-openwrt-24.10.2-mpu-v25.06.11/openwrt-stm32-stm32mp2-target-repository.tar.gz) |
| ST repository | [URL](https://bootlin.com/pub/openwrt-st/openstlinux-6.6-openwrt-24.10.2-mpu-v25.06.11/openwrt-stm32-stm32mp1-st-repository.tar.gz) | [URL](https://bootlin.com/pub/openwrt-st/openstlinux-6.6-openwrt-24.10.2-mpu-v25.06.11/openwrt-stm32-stm32mp2-st-repository.tar.gz) |

## Getting started

### Pre-requisites

In order to use [OpenWRT](https://openwrt.org/), you need to have a Linux or
Unix like distribution installed on your workstation.
And you need to install a set of packages as described in the
[OpenWRT Build system setup](https://openwrt.org/docs/guide-developer/toolchain/install-buildsystem).

### Getting the code

The feed is designed to work with the `openwrt-24.10` branch of OpenWRT (last
tested commit is [v24.10.4](https://github.com/openwrt/openwrt/tree/v24.10.4)).

```bash
$ git clone https://git.openwrt.org/openwrt/openwrt.git
$ cd openwrt
$ git checkout v24.10.4
```

Next step is to add the [STMicroelectronics](https://www.st.com) feed in the
`feeds.conf.default` file.

```bash
$ cat feeds.conf.default
src-git st https://github.com/bootlin/openwrt-feed-st.git
src-git packages https://git.openwrt.org/feed/packages.git
src-git luci https://git.openwrt.org/project/luci.git
src-git routing https://git.openwrt.org/feed/routing.git
src-git telephony https://git.openwrt.org/feed/telephony.git
#src-git video https://github.com/openwrt/video.git
#src-git targets https://github.com/openwrt/targets.git
#src-git oldpackages http://git.openwrt.org/packages.git
#src-link custom /usr/src/openwrt/custom-feed
```

Then fetch the code of all feeds

```bash
$ ./scripts/feeds update -a
```

### Install the feeds

Install stm32 target

```bash
$ ./scripts/feeds install -f stm32
```

Install all other packages

```bash
$ ./scripts/feeds install -a -f
```
(Some overriding warnings can occur, if you used `-f` please ignore them).

### Configure and build

Run `make menuconfig`

```bash
$ make menuconfig
```

Then select `STMicroelectronics STM32` for the `Target System`, `STM32MP1` or
`STM32MP2` for the `Subtarget`, and select the `Target Profile` corresponding to
your hardware (for example `STMicroelectronics STM32MP135F-DK`).

Then to start the build.

```bash
$ make -j$(nproc)
```

## Flashing and booting the system

All images generated for are stored in `bin/targets/stm32/stm32mp1/` for
subtarget `stm32mp1` and in `bin/targets/stm32/stm32mp2/` for subtarget
`stm32mp2`.
The images to flash on the SDCard are
`openwrt-stm32-stm32mpX-stm32mpXXXXX-ext4-factory.img.gz`.

```bash
$ gzip -d -c bin/targets/stm32/stm32mp1/openwrt-stm32-stm32mp1-stm32mp135f-dk-ext4-factory.img.gz | dd of=/dev/sdX
```
(Note: this assumes your SD card appears as `/dev/sdX` on your system.)

Then:

1. Insert the microSD card
   - STM32MP157: connector CN15
   - STM32MP135: connector CN3
   - STM32MP257-EV1: connector CN1
   - STM32MP257-DK and STM32MP235-DK: connector CN6
   - STM32MP215-DK: connector CN7

2. Plug a micro-USB cable or USB-C for `STM32MP257` and run your serial
   communication program on /dev/ttyACM0
   - STM32MP157: connector CN11
   - STM32MP135: connector CN10

3. Configure the SW1 switch to boot on SD card
   - STM32MP157: BOOT0 and BOOT2 to ON
   - STM32MP135: BOOT0 to ON, BOOT1 to OFF, BOOT2 to ON
   - STM32MP257: BOOT0 to ON, BOOT1 and BOOT2 and BOOT3 to OFF

4. Plug a USB-C cable or Barrel cable for `STM32MP257` to power-up the board.
   - STM32MP157: connector CN6
   - STM32MP135: connector CN12
   - STM32MP257: connector CN20

5. The system will start, with the console on UART. The default user is root
   with no password. The login is automatic.

Note that `STM32MP257` can be powered using the USB-C (CN21) if the jumper JP4
is set to the positioin [2-3].

```
BusyBox v1.36.1 (2024-02-14 15:44:53 UTC) built-in shell (ash)

  _______                     ________        __
 |       |.-----.-----.-----.|  |  |  |.----.|  |_
 |   -   ||  _  |  -__|     ||  |  |  ||   _||   _|
 |_______||   __|_____|__|__||________||__|  |____|
          |__| W I R E L E S S   F R E E D O M
 -----------------------------------------------------
 OpenWrt SNAPSHOT, r24943+13-3a073a0212
 -----------------------------------------------------
=== WARNING! =====================================
There is no root password defined on this device!
Use the "passwd" command to set up a new password
in order to prevent unauthorized SSH logins.
--------------------------------------------------
root@OpenWrt:/#
```

## Additional informations

This chapter contains some informations which are specific to the stm32 target.
For the generic informations, please refer to the [Official OpenWRT
documentation](https://openwrt.org/docs/guide-user/start).

### Ethernet

The configuration of Ethernet interfaces is the default OpenWRT configuration:

- `STM32MP157F-DK2`: `lan` interface
- `STM32MP135F-DK`: `lan` interface (`ETH1`) and `wan` interface (`ETH2`)
- `STM32MP257-EV1`: `lan` interface (`ETH1`) and `wan` interface (`ETH2`)
- `STM32MP257F-DK`: `lan` interface

The `lan` interface is configured with a static ip address 192.168.1.1 and a
dhcp server is running.  
The `wan` interface is in dhcp mode.  
By default the management protocols are only accessible from the lan interface.

### System upgrade

For a system upgrade, an upgrade image shall be used (image labelled
...-sysupgrade.img.gz).

The demo and non-demo profiles are compatible, it means you can update a
`STM32MP135F-DK` profile with a `STM32MP135F-DK-DEMO` image (vice versa) for
example.

By default, the sysupgrade mechanism updates the partitions one by one. If the
partition table is different (for example the rootfs partition is 10MiB bigger),
the full image is written.

The U-Boot environment variables are always preserved during an upgrade.  
To erase the environment variables, flash the factory image on the SDCard or
use the `env erase` command from U-Boot.

Useful link: [Upgrading OpenWrt firmware using LuCI and CLI](https://openwrt.org/docs/guide-user/installation/generic.sysupgrade)

### Button

The kernel module `gpio-button-hotplug` is used to support buttons.  

To easily test the button:

```
mkdir -p /etc/hotplug.d/button

cat << "EOF" > /etc/hotplug.d/button/buttons
logger "the button was ${BUTTON} and the action was ${ACTION}"
EOF

root@OpenWrt:/# logread -f
Fri Mar 15 14:28:09 2024 user.notice root: the button was BTN_1 and the action was pressed
Fri Mar 15 14:28:09 2024 user.notice root: the button was BTN_1 and the action was released
```
Useful link: [Attach functions to a push button](https://openwrt.org/docs/guide-user/hardware/hardware.button)

### LED

One LED is defined and labelled `blue:heartbeat` (`LD8` for `STM32MP157F-DK2`,
`LD3` for `STM32MP135F-DK` and `LED1` for `STM32MP257F-EV1`). By default it is
configured to use the heartbeat trigger.

Useful link: [LED Configuration](https://openwrt.org/docs/guide-user/base-system/led_configuration)

### USB

Only mass storage are supported on the USB Type-A by default.

### Hardware RNG

By default OpenWrt uses urngd, a micro non-physical true random number generator based on timing jitter.
To use Hardware RNG as entropy source,
[rng-tools](https://github.com/openwrt/packages/tree/master/utils/rng-tools) package shall be used.

```
uci set system.@rngd[0].enabled="1"
uci set system.@rngd[0].device="/dev/hwrng"
uci commit system
service urngd disable && service urngd stop
service rngd restart
```

## Going further

* [Using the STM32 Cube Programmer](docs/stm32cubeprogrammer.md)
* [Using the Remote Processors](docs/remoteproc.md)
* [Using the USB Type-C](docs/usbc.md)
* [Using the OpenWrt SDK](docs/sdk.md)
* [Using the OpenWrt Image Builder](docs/imagebuilder.md)
* [Using the package repositories](docs/repositories.md)
* [Benchmarking](docs/benchmarking.md)
