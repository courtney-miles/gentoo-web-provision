#!/usr/bin/env bash

emerge --verbose PEAR-PEAR
echo \>`equery list -F "\$version" PEAR-PEAR` >> /etc/portage/package.mask/PEAR
pear channel-update pear.php.net
pear upgrade-all

