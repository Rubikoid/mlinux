#!/usr/bin/env bash

set -ex
rootfs_path=$(cat ./paths/rootfs_path)

cat > "$rootfs_path/init" <<- EOM
#!/bin/sh
dmesg -n 1

f=\$(ls)
mkdir /new_sys
mount -t tmpfs -o size=700m,mode=0777 tmpfs /new_sys
cp -r \$f /new_sys
mount -t devtmpfs none /new_sys/dev
mount -t proc none /new_sys/proc
mount -t sysfs none /new_sys/sys
chroot /new_sys /bin/sh /cinit
echo s3
EOM

cat > "$rootfs_path/cinit" <<- EOM
#!/bin/sh
echo s1
#export PYTHONHOME=/usr/lib/python3.8
sh /dpk
python /pygame/__init__.py 2>/a.log
setsid cttyhack /bin/sh
echo s2
EOM

cat > "$rootfs_path/dpk" <<- EOM
#!/bin/sh
cd /pkg
for i in \$(ls | grep '.tar.xz'); do
    echo "Unpacking" \$i
    tar xJf \$i -C /        
done
cd /
EOM

chmod +x $rootfs_path/init
chmod +x $rootfs_path/cinit

set +ex
