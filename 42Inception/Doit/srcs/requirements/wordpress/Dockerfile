FROM debian:buster

<<<<<<< HEAD
# 
RUN apt-get update &&\
    apt-get install curl php-mysql php7 php7-phar php7-json php7-curl php7-fpm php7-mysqli php7-iconv &&\
    mkdir -p /var/www/wordpress && \
    curl -O https://wordpress.org/latest.tar.gz && \
    tar -xzf latest.tar.gz -C /var/www/html/ && \
#    curl -s -L https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar --output /usr/bin/wp && \
    chmod +x /usr/bin/wp && \
    chown -R www-data:www-data /var/www/html/wordpress애
=======
RUN apt-get update -y && apt-get upgrade -y && \
    apt-get -y install php7.3 php-fpm php-cli wget \
    curl php-mysql php-mbstring php-xml sendmail vim && \
    apt-get -y install mariadb-client

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
>>>>>>> c503bcea62a314a85a2765eee673ad212e08d59e
