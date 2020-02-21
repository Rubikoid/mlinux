#!/usr/bin/env bash

set -ex
cur_dir=$(pwd)
rootfs_path=$(cat ./paths/rootfs_path)
target_dir=$(cat ./paths/busybox_path)
target_tarball="busybox.tar.bz2"

if [[ -d $target_dir ]]; then
    echo "removing old $target_dir dir"
    rm -rf $target_dir
fi

if [[ -d $rootfs_path ]]; then
    echo "removing old $rootfs_path dir"
    rm -rf $rootfs_path
fi

mkdir $target_dir
echo "unpacking $target_tarball"
tar xf $target_tarball -C $target_dir --strip-components=1
cd $target_dir

make distclean

make defconfig # change to menuconfig if you want to tweak default config
# make menuconfig
sed -i "s|.*CONFIG_STATIC.*|CONFIG_STATIC=y|" .config
sed -i "s|.*CONFIG_PREFIX.*|CONFIG_PREFIX=\"$rootfs_path\"|" .config
# sed -i "s|.*CONFIG_EXTRA_CFLAGS.*|CONFIG_EXTRA_CFLAGS=\"-m32\"|" .config
# sed -i "s|.*CONFIG_EXTRA_LDFLAGS.*|CONFIG_EXTRA_LDFLAGS=\"-m32\"|" .config

make -j12 busybox install

cd $cur_dir
set +ex
