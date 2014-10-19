#!/bin/bash
#
# Install and configure PHPRedis module for PHP
#

cd /tmp

wget -O phpredis-2.2.4.tar.gz https://github.com/nicolasff/phpredis/archive/2.2.4.tar.gz
tar xzfv phpredis-2.2.4.tar.gz
cd phpredis-2.2.4
phpize
aclocal
libtoolize --force
autoheader
autoconf
./configure
make && make install

#cleanup
cd /tmp
rm phpredis-2.2.4.tar.gz
rm -rf phpredis-2.2.4

/etc/init.d/php-fpm restart