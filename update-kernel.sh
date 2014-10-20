#!/bin/bash

# Assumption for current and new kernel versions.
cp /usr/src/linux-3.10.41-gentoo-r1/.config /usr/src/linux-3.14.14-gentoo/
cd /usr/src/linux
# Running this with all defaults might be bad, but I don't know any better.
yes "" | make oldconfig
make modules_prepare
emerge @module-rebuild
make -j2
make modules_install
make install

echo "You need to have vagrant reboot the box now."