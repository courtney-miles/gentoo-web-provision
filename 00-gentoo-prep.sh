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

# Updating world removes net.lo.  Updating openrc separately seems to get around that.
emerge $EM_VERBOSE -update openrc

emerge $EM_VERBOSE --update --newuse --deep --with-bdeps=y --keep-going @world

# Some packages will have failed, but can be corrected by running perl-cleaner before updating world again.
perl-cleaner --all
emerge $EM_VERBOSE --update --newuse --deep --with-bdeps=y --keep-going @world

emerge $EM_VERBOSE --depclean
revdep-rebuild