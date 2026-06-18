FROM debian:trixie

RUN apt update -y
RUN apt upgrade -y
RUN apt-get install mariadb-server -y

RUN mkdir -p /var/run/mysqld \ 
	&& chown -R mysql:mysql /var/run/mysqld \ 
	&& chmod 777 /var/run/mysqld

EXPOSE 3306

COPY ./tools/mariadb.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/mariadb.sh
COPY conf/50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf

CMD [ "mysqld" ]