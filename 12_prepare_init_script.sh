#!/usr/bin/env bash

set -ex
rootfs_path=$(cat ./rootfs_path)

echo "#!/bin/sh" > $rootfs_path/init
echo "dmesg -n 1" >> $rootfs_path/init
echo "mount -t devtmpfs none /dev" >> $rootfs_path/init
echo "mount -t proc none /proc" >> $rootfs_path/init
echo "mount -t sysfs none /sys" >> $rootfs_path/init
echo "setsid cttyhack /bin/sh" >> $rootfs_path/init

chmod +x $rootfs_path/init

set +ex
