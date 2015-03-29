#!/bin/bash
#
# This script is called from the Vagrant provisioning configuration.
#

set -o errexit

PROV_DIR=$1
export EM_VERBOSE="--verbose"

${PROV_DIR}/00-gentoo-prep.sh
${PROV_DIR}/10-install-basic-services.sh
${PROV_DIR}/20-mount-mysql-disk.sh
${PROV_DIR}/21-install-mariadb.sh
${PROV_DIR}/30-install-apache.sh
${PROV_DIR}/31-modify-apache-conf.sh
${PROV_DIR}/40-install-php.sh
${PROV_DIR}/41-install-php-phpredis.sh
${PROV_DIR}/42-install-php-xdebug.sh
${PROV_DIR}/50-update-git.sh
${PROV_DIR}/60-install-redis.sh
${PROV_DIR}/70-install-composer.sh
${PROV_DIR}/80-final-tweaks.sh

