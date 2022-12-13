FROM debian:buster

RUN apt-get update -y && apt-get upgrade -y &&\
    apt-get install procps -y && \
    apt-get install nginx openssl -y && \
    mkdir -p /etc/nginx/ssl /var/run/nginx /var/run/php/ && \
    openssl req -new -newkey rsa:4096 -x509 -sha256 -days 365 -nodes \
        -out /etc/nginx/ssl/gyeon.42.fr.crt \
        -keyout /etc/nginx/ssl/gyeon.42.fr.key \
        -subj "/C=KR/ST=Seoul/L=Songpa-gu/O=42/OU=42Seoul/CN=gyeon.42.fr" &&\
        chmod 600 /etc/nginx/ssl/gyeon.42.fr.crt /etc/nginx/ssl/gyeon.42.fr.key && \
        rm -rf /etc/nginx/conf.d/default.conf && \
        chown -R www-data:www-data /var/run/nginx /var/run/php/

COPY conf/default.conf /etc/nginx/conf.d/default.conf
COPY tools/nginx.sh /tmp/nginx.sh
RUN chmod +x /tmp/nginx.sh
EXPOSE 443
ENTRYPOINT ["sh", "-c", "/tmp/nginx.sh"]
ENTRYPOINT ["/usr/sbin/nginx", "-g", "daemon off;"]
# /usr/sbin/nginx