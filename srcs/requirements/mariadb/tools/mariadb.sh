#!/bin/sh

# Start mysqld in background for initial setup
mysqld --user=mysql &
MYSQL_PID=$!

# Wait until the socket is ready
until mysqladmin ping --silent 2>/dev/null; do
    echo "Waiting for MariaDB to start..."
    sleep 1
done

if [ -d "/var/lib/mysql/$SQL_DATABASE" ]
then 

	echo "Database already exists"
else
# Run setup queries (root has no password yet at this point)
mysql -e "CREATE DATABASE IF NOT EXISTS ${SQL_DATABASE};"
mysql -e "CREATE USER IF NOT EXISTS '${SQL_USER}'@'%' IDENTIFIED BY '${SQL_PASSWORD}';"
mysql -e "GRANT ALL PRIVILEGES ON ${SQL_DATABASE}.* TO '${SQL_USER}'@'%';"
mysql -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '${SQL_ROOT_PASSWORD}';"
mysql -e "FLUSH PRIVILEGES;"
mysql -e "SELECT user, host FROM mysql.user;"
# Shutdown using the root password we just set
kill $MYSQL_PID
wait $MYSQL_PID
fi

# Hand off to CMD (mysqld in foreground as PID 1)
exec "$@"