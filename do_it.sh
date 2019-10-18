#!/usr/bin/env bash


echo "creating default mlinux.iso"
echo "variables:"
echo -e "\tbusybox version: $(cat busybox_version)"
echo -e "\tkernel version: $(cat kernel_version)"
echo -e "\tsyslinux version: $(cat syslinux_version)"
echo
echo -e "\tkernel build path: $(cat kernel_path)"
echo -e "\trootfs path: $(cat rootfs_path)"
echo -e "\tisoimage path: $(cat isoimage_path)"
echo
echo -e "\e[30m\e[107mTarget ISO: $(cat target_iso)\e[0m"
echo
echo "starting..."
sleep 1

set -ex
for i in $(ls | grep -P '\d{2}_.*.sh'); do
    source $i;
done
set +ex
