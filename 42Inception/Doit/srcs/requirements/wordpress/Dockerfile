FROM debian:buster

RUN apt-get update -y && apt-get upgrade -y && \
    #apt-get -y install php7.3 php-fpm php-cli php7.3-phar php7.3-json php7.3-curl php7.3-iconv wget \
    apt-get -y install php7.3 php-fpm php-cli wget \
    curl php-mysql php-mbstring php-xml sendmail vim && \
    apt-get -y install mariadb-client
# RUN wget https://wordpress.org/latest.tar.gz && \
#     tar -xvf latest.tar.gz
# /var/run/php/ : 소켓 바인딩 에러 해결 용
# RUN mkdir -p /var/run/php/ &&\
#     mkdir -p /var/www/html/ && \
#     mv /wordpress/* /var/www/html/ && \
#     chown -R www-data:www-data /var/www/html
# RUN rm -r /wordpress latest.tar.gz && \
#     mv /var/www/html/wp-config-sample.php /var/www/html/wp-config.php
# RUN mkdir -p /var/run/php/ &&\
#     mkdir -p /var/www/html/ && \
#     mv /wordpress/* /var/www/html/ && \
#     chown -R www-data:www-data /var/www
RUN mkdir -p /var/www/ /run/php/&& \
    chown -R www-data:www-data /var/www

RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
RUN mv wp-cli.phar /usr/local/bin/
RUN chmod +x /usr/local/bin/wp-cli.phar
RUN ln -sf /usr/local/bin/wp-cli.phar /usr/local/bin/wp
RUN wp core download --version=5.8.1 --path=/var/www/wordpress --allow-root


COPY ./tools/setting.sh /tmp/setting.sh
COPY conf/wp-config.php /var/www/wordpress/wp-config.php
RUN chmod +x /tmp/setting.sh
ENTRYPOINT ["sh", "-c", "/tmp/setting.sh"]
