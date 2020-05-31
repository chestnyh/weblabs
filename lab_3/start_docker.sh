#!/bin/bash

db_user=weblabs
db_pass=weblabs

db_root_pass=my_secret_pass
docker_container_name=web-labs-mysql

docker run --name=$docker_container_name -e MYSQL_ROOT_PASSWORD=$db_root_pass -p 3306:3306 -d mysql:5.7

sleep 20

docker exec -it $docker_container_name mysql --user="root" --password="$db_root_pass" --execute="\
CREATE DATABASE users;\
CREATE DATABASE shop;\
CREATE USER '$db_user' IDENTIFIED BY '$db_pass';\
GRANT ALL PRIVILEGES ON Users.* TO '$db_user';\
GRANT ALL PRIVILEGES ON Shop.* TO '$db_user';"