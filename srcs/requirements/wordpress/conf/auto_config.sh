sleep 10
wp config create --allow-root \
	--db_name=$SQL_DATABASE \
	--dbuser=$SQL_USER \
	--dbpass=$SQL_PASSWORD \
	--dbhost=mariadb:3306 --path='/var/www/wordpress'

wp user create $SQL_USER $SQL_EMAIL --role=administrator

