FROM debian:buster

RUN apt-get update -y && apt-get upgrade -y && \
    apt-get -y install php7.3 php-fpm php-cli wget \
    curl php-mysql php-mbstring php-xml sendmail vim

RUN wget https://wordpress.org/latest.tar.gz && \
    tar -xvf latest.tar.gz
# /var/run/php/ : 소켓 바인딩 에러 해결 용
RUN mkdir -p /var/run/php/ &&\
    mkdir -p /var/www/html/ && \
    mv /wordpress/* /var/www/html/ && \
    chown -R www-data:www-data /var/www/html
RUN rm -r /wordpress latest.tar.gz && \
    mv /var/www/html/wp-config-sample.php /var/www/html/wp-config.php

COPY ./tools/setting.sh /tmp/setting.sh
RUN chmod +x /tmp/setting.sh
ENTRYPOINT ["sh", "-c", "/tmp/setting.sh"]