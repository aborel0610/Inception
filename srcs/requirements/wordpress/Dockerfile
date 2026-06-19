FROM debian:bookworm

RUN apt update -y
RUN apt upgrade -y
RUN apt-get install -y php7.3 php-fpm php-mysql mariadb-client wget

#Install WordPress
RUN wget https://fr.wordpress.org/wordpress-7.0-fr_FR.tar.gz -P /var/www
RUN cd /var/www && tar -xzf wordpress-7.0-fr_FR.tar.gz && rm wordpress-7.0-fr_FR.tar.gz
RUN chown -R root:root /var/www/wordpress

#CLI allows automatic configuration of web page (don't land on default WordPress homepage)
RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
RUN chmod +x wp-cli.phar
RUN mv wp-cli.phar /usr/local/bin/wp

RUN mkdir /run/php

COPY conf/auto_config.sh /auto_config.sh
RUN chmod +x /auto_config.sh

WORKDIR /var/www/html

EXPOSE 9000

ENTRYPOINT [ "/auto_config.sh" ]