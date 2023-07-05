FROM debian:buster

RUN apt-get update && apt-get install -y mariadb-server mariadb-client 

COPY ./tools/create_db.sh /

RUN chmod +x /create_db.sh

COPY ./conf/50-server.cnf /etc/mysql/mariadb.conf.d/

# RUN service mysql start && \
# mariadb -e "CREATE DATABASE IF NOT EXISTS ${DB_NAME}; \
# CREATE USER IF NOT EXISTS '${DB_USER}'@'%' IDENTIFIED BY '${DB_PASS}'; \
# GRANT ALL PRIVILEGES ON ${DB_NAME}.* TO '${DB_USER}'@'%'; \
# ALTER USER 'root'@'localhost' IDENTIFIED BY '${DB_ROOT}'; \
# FLUSH PRIVILEGES;"


# CMD [ "/bin/bash", "-c", "mysql_safe" ]
ENTRYPOINT [ "./create_db.sh"]
