FROM debian:bookworm

RUN apt update -y
RUN apt upgrade -y
RUN apt-get install -y php8.2 php8.2-fpm php8.2-mysql mariadb-client wget
RUN sed -i 's|^listen = .*|listen = 9000|' /etc/php/8.2/fpm/pool.d/www.conf

#Install WordPress
RUN wget https://fr.wordpress.org/wordpress-7.1-fr_FR.tar.gz -P /var/www
RUN cd /var/www && tar -xzf wordpress-7.1-fr_FR.tar.gz && rm wordpress-7.1-fr_FR.tar.gz
RUN chown -R root:root /var/www/wordpress

#CLI allows automatic configuration of web page (don't land on default WordPress homepage)
RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
RUN chmod +x wp-cli.phar
RUN mv wp-cli.phar /usr/local/bin/wp

COPY tools/auto_config.sh /auto_config.sh
RUN chmod +x /auto_config.sh

WORKDIR /var/www/wordpress

EXPOSE 9000

ENTRYPOINT [ "/auto_config.sh" ]