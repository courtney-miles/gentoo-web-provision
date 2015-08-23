#!/bin/bash
#
# Install XDebug module for PHP

pecl install xdebug

echo "zend_extension=/usr/lib64/php5.6/lib/extensions/no-debug-zts-20131226/xdebug.so" >> /etc/php/fpm-php5.6/ext/xdebug.ini
ln -s /etc/php/fpm-php5.6/ext/xdebug.ini /etc/php/fpm-php5.6/ext-active/xdebug.ini

cp /etc/php/fpm-php5.6/ext/xdebug.ini /etc/php/cli-php5.6/ext/xdebug.ini
ln -s /etc/php/cli-php5.6/ext/xdebug.ini /etc/php/cli-php5.6/ext-active/xdebug.ini

/etc/init.d/php-fpm restart
