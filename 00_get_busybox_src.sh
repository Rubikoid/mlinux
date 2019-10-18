#!/usr/bin/env bash

wget -O busybox.tar.bz2 \
    "https://busybox.net/downloads/busybox-$(cat ./versions/busybox_version).tar.bz2"
