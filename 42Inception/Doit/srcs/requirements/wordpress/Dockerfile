FROM debian:buster

# 
RUN apt-get update &&\
    apt-get install curl php-mysql php7 php7-phar php7-json php7-curl php7-fpm php7-mysqli php7-iconv &&\
    mkdir -p /var/www/wordpress && \
    curl -O https://wordpress.org/latest.tar.gz && \
    tar -xzf latest.tar.gz -C /var/www/html/ && \
#    curl -s -L https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar --output /usr/bin/wp && \
    chmod +x /usr/bin/wp && \
    chown -R www-data:www-data /var/www/html/wordpress애