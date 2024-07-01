#!/bin/sh
# Copyright (C) 2024 Bootlin

set -ex
[ $# -eq 9 ] || {
    echo "SYNTAX: $0 <file> <fsbl> <metadata> <fip> <bootfs image> <rootfs image> <env size> <bootfs size> <rootfs size>"
    exit 1
}

OUTPUT="${1}"
FSBL="${2}"
METADATA="${3}"
FIP="${4}"
BOOTFS="${5}"
ROOTFS="${6}"
ENVSIZE="$((${7} / 1024))"
BOOTFSSIZE="${8}"
ROOTFSSIZE="${9}"

set $(ptgen -o "${OUTPUT}" -g -a 5 -l 2048 -G ${GUID} -N fsbla1 -p 256K -N fsbla2 -p 256K -N metadata1 -t 0 -p 256K -N metadata2 -t 0 -p 256K -N fip-a -t 0 -p 3M -N fip-b -t 0 -p 3M -N u-boot-env -p "${ENVSIZE}" -N boot -t 83 -p${BOOTFSSIZE}M -N rootfs -t 83 -p ${ROOTFSSIZE}M)
FSBL1OFFSET="$((${1} / 512))"
FSBL1SIZE="$((${2} / 512))"
FSBL2OFFSET="$((${3} / 512))"
FSBL2SIZE="$((${4} / 512))"
METADATA1OFFSET="$((${5} / 512))"
METADATA1SIZE="$((${6} / 512))"
METADATA2OFFSET="$((${7} / 512))"
METADATA2SIZE="$((${8} / 512))"
FIPAOFFSET="$((${9} / 512))"
FIPASIZE="$((${10} / 512))"
FIPBOFFSET="$((${11} / 512))"
FIPBSIZE="$((${12} / 512))"
ENVOFFSET="$((${13} / 512))"
ENVSIZE="$((${14} / 512))"
BOOTFSOFFSET="$((${15} / 512))"
BOOTFSSIZE="$((${16} / 512))"
ROOTFSOFFSET="$((${17} / 512))"
ROOTFSSIZE="$((${18} / 512))"

dd bs=512 if="${FSBL}" of="${OUTPUT}" seek="${FSBL1OFFSET}" conv=notrunc
dd bs=512 if="${FSBL}" of="${OUTPUT}" seek="${FSBL2OFFSET}" conv=notrunc
dd bs=512 if="${METADATA}" of="${OUTPUT}" seek="${METADATA1OFFSET}" conv=notrunc
dd bs=512 if="${METADATA}" of="${OUTPUT}" seek="${METADATA2OFFSET}" conv=notrunc
dd bs=512 if="${FIP}"  of="${OUTPUT}" seek="${FIPAOFFSET}" conv=notrunc
dd bs=512 if="${FIP}"  of="${OUTPUT}" seek="${FIPBOFFSET}" conv=notrunc
dd bs=512 if=/dev/zero of="${OUTPUT}" seek="${ENVOFFSET}" count="${ENVSIZE}" conv=notrunc
dd bs=512 if="${BOOTFS}" of="${OUTPUT}" seek="${BOOTFSOFFSET}" conv=notrunc
dd bs=512 if="${ROOTFS}" of="${OUTPUT}" seek="${ROOTFSOFFSET}" conv=notrunc
