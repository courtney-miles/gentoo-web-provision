#!/bin/bash
#
# Install and configure Redis
#

emerge $EM_VERBOSE dev-db/redis
rc-update add redis default

/etc/init.d/redis start