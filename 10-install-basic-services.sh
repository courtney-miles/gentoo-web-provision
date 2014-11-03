#!/bin/bash
#
# Install basic non-essential services
#

emerge $EM_VERBOSE --keep-going \
syslog-ng \
vixie-cron \
app-misc/screen

# startup processes
rc-update add syslog-ng default
rc-update add vixie-cron default

# Install bash-completion now so other packages will install their files for it.
emerge $EM_VERBOSE bash-completion