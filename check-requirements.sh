#!/bin/bash

echo -n "MySql    : "
if ! which mysql > /dev/null; then
    echo "FAIL!"
else
    echo "pass"
fi

echo -n "PHP      : "
if ! which php > /dev/null; then
    echo "FAIL!"
else
    echo "pass"
fi

echo -n "Apache   : "
if ! which apache2ctl > /dev/null; then
    echo "FAIL!"
else
    echo "pass"
fi

echo -n "Git      : "
if ! which git > /dev/null; then
    echo "FAIL!"
else
    echo "pass"
fi

echo -n "Redis    : "
if ! which redis-server > /dev/null; then
    echo "FAIL!"
else
    echo "pass"
fi

echo -n "Composer : "
if ! which composer.phar > /dev/null; then
    echo "FAIL!"
else
    echo "pass"
fi