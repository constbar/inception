#!/bin/bash
source ../../../.env

v1=$MYSQL_DATABASE
v2=$MYSQL_USER
v3=$MYSQL_PASSWORD
v4=$MYSQL_HOSTNAME

sed -e "s/database_name_here/$v1/" \
	-e "s/username_here/$v2/" \
	-e "s/password_here/$v3/" \
	-e "s/localhost_here/$v4/" \
	sample.php > config.php