#!/bin/bash
#
# Install and configure MySQL
#

emerge dev-db/mariadb
rc-update add mysql default

# Mount the mysql disk
/vagrant/vagrant-scripts/mount-mysql-disk.sh

# Run configuration.
echo \
\
| emerge --config dev-db/mariadb

#mv /etc/mysql/my.cnf /etc/mysql/my.cnf.bak
#cp /vagrant/vagrant-scripts/service-configs/my.cnf /etc/mysql/my.cnf
#chmod -x /etc/mysql/my.cnf

/etc/init.d/mysql start