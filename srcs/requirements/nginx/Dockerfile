FROM debian:trixie

RUN apt update
RUN apt install nginx -y
RUN apt install vim -y

#Install TLS
RUN mkdir -p /etc/nginx/tls
RUN apt install openssl -y
RUN openssl req -newkey rsa:2048  -x509 -sha256 -nodes \
	-out /etc/nginx/tls/inception.crt \
	-keyout /etc/nginx/tls/inception.key \
	-subj="/C=FR/ST=IDF/L=Paris/O=42/OU=42/CN=aborel.42.fr/UID=aborel"

#Put config files in /var
RUN mkdir -p /var/run/nginx

COPY conf/nginx.conf /etc/nginx/nginx.conf

RUN chmod 755 /var/www/html
RUN chown -R www-data:www-data /var/www/html

CMD [ "nginx", "-g", "daemon off;" ]