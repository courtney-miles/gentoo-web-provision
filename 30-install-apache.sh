#!/bin/bash
#
# Install and configure Apache
#

echo "APACHE2_MPMS=\"worker\"" >> /etc/portage/make.conf
echo "APACHE2_MODULES=\"actions alias auth_basic authn_alias authn_anon authn_dbm authn_default authn_file authz_dbm authz_default authz_groupfile authz_host authz_owner authz_user autoindex cache cgi cgid dav dav_fs dav_lock deflate dir disk_cache env expires ext_filter file_cache filter headers include info log_config logio mem_cache mime mime_magic negotiation proxy rewrite setenvif speling status unique_id userdir usertrack vhost_alias\"" >> /etc/portage/make.conf

echo "www-servers/apache -ldap threads -ssl" >> /etc/portage/package.use/apache
echo "=www-apache/mod_proxy_fcgi-0_p816361 ~amd64" >> /etc/portage/package.accept_keywords/apache

emerge $EM_VERBOSE =www-servers/apache-2.2.31 www-apache/mod_proxy_fcgi
rc-update add apache2 default

/etc/init.d/apache2 start
