#!/bin/bash
#
# Perform the initial preparation of the Gentoo box before installing any packages.
#

# Ensure the hostname has an entry in the host file to satisfy Apache when no other configuration exists.
echo "127.0.0.1" `hostname` >> /etc/hosts

#set timezone
#cp /usr/share/zoneinfo/Australia/Brisbane /etc/localtime
#echo "Australia/Brisbane" >> /etc/timezone

# Set locale
echo "en_GB.UTF-8 UTF-8" >> /etc/locale.gen
echo "en_AU.UTF-8 UTF-8" >> /etc/locale.gen
locale-gen
sed -i "s/en_US.utf8/en_GB.utf8/g" /etc/env.d/02locale
env-update && source /etc/profile

# Grab a fixed portage snapshot instead of emerge-webrsync so we can ensure these script will work tomorrow.
echo "Downloading portage snaphshot..."
PORTAGE_DATE=20150320
wget -nv http://dev.gentoo.org/~swift/snapshots/portage-${PORTAGE_DATE}.tar.bz2{,.gpgsig,.md5sum,.umd5sum}
mv /usr/portage /usr/portage.bak
echo "Extracting portage snapshot..."
tar xjpf portage-${PORTAGE_DATE}.tar.bz2 -C /usr

emerge $EM_VERBOSE --update portage

emerge $EM_VERBOSE --update --newuse --deep --with-bdeps=y --keep-going @world

revdep-rebuild
