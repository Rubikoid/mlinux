#!/usr/bin/env bash

set -ex
cur_dir=$(pwd)
isoimage_path=$(cat ./paths/isoimage_path)
kernel_path=$(cat ./paths/kernel_path)
syslinux_path=$(cat ./paths/syslinux_path)
target_path=$(cat ./paths/target_iso)

cd $isoimage_path

cp $syslinux_path/bios/core/isolinux.bin .
cp $syslinux_path/bios/com32/elflink/ldlinux/ldlinux.c32 .
echo 'default kernel.gz initrd=rootfs.gz' > ./isolinux.cfg
xorriso \
    -as mkisofs \
    -o $target_path \
    -b isolinux.bin \
    -c boot.cat \
    -no-emul-boot \
    -boot-load-size 4 \
    -boot-info-table \
    ./

cd $cur_dir
set +ex
