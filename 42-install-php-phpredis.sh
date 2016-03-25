#!/bin/bash
#
# Install and configure PHPRedis module for PHP
#

cd /tmp

wget -tries=5 -O phpredis-2.2.4.tar.gz https://github.com/nicolasff/phpredis/archive/2.2.4.tar.gz
tar xzfv phpredis-2.2.4.tar.gz
cd phpredis-2.2.4
phpize
aclocal
libtoolize --force
autoheader
autoreconf
./configure
make && make install

#cleanup
cd /tmp
rm phpredis-2.2.4.tar.gz
rm -rf phpredis-2.2.4

/etc/init.d/php-fpm restart
