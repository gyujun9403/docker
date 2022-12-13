sleep 5;
cat /var/lib/wordpress/.setup 2> /dev/null

if [ $? -ne 0 ]; then
  sed -i "s#/run/php/php7.3-fpm.sock#0.0.0.0:9000#g" /etc/php/7.3/fpm/pool.d/www.conf
  # sed 구분 문자 변경 : https://utest.co.kr/43
  sed -i "s/database_name_here/${MARIADB_DB_NAME}/g" /var/www/wordpress/wp-config.php
  sed -i "s/username_here/${MARIADB_USER}/g" /var/www/wordpress/wp-config.php
  sed -i "s/password_here/${MARIADB_PWD}/g" /var/www/wordpress/wp-config.php
  sed -i "s/localhost/${MARIADB_HOST}/g" /var/www/wordpress/wp-config.php
  # option : https://developer.wordpress.org/cli/commands/config/create/
  wp core install --url="${WP_URL}" --title="${WP_TITLE}" --admin_user="${WP_ADMIN_USER}" --admin_password="${WP_ADMIN_PWD}" --admin_email="${WP_ADMIN_EMAIL}" --skip-email --path=/var/www/wordpress --allow-root
  wp plugin update --all --path=/var/www/wordpress --allow-root
  wp user create $WP_USER $WP_USER_EMAIL --role=author --user_pass=$WP_USER_PWD --path=/var/www/wordpress --allow-root
  touch /var/lib/wordpress/.setup
fi
# 소켓 바인딩 에러 문제 발생하여, 
#exec php-fpm7.3 -F