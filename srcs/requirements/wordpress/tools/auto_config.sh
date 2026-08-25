#!/bin/bash

#Wait for MariaDB
sleep 10

#if WordPress isn't already set up then
if [ ! -f /var/www/wordpress/wp-config.php ]; then
	#writes wp-config.php
	wp config create --allow-root \
		--dbname=$SQL_DATABASE \
		--dbuser=$SQL_USER \
		--dbpass=$SQL_PASSWORD \
		--dbhost=mariadb \
		--path=/var/www/wordpress
	
	#does the WordPress installation and sets up admin
	wp core install --allow-root \
		--url=$DOMAIN_NAME \
		--title="My Site" \
		--admin_user=$WP_ADMIN \
		--admin_password=$WP_ADMIN_PASS \
		--admin_email=$WP_ADMIN_EMAIL \
		--path=/var/www/wordpress

	#creates additional user
	wp user create --allow-root \
		$WP_USER $WP_USER_EMAIL \
		--role=subscriber \
		--user_pass=$WP_USER_PASS \
		--path=/var/www/wordpress
	
	wp theme install /twentytwentyfour.zip --activate --allow-root
	wp option update blogname "Austin's Inception Site" --allow-root
	wp option update blogdescription "42 School Project" --allow-root
	# wp theme activate oceanwp --allow-root
	wp post create /post.txt --post_type=post --post_title='A website made with Docker containers' --post_status=publish --allow-root
fi

exec php-fpm8.2 -F

