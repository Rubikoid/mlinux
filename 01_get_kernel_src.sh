#!/usr/bin/env bash

wget -O kernel.tar.xz \
    "http://kernel.org/pub/linux/kernel/v5.x/linux-$(cat kernel_version).tar.xz"
