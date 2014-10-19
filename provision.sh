#!/bin/bash
#
# This script is called from the Vagrant provisioning configuration.
#

export EM_VERBOSE="--verbose"

/vagrant/00-gentoo-prep.sh
/vagrant/10-install-basic-services.sh
/vagrant/20-mount-mysql-disk.sh
/vagrant/21-install-mysql.sh
/vagrant/30-install-apache.sh
/vagrant/40-install-php.sh
/vagrant/41-install-php-phpredis.sh
/vagrant/42-install-php-xdebug.sh
/vagrant/50-update-git.sh
/vagrant/60-install-redis.sh
/vagrant/70-install-composer.sh
/vagrant/80-final-tweaks.sh

