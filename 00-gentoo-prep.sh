#!/bin/bash
#
# Perform the initial preparation of the Gentoo box before installing any packages.
#

# Ensure the hostname has an entry in the host file to satisfy Apache when no other configuration exists.
echo "127.0.0.1" `hostname` >> /etc/hosts

#set timezone
cp /usr/share/zoneinfo/Australia/Brisbane /etc/localtime
echo "Australia/Brisbane" >> /etc/timezone

# Set locale
echo "en_GB.UTF-8 UTF-8" >> /etc/locale.gen
echo "en_AU.UTF-8 UTF-8" >> /etc/locale.gen
locale-gen
sed -i "s/en_US.utf8/en_GB.utf8/g" /etc/env.d/02locale
env-update && source /etc/profile

emerge-webrsync
# emerge --sync
emerge $EM_VERBOSE --update portage

# Don't update the kernel -- that requires more work than we want to do in this script.
echo ">sys-kernel/gentoo-sources-3.10.41-r1" > /etc/portage/package.mask/gentoo-source

emerge $EM_VERBOSE --update --newuse --deep --with-bdeps=y --keep-going @world

revdep-rebuild