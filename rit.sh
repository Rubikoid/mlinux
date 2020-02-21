#!/usr/bin/env bash


echo "creating default mlinux.iso"
echo "variables:"
echo -e "\tbusybox version: $(cat ./versions/busybox_version)"
echo -e "\tkernel version: $(cat ./versions/kernel_version)"
echo -e "\tsyslinux version: $(cat ./versions/syslinux_version)"
echo
echo -e "\tbusybox path: $(cat ./paths/busybox_path)"
echo -e "\tkernel build path: $(cat ./paths/kernel_path)"
echo -e "\trootfs path: $(cat ./paths/rootfs_path)"
echo -e "\tisoimage path: $(cat ./paths/isoimage_path)"
echo -e "\tsyslinux path: $(cat ./paths/syslinux_path)"
echo
echo -e "\e[30m\e[107mTarget ISO: $(cat ./paths/target_iso)\e[0m"
echo
echo "starting..."
sleep 1

set -ex
for i in $(ls | grep -P '1\d{1}_.*.sh'); do
     source $i;
done

#source 1*_*
#source 11_*
#source 12_*
#source 13_*
#source 14_*

source 21_*
source 31_*
set +ex
