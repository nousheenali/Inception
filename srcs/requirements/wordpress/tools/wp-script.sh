#!/bin/bash

mkdir -p /var/www/ /var/www/html
cd /var/www/html
rm -rf *

curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
chmod +x wp-cli.phar
mv wp-cli.phar /usr/local/bin/wp

wget https://wordpress.org/latest.tar.gz && \
tar -xvzf latest.tar.gz && \
rm -rf latest.tar.gz

cp -r wordpress/* /var/www/html/

cp /wp-config.php /var/www/html/wp-config.php

sed -i -r "s/db_name_string/${DB_NAME}/1"   wp-config.php
sed -i -r "s/db_user_string/${AD_USER}/1"  wp-config.php
sed -i -r "s/db_pwd_string/${AD_PASS}/1"    wp-config.php

wp core install --path=/var/www/html/ --url=nali.42.fr --title="Inception by Nousheen" --admin_user=$WP_ADMIN_USER --admin_password=$WP_ADMIN_PWD --admin_email=$WP_ADMIN_EMAIL --skip-email --allow-root

wp user create --path=/var/www/html/ $WP_USER $WP_EMAIL --role=contributor --user_pass=$WP_PWD --allow-root

chown -R www-data:www-data /var/www/html/

sed -i 's/listen = .*/listen = wordpress:9000/g' /etc/php/7.4/fpm/pool.d/www.conf

rm -rf /wordpress

echo "Done setting up wordpress..."