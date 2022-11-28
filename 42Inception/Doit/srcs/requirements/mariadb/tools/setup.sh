#!/bin/sh

# 세팅 되었는지 확인
cat /var/lib/mysql/.setup 2> /dev/null

if [ $? -ne 0 ]; then
  service mysql start;
  mysql -e "CREATE DATABASE IF NOT EXISTS $MARIADB_DB";
  mysql -e "CREATE USER IF NOT EXISTS '$MARIADB_USER'@'%' IDENTIFIED BY '$MARIADB_PWD'";
  mysql -e "GRANT ALL PRIVILEGES ON $MARIADB_DB.* TO '$MARIADB_USER'@'%'";
  # 이 방법으로 root세팅하면 문제 없는거 같음
  mysql -e "UPDATE mysql.user SET Password = PASSWORD('${MARIADB_ROOT_PWD}') WHERE User = 'root'"
  mysql -e "FLUSH PRIVILEGES;"
  mysqladmin -u $MARIADB_ROOT -p shutdown
  touch /var/lib/mysql/.setup
fi
exec mysqld