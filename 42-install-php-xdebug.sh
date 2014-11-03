#!/bin/bash
#
# Install XDebug module for PHP
emerge $EM_VERBOSE xdebug

/etc/init.d/php-fpm restart