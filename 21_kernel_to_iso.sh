#!/usr/bin/env bash

set -ex

kernel_path=$(cat kernel_path)
isoimage_path=$(cat isoimage_path)

cp $kernel_path/arch/x86/boot/bzImage $isoimage_path/kernel.gz

set +ex
