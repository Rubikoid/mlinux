#!/usr/bin/env bash

set -ex
cur_dir=$(pwd)
kernel_path=$(cat ./paths/kernel_path)

if [[ -d $kernel_path ]]; then
    echo "removing old $kernel_path dir"
    rm -rf $kernel_path
fi
mkdir $kernel_path

tar xf kernel.tar.xz -C $kernel_path --strip-components=1 # unpack kernel
cd $kernel_path

make mrproper

make i386_defconfig #change to menuconfig if you want to tweak default config
make -j4 bzImage

cd $cur_dir
set +ex
