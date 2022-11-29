#sed -i 's/define( 'DB_NAME', '' )/변경할 내용/g' 파일명.txt
sed -i "s/database_name_here/${MARIADB_HOST}/g" /var/www/html/wp-config.php
sed -i "s/username_here/${MARIADB_USER}/g" /var/www/html/wp-config.php;
sed -i "s/password_here/${MARIADB_PWD}/g" /var/www/html/wp-config.php
sed -i "s/localhost/${MARIADB_HOST}/g" /var/www/html/wp-config.php
# sed 구분 문자 변경 : https://utest.co.kr/43
sed -i "s#/run/php/php7.3-fpm.sock#0.0.0.0:9000#g" /etc/php/7.3/fpm/pool.d/www.conf
#listen = /run/php/php7.3-fpm.sock
#sudo service php7.3-fpm start

# 소켓 바인딩 에러 문제 발생하여, 
exec php-fpm7.3 -F