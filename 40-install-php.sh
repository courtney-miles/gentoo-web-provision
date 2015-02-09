#!/bin/bash
#
# Install and configure PHP
#

echo "PHP_TARGETS=\"php5-5\"" >> /etc/portage/make.conf
echo "PHP_INI_VERSION=\"production\"" >> /etc/portage/make.conf

echo "dev-lang/php apache2 bzip2 cli crypt ctype curl -doc exif -ftp fpm gd gdbm hash inifile iconv intl json mhash mysql -ncurses nls pdo  posix -postgres readline -snmp sockets ssl sqlite -sysvipc threads truetype unicode wddx xmlreader xmlwriter xslt zip zlib" >> /etc/portage/package.use/php
echo ">=app-admin/eselect-php-0.7.1-r3 fpm" >> /etc/portage/package.use/fpm
echo ">=app-admin/eselect-php-0.7.1-r3 apache2" >> /etc/portage/package.use/apache2

emerge $EM_VERBOSE dev-lang/php:5.5
eselect php set fpm 1
eselect php set cli 1
rc-update add php-fpm default

/etc/init.d/php-fpm start
