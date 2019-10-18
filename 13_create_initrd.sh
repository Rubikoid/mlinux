#!/usr/bin/env bash

set -ex
rootfs_path=$(cat ./rootfs_path)
isoimage_path=$(cat ./isoimage_path)
cur_dir=$(pwd)

if [[ -d $isoimage_path ]]; then
    echo "removing old $isoimage_path dir"
    rm -rf $isoimage_path
fi
mkdir $isoimage_path

cd $rootfs_path
find . | cpio -R root:root -H newc -o | gzip > $isoimage_path/rootfs.gz
cd $cur_dir

set +ex