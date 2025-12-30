#!/bin/bash
# Script to run QEMU for buildroot as the default configuration qemu_aarch64_virt_defconfig
# Host forwarding: Host Port 10022 ->> QEMU Port 22 
# Author: Siddhant Jajoo.


# Modify by Arnaud
# 27DEC2025
# line: 15 and 19 set as absolut path


qemu-system-aarch64 \
    -M virt  \
    -cpu cortex-a53 -nographic -smp 1 \
    -kernel /home/tchuinkou/buildroot-assignments-base/buildroot/output/images/Image \
    -append "rootwait root=/dev/vda console=ttyAMA0" \
    -netdev user,id=eth0,hostfwd=tcp::10022-:22 \
    -device virtio-net-device,netdev=eth0 \
    -drive file=/home/tchuinkou/buildroot-assignments-base/buildroot/output/images/rootfs.ext4,if=none,format=raw,id=hd0 \
    -device virtio-blk-device,drive=hd0 -device virtio-rng-pci
    

