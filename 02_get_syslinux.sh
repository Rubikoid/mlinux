#!/usr/bin/env bash

wget -O syslinux.tar.xz \
    "http://kernel.org/pub/linux/utils/boot/syslinux/syslinux-$(cat ./versions/syslinux_version).tar.xz"
