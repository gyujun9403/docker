FROM debian:buster

RUN apt-get update -y && \
    apt-get upgrade -y && \
    apt-get install mariadb-server -y && \
    rm /etc/mysql/mariadb.conf.d/50-server.cnf &&\
    mkdir -p /var/run/mysqld/ && \
    #mkdir -p /var/lib/mysql && \
    chown -R mysql:mysql /var/lib/mysql

COPY conf/50-server.cnf /etc/mysql/mariadb.conf.d
COPY ./tools/setup.sh /tmp/setup.sh

RUN chmod +x /tmp/setup.sh

EXPOSE 3306

ENTRYPOINT ["sh", "-c", "/tmp/setup.sh"]