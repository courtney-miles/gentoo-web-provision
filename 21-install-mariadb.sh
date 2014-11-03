#!/bin/bash
#
# Install and configure MySQL
#

emerge dev-db/mariadb
rc-update add mysql default

# Run configuration.
echo \
\
| emerge --config dev-db/mariadb

/etc/init.d/mysql start