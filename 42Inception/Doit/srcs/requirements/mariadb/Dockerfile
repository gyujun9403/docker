FROM debian:buster

RUN apt-get update -y && apt-get upgrade -y && \
    apt-get install procps -y && \
    apt-get install mariadb-server -y && \
    mkdir -p /var/run/mysqld/ /var/lib/mysql /run/mysqld && \
    chown -R mysql:mysql /var/run/mysqld /var/lib/mysql /run/mysqld && \
    rm /etc/mysql/mariadb.conf.d/50-server.cnf

COPY conf/50-server.cnf /etc/mysql/mariadb.conf.d
COPY ./tools/setup.sh /tmp/setup.sh

RUN chmod +x /tmp/setup.sh

EXPOSE 3306

ENTRYPOINT ["sh", "-c", "/tmp/setup.sh"]
#ENTRYPOINT ["/usr/bin/mysqld_safe", "--datadir=/var/lib/mysql"]
ENTRYPOINT ["/usr/sbin/mysqld"]
#/usr/sbin/mysqld