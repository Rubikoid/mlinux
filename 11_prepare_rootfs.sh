#!/usr/bin/env bash

set -ex
rootfs_path=$(cat ./paths/rootfs_path)
cur_dir=$(pwd)

cd $rootfs_path

rm -f ./linuxrc
# mkdir dev proc sys

cd $cur_dir

set +ex
