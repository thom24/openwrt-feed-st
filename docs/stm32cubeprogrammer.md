# Using STM32 Cube Programmer

[STM32 Cube
Programmer](https://www.st.com/en/development-tools/stm32cubeprog.html)
is a utility provided by ST that allows to reflash an STM32MP1
platform directly from your PC.

To get started, download STM32 Cube Programmer from the [ST
website](https://www.st.com/en/development-tools/stm32cubeprog.html).
We tested with version 2.21.0, and the below instructions assume that STM32 Cube
Programmer is installed in the `$HOME/stm32cube` folder.

STM32 Cube Programmer will be used to reflash the SD card, with the SD
card inserted in the STM32MP platform. If you want to reflash an eMMC storage
device instead, the `flash.tsv` file will have to be adapted.

Follow these steps:

1. Switch the boot mode switch SW1 to USB boot
   - STM32MP157: BOOT0 and BOOT2 to OFF
   - STM32MP135: BOOT0, BOOT1 and BOOT2 to OPEN
   - STM32MP2*: BOOT0, BOOT1, BOOT2 and BOOT3 to OPEN
2. Plug a second USB-C cable on CN7 on the STM32MP157/135 or CN15 on the
   STM32MP257F-EV1.
3. Copy images in a dedicated folder
```bash
# STM32MP1 based boards
$ mkdir tmp
$ cp flashing/tf-a-stm32mp157_usb.stm32 tmp/
$ cp flashing/fip-stm32mp157_usb.bin tmp/
$ cp bin/targets/stm32/stm32mp1/openwrt-stm32-stm32mp1-stm32mp157f-dk2-ext4-factory.img.gz tmp/
```
```bash
# STM32MP2 based boards
$ mkdir tmp
$ cp flashing/tf-a-stm32mp257_dk_usb.stm32 tmp/
$ cp flashing/fip-stm32mp257_dk_usb.bin tmp/
$ cp flashing/fip-ddr-stm32mp257_dk_usb.bin tmp/
$ cp bin/targets/stm32/stm32mp2/openwrt-stm32-stm32mp2-stm32mp257f-dk-ext4-factory.img.gz tmp/
```
4. Decompress the factory image
```bash
$ gzip -d tmp/openwrt-stm32-stm32mp1-stm32mp157f-dk2-ext4-factory.img.gz
```
5. Create the `flash.tsv` file
```bash
# STM32MP1 based boards
$ cat tmp/flash.tsv
-	0x01	fsbl-boot	Binary	none	0x0	tf-a-stm32mp157_usb.stm32
-	0x03	fip-boot	FIP	none	0x0	fip-stm32mp157_usb.bin
P	0x10	sdcard		RawImage	mmc0	0x0	openwrt-stm32-stm32mp1-stm32mp157f-dk2-ext4-factory.img
```
```bash
# STM32MP2 based boards
$ cat tmp/flash.tsv
-	0x01	fsbl-boot	Binary	none	0x0	tf-a-stm32mp257_dk_usb.stm32
-	0x02	fip-ddr		Binary		none	0x0 fip-ddr-stm32mp257_dk_usb.bin
-	0x03	fip-boot	Binary		none	0x0 fip-stm32mp257_dk_usb.bin
P	0x10	sdcard		RawImage	mmc0	0x0	openwrt-stm32-stm32mp2-stm32mp257f-dk-ext4-factory.img
```
6. Run the command to start flashing
```
$ $HOME/stm32cube/bin/STM32_Programmer_CLI -c port=usb1 -w ./tmp/flash.tsv
```
7. Switch back the boot mode switch to SD boot
   - STM32MP157: BOOT0 and BOOT2 to ON
   - STM32MP135: BOOT0 to ON, BOOT1 to OPEN, BOOT2 to ON
   - STM32MP2*: BOOT0 to ON, BOOT1, BOOT2 and BOOT3 to OPEN
8. Reboot the platform
