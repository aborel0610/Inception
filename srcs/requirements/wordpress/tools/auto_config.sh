#!/bin/bash

#Wait for MariaDB
sleep 10

#if WordPress isn't already set up then
if [ ! -f /var/www/wordpress/wp-config.php ]; then
	SLQ_PASSWORD=$(cat /run/secrets/sql_password)
	#writes wp-config.php
	wp config create --allow-root \
		--dbname=$SQL_DATABASE \
		--dbuser=$SQL_USER \
		--dbpass=$SQL_PASSWORD \
		--dbhost=mariadb \
		--path=/var/www/wordpress
	
	#does the WordPress installation and sets up admin
	WP_ADMIN_PASS=$(cat /run/secrets/wp_admin_pass)
	wp core install --allow-root \
		--url=$DOMAIN_NAME \
		--title="My Site" \
		--admin_user=$WP_ADMIN \
		--admin_password=$WP_ADMIN_PASS \
		--admin_email=$WP_ADMIN_EMAIL \
		--path=/var/www/wordpress

	#creates additional user
	WP_USER_PASS=$(cat /run/secrets/wp_user_pass)
	wp user create --allow-root \
		$WP_USER $WP_USER_EMAIL \
		--role=subscriber \
		--user_pass=$WP_USER_PASS \
		--path=/var/www/wordpress
	
fi

exec php-fpm8.2 -F

