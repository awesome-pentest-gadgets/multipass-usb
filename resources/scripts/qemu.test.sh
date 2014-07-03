#!/bin/bash

# TODO : test qemu installed

# sync writes any data buffered in memory out to disk. 
sync

usbdev=`readlink -f /dev/disk/by-label/multipass01 | sed 's/[0-9]*//g'`

# TODO : use qemu-system-i386 if not x64 system
# -net user
# -display gtk
# ,readonly
sudo qemu-system-x86_64 -cpu host -machine type=pc,accel=kvm -vga std -m 1024 -name multipass01 -drive file=$usbdev,cache=none,if=virtio
