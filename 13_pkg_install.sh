#!/usr/bin/env bash

set -ex
cur_dir=$(pwd)
rootfs_path=$(cat ./paths/rootfs_path)

echo "path pkg directly to initrd"
cd ./pkg
for i in $(ls | grep -P '.tar.xz'); do
#     tar xJf $i -C $rootfs_path        
done

echo "cp pkgs to initrd and patch after boot"
mkdir $rootfs_path/pkg
cd ../pkg_d
for i in $(ls | grep -P '.tar.xz'); do
#     cp $i $rootfs_path/pkg        
done

cd $cur_dir
set +ex
