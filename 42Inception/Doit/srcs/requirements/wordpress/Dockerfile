FROM debian:buster

RUN apt-get update -y && apt-get upgrade -y && \
    apt-get -y install php7.3 php-fpm php-cli wget \
    curl php-mysql php-mbstring php-xml sendmail vim && \
    apt-get -y install mariadb-client
RUN mkdir -p /var/www/ /run/php/ /var/lib/wordpress/ && \
    chown -R www-data:www-data /var/www /var/lib/wordpress

RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
RUN mv wp-cli.phar /usr/local/bin/
RUN chmod +x /usr/local/bin/wp-cli.phar
RUN ln -sf /usr/local/bin/wp-cli.phar /usr/local/bin/wp
RUN wp core download --version=5.8.1 --path=/var/www/wordpress --allow-root


COPY ./tools/setting.sh /tmp/setting.sh
COPY conf/wp-config.php /var/www/wordpress/wp-config.php
RUN chmod +x /tmp/setting.sh
ENTRYPOINT ["sh", "-c", "/tmp/setting.sh"]
