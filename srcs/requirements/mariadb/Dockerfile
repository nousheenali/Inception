FROM debian:buster

RUN apt-get update && apt-get install -y mariadb-server mariadb-client 

ARG DB_NAME
ARG DB_USER
ARG DB_PASS
ARG DB_ROOT
ARG AD_USER
ARG AD_PASS

COPY ./conf/50-server.cnf /etc/mysql/mariadb.conf.d/

EXPOSE 3306

RUN service mysql start && mysql -u root -e "CREATE DATABASE IF NOT EXISTS $DB_NAME;\
CREATE USER IF NOT EXISTS '${DB_USER}'@'%' IDENTIFIED BY '${DB_PASS}'; \
CREATE USER IF NOT EXISTS '${AD_USER}'@'%' IDENTIFIED BY '${AD_PASS}'; \
GRANT ALL PRIVILEGES ON ${DB_NAME}.* TO '${AD_USER}'@'%'; \
ALTER USER 'root'@'localhost' IDENTIFIED BY '${DB_ROOT}'; \
FLUSH PRIVILEGES;"

ENTRYPOINT ["/usr/bin/mysqld_safe"]