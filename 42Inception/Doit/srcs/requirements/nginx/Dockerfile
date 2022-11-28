FROM debian:buster

RUN apt-get update &&\
    apt-get install nginx openssl -y && \
    mkdir -p /etc/nginx/ssl /var/run/nginx && \
    openssl req -new -newkey rsa:4096 -x509 -sha256 -days 365 -nodes \
        -out /etc/nginx/ssl/gyeon.42.fr.crt \
        -keyout /etc/nginx/ssl/gyeon.42.fr.key \
        -subj "/C=KR/ST=Seoul/L=Songpa-gu/O=42/OU=42Seoul/CN=gyeon.42.fr" &&\
        chmod 600 /etc/nginx/ssl/gyeon.42.fr.crt /etc/nginx/ssl/gyeon.42.fr.key && \
        rm -rf /etc/nginx/conf.d/default.conf

#COPY conf/default.conf /etc/nginx/conf.d/default.conf
COPY conf/default.conf /tmp/default.conf
COPY tools/nginx.sh /tmp/nginx.sh
#https://localhost:443
EXPOSE 443
#WORKDIR /etc/nginx
#CMD ["nginx"]
RUN chmod +x /tmp/nginx.sh
ENTRYPOINT ["sh", "-c", "/tmp/nginx.sh"]