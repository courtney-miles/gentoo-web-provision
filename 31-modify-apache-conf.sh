#!/bin/bash

# Adds modules for Fast CGI and Apache status.
sed -i "s/\(APACHE2_OPTS=\"\)\(.*\)\(\"\)/\1\2 -D PROXY_FCGI -D FASTCGI_HANDLER -D STATUS\3/" /etc/conf.d/apache2

/etc/init.d/apache2 restart