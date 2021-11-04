#!/bin/bash
rc-service mariadb setup > /dev/null 2>&1
openrc > /dev/null 2>&1 && rc-service mariadb start > /dev/null 2>&1
mysql --execute="CREATE DATABASE $DATABASE;"
mysql --execute="GRANT ALL PRIVILEGES ON wordpress.* TO '$USER'@'%' IDENTIFIED BY '$PASSWORD';"
mysql --execute="FLUSH PRIVILEGES;"
mysql $DATABASE < wp.sql
mysql --execute="ALTER USER 'root'@'localhost' IDENTIFIED BY '$PASSWORD'; FLUSH PRIVILEGES;"