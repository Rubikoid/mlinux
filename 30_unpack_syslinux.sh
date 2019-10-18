#!/usr/bin/env bash

set -ex

target_dir="/tmp/mlinux_syslinux"
target_tarball="syslinux.tar.xz"

if [[ -d $target_dir ]]; then
    echo "removing old $target_dir dir"
    rm -rf $target_dir
fi

mkdir $target_dir
echo "unpacking $target_tarball"
tar xf $target_tarball -C $target_dir --strip-components=1

set +ex
