FROM debian:trixie

RUN apt update -y
RUN apt upgrade -y
RUN apt-get install wget -y
RUN apt-get install -y php7.3 php-fpm php-mysql mariadb-client
RUN wget https://fr.wordpress.org/wordpress-7.0-fr_FR.tar.gz -P /var/www
RUN cd /var/www && tar -xzf wordpress-7.0-fr_FR.tar.gz && rm wordpress-7.0-fr_FR.tar.gz
RUN chown -R root:root /var/www/wordpress

#PHP
RUN apt-get install -y php php-cgi php-mysql
RUN mkdir /run/php

WORKDIR /var/www/html/
EXPOSE 9000

#CLI allows automatic configuration of web page (don't land on default WordPress homepage)
RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
RUN chmod +x wp-cli.phar
RUN mv wp-cli.phar /usr/local/bin/wp
COPY conf/wp-config.php /etc/wordpress/wp-config.php
ENTRYPOINT [ "/etc/wordpress/autoconfig.sh" ]

CMD ["usr/sbin/php-fpm7.3", "-F"]