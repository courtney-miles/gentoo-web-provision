#!/bin/bash
#
# Install and configure PHPRedis module for PHP
#

PHPREDIS_VER=3.0.0
cd /tmp

wget -tries=5 -O phpredis-$PHPREDIS_VER.tar.gz https://github.com/nicolasff/phpredis/archive/$PHPREDIS_VER.tar.gz
tar xzfv phpredis-$PHPREDIS_VER.tar.gz
cd phpredis-$PHPREDIS_VER
phpize
aclocal
libtoolize --force
autoheader
autoreconf
./configure
make && make install

#cleanup
cd /tmp
rm phpredis-$PHPREDIS_VER.tar.gz
rm -rf phpredis-$PHPREDIS_VER

/etc/init.d/php-fpm restart
